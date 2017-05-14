package pl.komp.aso.sterowniki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pl.komp.aso.dto.Uzytkownik;

/**
 * Klasa sluzaca do polaczenia z baza danych
 * @author Piotrek
 */
public class SterownikPolBD {
	private Connection con = null;
	
	public SterownikPolBD() {
		try {
			//uzyskanie polaczenia z baza oraz przypisanie obiektu polaczenia
			Context envContext = new InitialContext();
			DataSource ds = (DataSource) envContext.lookup("java:/comp/env/jdbc/aso");
			con = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//-----------------------------------------------------------------------------------------------------
//	/**
//	 * Metoda rejestrujaca uzytkownika
//	 * @return -1 jesli wystapil blad rejestracji (zajety login), 1 jesli udalo sie zarejestrowac
//	 */
//	public int zarejestruj(String login, String haslo, String imie, String nazwisko, String email, int nr_telefonu) {
//		PreparedStatement pstmt = null;
//		try {
//			//przygotowanie zapytania
//			pstmt = con.prepareStatement("INSERT INTO uzytkownik(login, haslo, imie, nazwisko, email, nr_telefonu) VALUES (?,?,?,?,?,?)");
//			pstmt.setString(1, login);
//			pstmt.setString(2, haslo);
//			pstmt.setString(3, imie);
//			pstmt.setString(4, nazwisko);
//			pstmt.setString(5, email);
//			pstmt.setInt(6, nr_telefonu);
//			//wykonanie zapytania
//			pstmt.executeUpdate(); 
//		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
//			System.out.println("zduplikowane dane w bazie");
//			return -1;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return -1;
//		} finally{
//			close(pstmt);
//		}
//		return 1;
//	}
//	

	/**
	 * 
	 * @param login
	 * @param haslo
	 * @param imie
	 * @param nazwisko
	 * @param email
	 * @param nrtel
	 * @param rodzaj
	 * @return
	 */

	public boolean zarejestruj(String login, String haslo, String imie, String nazwisko, String email, String numer_telefonu, String rodzaj) {
		PreparedStatement pstmt = null;
		try {
			//przygotowanie zapytania
			pstmt = con.prepareStatement("INSERT INTO uzytkownik(login, haslo, imie, nazwisko, email, numer_telefonu, rodzaj_konta) VALUES (?,?,?,?,?,?,?)");
			pstmt.setString(1, login);
			pstmt.setString(2, haslo);
			pstmt.setString(3, imie);
			pstmt.setString(4, nazwisko);
			pstmt.setString(5, email);
			pstmt.setString(6, numer_telefonu);
			pstmt.setString(7, rodzaj);
			//wykonanie zapytania
			pstmt.executeUpdate(); 
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();

			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally{
			close(pstmt);
		}
		return true;
	}
	
	public Connection getCon() {
		return con;
	}

	/**
	 * Metoda do logowania uzytkownika do aplikacji
	 * @param login
	 * @param haslo
	 * @return 1 - jesli uzytkownik istnieje i haslo pasuje, -1 jesli brak uzytkownika lub zle haslo
	 */
	public int zaloguj(String login, String haslo) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		int odp;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE login=? and haslo=?");
			stmt.setString(1, login);
			stmt.setString(2, haslo);
			
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
			
			if(rs.getString("rodzaj_konta").equals("uzytkownik")) {
				odp=5;
			}
			else if(rs.getString("rodzaj_konta").equals("mechanik")) {
				odp=6;
			}
			else if(rs.getString("rodzaj_konta").equals("ksiegowy")) {
				odp=7;
			}
			else{
				odp=8;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("brak danych");
			odp=3;
			return 3;
		} finally{
			close(rs);
			close(stmt);
		}
		return odp;
	}
	
	public Uzytkownik[] pobierzWszystkichUzytkownikow() {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ResultSet rs2 = null;
		PreparedStatement stmt2 = null;
		int liczbaUzytkownikow;
		Uzytkownik uzytkownik[] = null;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT COUNT(*) FROM `uzytkownik` WHERE rodzaj_konta = 'mechanik'  ");
			rs = stmt.executeQuery();
			rs.next();
			liczbaUzytkownikow = rs.getInt("COUNT(*)");
			uzytkownik=new Uzytkownik[liczbaUzytkownikow];
			stmt2 = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE rodzaj_konta = 'mechanik'  ");
			rs2 = stmt.executeQuery();
			System.out.println();
			for(int i = 0; i<liczbaUzytkownikow;i++ )
			{
				rs2.next();
				uzytkownik[i].setImie(rs.getString("imie"));			
				uzytkownik[i].setNazwisko(rs.getString("nazwisko"));			
				uzytkownik[i].setLogin(rs.getString("login"));		
				uzytkownik[i].setEmail(rs.getString("email"));
				uzytkownik[i].setNrTelefonu(rs.getInt("numer_telefonu"));
				uzytkownik[i].setHaslo(rs.getString("haslo"));
			}
			
		} catch (SQLException e) {
			System.out.println("blad");
			
		} finally{
			close(rs);
			close(stmt);
			close(rs2);
			close(stmt2);
		}
		
		return uzytkownik;
	}
	
	public Uzytkownik pobierzUzytkownika(String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		Uzytkownik uzytkownik=new Uzytkownik();
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE login=? ");
			stmt.setString(1, login);
			
			
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym haslem
			rs = stmt.executeQuery();
			rs.next();
			uzytkownik.setImie(rs.getString("imie"));			
			uzytkownik.setNazwisko(rs.getString("nazwisko"));			
			uzytkownik.setLogin(rs.getString("login"));		
			uzytkownik.setEmail(rs.getString("email"));
			uzytkownik.setNrTelefonu(rs.getInt("numer_telefonu"));
			uzytkownik.setHaslo(rs.getString("haslo"));
		} catch (SQLException e) {
			System.out.println("blad");
			
		} finally{
			close(rs);
			close(stmt);
		}
		
		return uzytkownik;
	}
	
	
	public boolean czyIstniejeLogin(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp=true;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE login=? ");
			stmt.setString(1, nazwa);		
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
			System.out.println("Istnieje");
		} catch (SQLException e) {
			odp=false;
			System.out.println("Nie istnieje");
			return false;
			
		} finally{
			close(rs);
			close(stmt);
		}
		System.out.println("Koniec");
		return odp;
	}
	
	public boolean czyIstniejeEmail(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp=true;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE email=? ");
			stmt.setString(1, nazwa);		
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp=false;
			return false;
			
		} finally{
			close(rs);
			close(stmt);
		}
		return odp;
	}
	
	public boolean czyIstniejeEmailEdycja(String email,String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp=true;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE email=? and login=?");
			stmt.setString(1, email);
			stmt.setString(1, login);
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym email
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp=false;
			return false;
			
		} finally{
			close(rs);
			close(stmt);
		}
		return odp;
	}
	
	public boolean czyIstniejeNrTelefonu(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp=true;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE numer_telefonu=? ");
			stmt.setString(1, nazwa);		
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym numerem 
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp=false;
			return false;
			
		} finally{
			close(rs);
			close(stmt);
		}
		return odp;
	}
	
	public boolean czyIstniejeNrTelefonuEdycja(String numer_telefonu, String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp=true;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE numer_telefonu=? and login=?");
			stmt.setString(1, numer_telefonu);	
			stmt.setString(2, login);	
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym numerem i czy nalezy on do danego uzytkownika
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");			
		} catch (SQLException e) {
			odp=false;
			return false;
			
		} finally{
			close(rs);
			close(stmt);
		}
		return odp;
	}
	
	//zmiana danych uzytkownika
	public boolean edytujUstawienia(String haslo2,String imie,String nazwisko,String email,String numer_telefonu,String login){
		boolean odp=true;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE Uzytkownik SET haslo = ?, imie= ?,nazwisko=?,email=?,numer_telefonu=? WHERE login = ?");
			stmt.setString(1, haslo2);	
			stmt.setString(2, imie);	
			stmt.setString(3, nazwisko);
			stmt.setString(4, email);
			stmt.setString(5, numer_telefonu);
			stmt.setString(6, login);
			rs = stmt.executeQuery();
			rs.next();		
		} catch (SQLException e) {
			odp=false;
			return false;
			
		} finally{
			close(rs);
			close(stmt);
		}
		return odp;
	}
	
	//-----------------------------------------------------------------------------------------------------
	
	/**
	 * Metoda zamykajaca obiekt result set
	 * @param rs obiekt jaki zamykamy
	 */
	public static void close(ResultSet rs) {
		try
        {
            if (rs != null)
            {
                rs.close();
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
	}
	
	/**
	 * Metoda zamykajaca obiekt statement
	 * @param stmt obiekt jaki zamykamy
	 */
	public static void close(Statement stmt) {
		try
        {
            if (stmt != null)
            {
                stmt.close();
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
	}
}