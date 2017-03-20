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
	/**
	 * Metoda rejestrujaca uzytkownika
	 * @return -1 jesli wystapil blad rejestracji (zajety login), 1 jesli udalo sie zarejestrowac
	 */
	public int zarejestruj(String login, String haslo, String imie, String nazwisko, String email, int nr_telefonu) {
		PreparedStatement pstmt = null;
		try {
			//przygotowanie zapytania
			pstmt = con.prepareStatement("INSERT INTO uzytkownik(login, haslo, imie, nazwisko, email, nr_telefonu) VALUES (?,?,?,?,?,?)");
			pstmt.setString(1, login);
			pstmt.setString(2, haslo);
			pstmt.setString(3, imie);
			pstmt.setString(4, nazwisko);
			pstmt.setString(5, email);
			pstmt.setInt(6, nr_telefonu);
			//wykonanie zapytania
			pstmt.executeUpdate(); 
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			System.out.println("zduplikowane dane w bazie");
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally{
			close(pstmt);
		}
		return 1;
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
		try {
			//przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE login=? and haslo=?");
			stmt.setString(1, login);
			stmt.setString(2, haslo);
			
			//sprawdzenie czy w bazie istnieje podany uzytkownik z podanym haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			System.out.println("brak danych");
			return -1;
		} finally{
			close(rs);
			close(stmt);
		}
		
		//jesli uzytkownik istnieje i haslo pasuje zwroc 1
		return 1;
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
