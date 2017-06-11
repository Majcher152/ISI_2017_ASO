package pl.komp.aso.sterowniki;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pl.komp.aso.dto.Czesc;
import pl.komp.aso.dto.FormularzNaprawy;
import pl.komp.aso.dto.Samochod;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.dto.Zamowienie;

/**
 * Klasa sluzaca do polaczenia z baza danych
 * 
 * @author Piotrek
 */
public class SterownikPolBD {
	private Connection con = null;

	public SterownikPolBD() {
		try {
			// uzyskanie polaczenia z baza oraz przypisanie obiektu polaczenia
			Context envContext = new InitialContext();
			DataSource ds = (DataSource) envContext.lookup("java:/comp/env/jdbc/aso");
			con = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

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

	public boolean zarejestruj(String login, String haslo, String imie, String nazwisko, String email,
			String numer_telefonu, String rodzaj, String id_warsztatu) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			// przygotowanie zapytania
			pstmt = con.prepareStatement(
					"INSERT INTO uzytkownik(login, haslo, imie, nazwisko, email, numer_telefonu, rodzaj_konta) VALUES (?,?,?,?,?,?,?)");
			pstmt.setString(1, login);
			pstmt.setString(2, haslo);
			pstmt.setString(3, imie);
			pstmt.setString(4, nazwisko);
			pstmt.setString(5, email);
			pstmt.setString(6, numer_telefonu);
			pstmt.setString(7, rodzaj);
			// wykonanie zapytania
			pstmt.executeUpdate();
			if (id_warsztatu != null) {
				// przygotowanie zapytania
				pstmt2 = con.prepareStatement(
						"INSERT INTO mechanik_warsztat(mechanik_login_fk, id_warsztatu_fk) VALUES (?,?)");
				pstmt2.setString(1, login);
				pstmt2.setString(2, id_warsztatu);
				// wykonanie zapytania
				pstmt2.executeUpdate();
			}
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();

			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			close(pstmt);
			if (id_warsztatu != null)
				close(pstmt2);
		}
		return true;
	}

	/**
	 * 
	 * @param ulica
	 * @param ilosc_stanowisk
	 * @param minuta_zamkniecia_tmp
	 * @param godzina_zamkniecia_tmp
	 * @param numer_telefonu
	 * @param email
	 * @param minuta_otwarcia_tmp
	 * @param godzina_otwarcia_tmp
	 * @param numer_budynku
	 * @param miasto
	 * @return
	 */

	public boolean zarejestrujWarsztat(String ulica, String ilosc_stanowisk, String minuta_zamkniecia_tmp,
			String godzina_zamkniecia_tmp, String numer_telefonu, String email, String minuta_otwarcia_tmp,
			String godzina_otwarcia_tmp, String numer_budynku, String miasto) {
		PreparedStatement pstmt = null;
		String adres = ulica + " " + numer_budynku;
		String godzina_otwarcia = godzina_otwarcia_tmp + ":" + minuta_otwarcia_tmp;
		String godzina_zamkniecia = godzina_zamkniecia_tmp + ":" + minuta_zamkniecia_tmp;

		try {
			// przygotowanie zapytania
			pstmt = con.prepareStatement(
					"INSERT INTO warsztat(adres, miasto, numer_telefonu, email, ilosc_stanowisk, godzina_otwarcia, godzina_zamkniecia) VALUES (?,?,?,?,?,?,?)");
			pstmt.setString(1, adres);
			pstmt.setString(2, miasto);
			pstmt.setString(3, numer_telefonu);
			pstmt.setString(4, email);
			pstmt.setString(5, ilosc_stanowisk);
			pstmt.setString(6, godzina_otwarcia);
			pstmt.setString(7, godzina_zamkniecia);
			// wykonanie zapytania
			pstmt.executeUpdate();
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();

			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			close(pstmt);
		}
		return true;
	}

	// zmiana danych uzytkownika
	public boolean edytujUstawienia(String imie, String nazwisko, String email, String numer_telefonu, String login) {

		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE `uzytkownik` SET imie= ?,nazwisko=?, email=?, numer_telefonu=? WHERE login = ?");
			stmt.setString(1, imie);
			stmt.setString(2, nazwisko);
			stmt.setString(3, email);
			stmt.setString(4, numer_telefonu);
			stmt.setString(5, login);
			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			System.out.println("TU JEST BLAD");
			return false;

		} finally {
			close(stmt);
		}
		return odp;
	}

	// zmiana danych uzytkownika, ADMIN
	public boolean zapiszEdycjeInformacji(String imie, String nazwisko, String email, String numer_telefonu,
			String login, String rodzaj_konta) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE uzytkownik SET imie= ?, nazwisko=?, email=?, numer_telefonu=?, rodzaj_konta=? WHERE login = ?");
			stmt.setString(1, imie);
			stmt.setString(2, nazwisko);
			stmt.setString(3, email);
			stmt.setString(4, numer_telefonu);
			stmt.setString(5, rodzaj_konta);
			stmt.setString(6, login);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			System.out.println("TU JEST BLAD");
			return false;
		} finally {
			close(stmt);
		}
		return odp;
	}

	// zmiana danych warsztatu, ADMIN
	public boolean zapiszEdycjeWarsztatu(String adres, String ilosc_stanowisk, String godzina_zamkniecia,
			String nrTelefonu, String email, String godzina_otwarcia, String miasto, String id) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE warsztat SET adres=?, ilosc_stanowisk= ?, godzina_zamkniecia=?, numer_telefonu=?, email=?, godzina_otwarcia=?, miasto=? WHERE id = ?");
			stmt.setString(1, adres);
			stmt.setString(2, ilosc_stanowisk);
			stmt.setString(3, godzina_zamkniecia);
			stmt.setString(4, nrTelefonu);
			stmt.setString(5, email);
			stmt.setString(6, godzina_otwarcia);
			stmt.setString(7, miasto);
			stmt.setString(8, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			System.out.println("TU JEST BLAD");
			return false;
		} finally {
			close(stmt);
		}
		return odp;
	}

	public boolean usunUzytkownikaPracownika(String imie, String nazwisko, String email) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("DELETE FROM `uzytkownik` WHERE `imie` = ? AND `nazwisko` = ? AND `email` = ?");
			stmt.setString(1, imie);
			stmt.setString(2, nazwisko);
			stmt.setString(3, email);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			System.out.println("TU JEST BLAD usunUzytkownikaPracownika");
			return false;
		} finally {
			close(stmt);
		}
		return odp;
	}

	public boolean usunWarsztat(String adres, String miasto, String id) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("DELETE FROM warsztat WHERE adres = ? AND miasto = ? AND id = ?");
			stmt.setString(1, adres);
			stmt.setString(2, miasto);
			stmt.setString(3, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			System.out.println("TU JEST BLAD usunWarsztat");
			return false;
		} finally {
			close(stmt);
		}
		return odp;
	}

	public Connection getCon() {
		return con;
	}

	/**
	 * Metoda do logowania uzytkownika do aplikacji
	 * 
	 * @param login
	 * @param haslo
	 * @return 1 - jesli uzytkownik istnieje i haslo pasuje, -1 jesli brak
	 *         uzytkownika lub zle haslo
	 */
	public int zaloguj(String login, String haslo) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		int odp;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE login=? and haslo=?");
			stmt.setString(1, login);
			stmt.setString(2, haslo);

			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");

			if (rs.getString("rodzaj_konta").equals("Uzytkownik")) {
				odp = 5;
			} else if (rs.getString("rodzaj_konta").equals("Mechanik")) {
				odp = 6;
			} else if (rs.getString("rodzaj_konta").equals("Ksiegowy")) {
				odp = 7;
			} else {
				odp = 8;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("brak danych");
			odp = 3;
			return 3;
		} finally {
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
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT COUNT(*) FROM `uzytkownik` WHERE rodzaj_konta = 'mechanik'  ");
			rs = stmt.executeQuery();
			rs.next();
			liczbaUzytkownikow = rs.getInt("COUNT(*)");
			uzytkownik = new Uzytkownik[liczbaUzytkownikow];
			stmt2 = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE rodzaj_konta = 'mechanik'  ");
			rs2 = stmt.executeQuery();
			System.out.println();
			for (int i = 0; i < liczbaUzytkownikow; i++) {
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

		} finally {
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
		Uzytkownik uzytkownik = new Uzytkownik();
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE login=? ");
			stmt.setString(1, login);

			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
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

		} finally {
			close(rs);
			close(stmt);
		}

		return uzytkownik;
	}

	public boolean czyIstniejeLogin(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE login=? ");
			stmt.setString(1, nazwa);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
			System.out.println("Istnieje");
		} catch (SQLException e) {
			odp = false;
			System.out.println("Nie istnieje");
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		System.out.println("Koniec");
		return odp;
	}

	public boolean czyIstniejeEmail(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE email=? ");
			stmt.setString(1, nazwa);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// haslem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean czyIstniejeEmailEdycja(String email, String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE email=? and login=?");
			stmt.setString(1, email);
			stmt.setString(2, login);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// email
			rs = stmt.executeQuery();
			rs.next();

			System.out.println(rs.getString("login"));
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean czyIstniejeNrTelefonu(String nazwa) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE numer_telefonu=? ");
			stmt.setString(1, nazwa);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// numerem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean czyIstniejeNrTelefonuEdycja(String numer_telefonu, String login) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM `uzytkownik` WHERE numer_telefonu=? and login=?");
			stmt.setString(1, numer_telefonu);
			stmt.setString(2, login);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// numerem i czy nalezy on do danego uzytkownika
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("login");
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean dodajAuto(String model, String rocznik, String typ, String silnik, String login, String vin) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			String samochod_id = znajdzSamochod(model, rocznik, typ, silnik);
			if (samochod_id.equals("brak"))
				odp = false;
			else {
				stmt = con.prepareStatement(
						"INSERT INTO uzytkownik_samochod(Uzytkownik_login_fk,Samochod_if_fk,vin,warsztat_id_fk) VALUES (?,?,?,?)");
				stmt.setString(1, login);
				stmt.setString(2, samochod_id);
				stmt.setString(3, vin);
				stmt.setString(4, null);
				stmt.executeUpdate();
			}
		} catch (SQLException e) {
			odp = false;
			System.out.println("Nie udalo sie wstawic samochodu");
			return odp;

		} finally {
			close(stmt);
		}
		return odp;
	}

	public String znajdzSamochod(String model, String rocznik, String typ, String silnik) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String odp = "";
		try {
			// przygotowanie zapytania
			// String samochod_id = znajdzSamochod(model, rocznik, typ, silnik);
			stmt = con.prepareStatement(
					"Select samochod_id from samochod where model=? and rocznik=? and typ=? and silnik=?");
			stmt.setString(1, model);
			stmt.setString(2, rocznik);
			stmt.setString(3, typ);
			stmt.setString(4, silnik);
			rs = stmt.executeQuery();
			rs.next();
			odp = rs.getString("samochod_id");
		} catch (SQLException e) {
			odp = "brak";
			System.out.println("brak sam_id");
			return odp;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public ArrayList<Samochod> pobierzSamochody(String login) {
		ArrayList<Samochod> samochody = new ArrayList<Samochod>();
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select vin,model,rocznik,typ,silnik from samochod join uzytkownik_samochod on samochod.samochod_id=uzytkownik_samochod.Samochod_if_fk where uzytkownik_samochod.Uzytkownik_login_fk=?");
			stmt.setString(1, login);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Samochod s = new Samochod();
				s.setModel(rs.getString("model"));
				s.setRocznik(Integer.parseInt(rs.getString("rocznik")));
				s.setTyp(rs.getString("typ"));
				s.setSilnik(rs.getString("silnik"));
				s.setVin(rs.getString("vin"));
				samochody.add(s);
			}

		} catch (SQLException e) {
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return samochody;
	}

	public ArrayList<String> pobierzModele() {
		ArrayList<String> modele = new ArrayList<String>();
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select distinct model from samochod");
			rs = stmt.executeQuery();
			while (rs.next()) {

				modele.add(rs.getString("model"));
			}

		} catch (SQLException e) {
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return modele;
	}

	public ArrayList<String> pobierzRoczniki(String model) {
		ArrayList<String> roczniki = new ArrayList<String>();
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select distinct rocznik from samochod where model=?");
			stmt.setString(1, model);
			rs = stmt.executeQuery();
			while (rs.next()) {

				roczniki.add(rs.getString("rocznik"));
			}

		} catch (SQLException e) {
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return roczniki;
	}

	public ArrayList<String> pobierzTypy(String model, String rocznik) {
		ArrayList<String> typy = new ArrayList<String>();
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select distinct typ from samochod where model=? and rocznik=?");
			stmt.setString(1, model);
			stmt.setString(2, rocznik);
			rs = stmt.executeQuery();
			while (rs.next()) {

				typy.add(rs.getString("typ"));
			}

		} catch (SQLException e) {
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return typy;
	}

	public ArrayList<String> pobierzSilniki(String model, String rocznik, String typ) {
		ArrayList<String> silniki = new ArrayList<String>();
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select  silnik from samochod where model=? and rocznik=? and typ=?");
			stmt.setString(1, model);
			stmt.setString(2, rocznik);
			stmt.setString(3, typ);
			rs = stmt.executeQuery();
			while (rs.next()) {

				silniki.add(rs.getString("silnik"));
			}

		} catch (SQLException e) {
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return silniki;
	}

	public boolean edytujHaslo(String login, String haslo) {
		boolean odp = true;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE Uzytkownik SET haslo= ? WHERE login = ?");
			stmt.setString(1, haslo);
			stmt.setString(2, login);
			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {

			close(stmt);
		}
		return odp;
	}

	public boolean czyIstniejeVin(String vin) {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT * FROM uzytkownik_samochod WHERE vin=? ");
			stmt.setString(1, vin);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// numerem
			rs = stmt.executeQuery();
			rs.next();
			rs.getString("vin");
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean usunSamochod(String vin) {
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("DELETE from uzytkownik_samochod where vin=? ");
			stmt.setString(1, vin);
			// sprawdzenie czy w bazie istnieje podany uzytkownik z podanym
			// numerem
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(stmt);
		}
		return odp;
	}

	public ArrayList<Warsztat> pobierzWarsztaty() {
		ArrayList<Warsztat> warsztaty = new ArrayList<Warsztat>();
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select id,adres,miasto,numer_telefonu,email,godzina_otwarcia,godzina_zamkniecia,ilosc_stanowisk from warsztat");
			rs = stmt.executeQuery();
			while (rs.next()) {
				Warsztat w = new Warsztat();
				w.setAdres(rs.getString("adres"));
				w.setMiasto(rs.getString("miasto"));
				w.setNrTelefonu(rs.getString("numer_telefonu"));
				w.setEmail(rs.getString("email"));
				w.setGodzinaO(rs.getString("godzina_otwarcia"));
				w.setGodzinaZ(rs.getString("godzina_zamkniecia"));
				w.setIloscStanowisk(rs.getInt("ilosc_stanowisk"));
				w.setId(rs.getInt("id"));
				warsztaty.add(w);
			}

		} catch (SQLException e) {
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return warsztaty;
	}

	public Warsztat pobierzWarsztat(String adres) {

		ResultSet rs = null;

		PreparedStatement stmt = null;
		Warsztat w = new Warsztat();
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select id,adres,miasto,numer_telefonu,email,godzina_otwarcia,godzina_zamkniecia,ilosc_stanowisk from warsztat where adres=?");
			stmt.setString(1, adres);
			rs = stmt.executeQuery();
			rs.next();

			w.setAdres(rs.getString("adres"));
			w.setMiasto(rs.getString("miasto"));
			w.setNrTelefonu(rs.getString("numer_telefonu"));
			w.setEmail(rs.getString("email"));
			w.setGodzinaO(rs.getString("godzina_otwarcia"));
			w.setGodzinaZ(rs.getString("godzina_zamkniecia"));
			w.setIloscStanowisk(rs.getInt("ilosc_stanowisk"));
			w.setId(rs.getInt("id"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return w;
	}

	public int czyZajetaGodzina(int id, String dzien, String godzina) {
		int odp = 0;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania

			stmt = con.prepareStatement(
					"Select COUNT(*) as ile from przeglad where id_warsztatu_fk=? and data=? and godzina=? ");
			stmt.setInt(1, id);
			stmt.setString(2, dzien);
			stmt.setString(3, godzina);
			rs = stmt.executeQuery();
			rs.next();
			odp = rs.getInt("ile");
		} catch (SQLException e) {
			e.printStackTrace();
			odp = -1;
			return odp;

		} finally {
			close(rs);
			close(stmt);
		}
		return odp;
	}

	public boolean zarezerwujPrzeglad(String vin, int id, String dzien, String godzina) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("INSERT INTO przeglad(id_warsztatu_fk,vin_fk,data,godzina) VALUES (?,?,?,?)");
			stmt.setInt(1, id);
			stmt.setString(2, vin);
			stmt.setString(3, dzien);
			stmt.setString(4, godzina);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			odp = false;
			System.out.println("Nie udalo sie zarezerwowac terminu");
			return odp;

		} finally {
			close(stmt);
		}
		return odp;
	}

	public ArrayList<FormularzNaprawy> pobierzFormularze(String login) {
		ArrayList<FormularzNaprawy> formularze = new ArrayList<FormularzNaprawy>();
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from formularz_naprawy where uzytkownik_login_fk=? order by id desc");
			stmt.setString(1, login);
			rs = stmt.executeQuery();
			while (rs.next()) {

				FormularzNaprawy f = new FormularzNaprawy();
				f.setDataOddania(rs.getString("dataoddania"));
				f.setDataOdebrania(rs.getString("dataodebrania"));
				f.setKoszt(rs.getDouble("koszt_naprawy"));
				f.setOpis(rs.getString("opis"));
				f.setPrzewidywany_czas(rs.getInt("przewid_czas_trwania"));
				f.setStatus(rs.getString("status"));
				f.setId(rs.getInt("id"));
				f.setSamochod(pobierzSamochodVin(rs.getString("vin_fk")));
				f.setWarsztat(pobierzWarsztatId(rs.getInt("warsztat_id_fk")));
				formularze.add(f);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return formularze;
	}

	public Warsztat pobierzWarsztatId(int id) {

		ResultSet rs = null;

		PreparedStatement stmt = null;
		Warsztat w = new Warsztat();
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from warsztat where id=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			rs.next();

			w.setAdres(rs.getString("adres"));
			w.setMiasto(rs.getString("miasto"));
			w.setNrTelefonu(rs.getString("numer_telefonu"));
			w.setEmail(rs.getString("email"));
			w.setGodzinaO(rs.getString("godzina_otwarcia"));
			w.setGodzinaZ(rs.getString("godzina_zamkniecia"));
			w.setIloscStanowisk(rs.getInt("ilosc_stanowisk"));
			w.setId(rs.getInt("id"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return w;
	}

	public Samochod pobierzSamochodVin(String vin) {

		ResultSet rs = null;

		PreparedStatement stmt = null;
		Samochod s = new Samochod();
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select vin,model,rocznik,typ,silnik from samochod join uzytkownik_samochod on samochod.samochod_id=uzytkownik_samochod.Samochod_if_fk where uzytkownik_samochod.vin=?");
			stmt.setString(1, vin);
			rs = stmt.executeQuery();
			rs.next();
			s.setModel(rs.getString("model"));
			s.setRocznik(Integer.parseInt(rs.getString("rocznik")));
			s.setTyp(rs.getString("typ"));
			s.setSilnik(rs.getString("silnik"));
			s.setVin(rs.getString("vin"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("brak");
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return s;
	}

	/**
	 * Zatwierdzenie rezerwacji naprawy samochodu przez ksiegowego
	 * 
	 * @param vin
	 * @param dataoddania
	 * @param przewid_czas_trwania
	 * @return
	 */
	public boolean zatwierdzRezerwacjeNaprawy(String vin, String dataoddania, String przewid_czas_trwania) {

		PreparedStatement stmt = null;

		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE `formularz_naprawy` SET `dataoddania` = ?, `przewid_czas_trwania` = ?, `status` = 'potwierdzenie' WHERE `formularz_naprawy`.`vin_fk` = ?");
			stmt.setString(1, dataoddania);
			stmt.setString(2, przewid_czas_trwania);
			stmt.setString(3, vin);
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("blad");
			return false;

		} finally {
			close(stmt);
		}
		return true;
	}

	public boolean zarezerwujNaprawe(String vin, int id, String dzien, String opis, String login) {
		boolean odp = true;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"INSERT INTO formularz_naprawy(warsztat_id_fk,vin_fk,dataoddania,opis,uzytkownik_login_fk,status) VALUES (?,?,?,?,?,'oczekiwanie')");
			stmt.setInt(1, id);
			stmt.setString(2, vin);
			stmt.setString(3, dzien);
			stmt.setString(4, opis);
			stmt.setString(5, login);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			odp = false;
			System.out.println("Nie udalo sie zarezerwowac terminu");
			return odp;

		} finally {
			close(stmt);
		}
		return odp;
	}

	public boolean edytujStatusNaprawy(int id) {
		boolean odp = true;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE formularz_naprawy SET status='warsztat' WHERE id = ?");
			stmt.setInt(1, id);
			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {

			close(stmt);
		}
		return odp;
	}

	public boolean uzupelnijFormularzNaprawy(int id, String opis, String dataodebrania, double koszt) {
		boolean odp = true;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"UPDATE formularz_naprawy SET status='zakonczone',opis=?,dataodebrania=?,koszt_naprawy=? WHERE id = ?");
			stmt.setString(1, opis);
			stmt.setString(2, dataodebrania);
			stmt.setDouble(3, koszt);
			stmt.setInt(4, id);
			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {

			close(stmt);
		}
		return odp;
	}

	public int pobierzIdWarsztatu(String login) {

		ResultSet rs = null;

		PreparedStatement stmt = null;
		int id = -1;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select id_warsztatu_fk from mechanik_warsztat where mechanik_login_fk=?");
			stmt.setString(1, login);
			rs = stmt.executeQuery();
			rs.next();
			id = rs.getInt("id_warsztatu_fk");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("brak");
			return id;

		} finally {
			close(rs);
			close(stmt);
		}
		return id;
	}

	public ArrayList<FormularzNaprawy> pobierzFormularzeMechanika(int id, String status) {
		ArrayList<FormularzNaprawy> formularze = new ArrayList<FormularzNaprawy>();
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select * from formularz_naprawy where warsztat_id_fk=? and status=? order by id desc");
			stmt.setInt(1, id);
			stmt.setString(2, status);
			rs = stmt.executeQuery();
			while (rs.next()) {

				FormularzNaprawy f = new FormularzNaprawy();
				f.setDataOddania(rs.getString("dataoddania"));
				f.setDataOdebrania(rs.getString("dataodebrania"));
				f.setKoszt(rs.getDouble("koszt_naprawy"));
				f.setOpis(rs.getString("opis"));
				f.setPrzewidywany_czas(rs.getInt("przewid_czas_trwania"));
				f.setStatus(rs.getString("status"));
				f.setId(rs.getInt("id"));
				f.setSamochod(pobierzSamochodVin(rs.getString("vin_fk")));
				f.setWarsztat(pobierzWarsztatId(rs.getInt("warsztat_id_fk")));
				formularze.add(f);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return formularze;
	}

	public FormularzNaprawy pobierzFormularz(int id) {

		ResultSet rs = null;
		FormularzNaprawy f = new FormularzNaprawy();
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from formularz_naprawy where id=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			rs.next();

			f.setDataOddania(rs.getString("dataoddania"));
			f.setDataOdebrania(rs.getString("dataodebrania"));
			f.setKoszt(rs.getDouble("koszt_naprawy"));
			f.setOpis(rs.getString("opis"));
			f.setPrzewidywany_czas(rs.getInt("przewid_czas_trwania"));
			f.setStatus(rs.getString("status"));
			f.setId(rs.getInt("id"));
			f.setSamochod(pobierzSamochodVin(rs.getString("vin_fk")));
			f.setWarsztat(pobierzWarsztatId(rs.getInt("warsztat_id_fk")));
			f.setLogin(rs.getString("uzytkownik_login_fk"));

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return f;
	}

	/**
	 * Metoda zmieniajaca cennik dla podanego id
	 * 
	 * @param id
	 * @param nazwa
	 * @param cena
	 * @return
	 */
	public boolean zmienCennik(String id, String nazwa, String cena) {

		PreparedStatement stmt = null;

		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE `cennik_podstawowy` SET `nazwa` = ?, `cena` = ? WHERE `id` = ?");
			stmt.setString(1, nazwa);
			stmt.setString(2, cena);
			stmt.setString(3, id);
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("blad");
			return false;

		} finally {
			close(stmt);
		}
		return true;
	}

	/**
	 * Metoda dodajaca pozycje do cennika w bazie danych
	 * 
	 * @param nazwa
	 * @param cena
	 * @return
	 */
	public boolean dodajCennik(String nazwa, String cena) {

		PreparedStatement stmt = null;

		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("insert into `cennik_podstawowy` (`nazwa`, `cena`) values(?,?)");
			stmt.setString(1, nazwa);
			stmt.setString(2, cena);
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("blad");
			return false;

		} finally {
			close(stmt);
		}
		return true;
	}

	public ArrayList<Czesc> pobierzCzesci(int id_warsztatu, int id_samochodu) {
		ArrayList<Czesc> czesci = new ArrayList<Czesc>();
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select c.id,c.nazwa,wc.ilosc from czesc as c join samochod_czesc as sc on c.id=sc.czesc_id_fk join warsztat_czesc as wc on c.id=wc.czesc_id_fk where wc.warsztat_id_fk=? and sc.samochod_id_fk=?");
			stmt.setInt(1, id_warsztatu);
			stmt.setInt(2, id_samochodu);
			rs = stmt.executeQuery();
			while (rs.next()) {

				Czesc c = new Czesc();
				c.setId(rs.getInt("c.id"));
				c.setIlosc(rs.getInt("wc.ilosc"));
				c.setNazwa(rs.getString("c.nazwa"));
				czesci.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return czesci;
	}

	public ArrayList<Czesc> pobierzCzesciMagazyn(int id_samochodu) {
		ArrayList<Czesc> czesci = new ArrayList<Czesc>();
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select * from czesc join samochod_czesc on czesc.id=samochod_czesc.czesc_id_fk where samochod_id_fk=?");
			stmt.setInt(1, id_samochodu);
			rs = stmt.executeQuery();
			while (rs.next()) {

				Czesc c = new Czesc();
				c.setId(rs.getInt("id"));
				c.setIlosc(rs.getInt("dostepnych_w_magazynie"));
				c.setNazwa(rs.getString("nazwa"));
				czesci.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return czesci;
	}

	public Czesc pobierzCzesc(int id_czesci, int id_warsztatu) {

		ResultSet rs = null;
		Czesc c = new Czesc();
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement(
					"Select id,ilosc,nazwa from czesc join warsztat_czesc on czesc.id=warsztat_czesc.czesc_id_fk where id=? and warsztat_id_fk=?");
			stmt.setInt(1, id_czesci);
			stmt.setInt(2, id_warsztatu);
			rs = stmt.executeQuery();
			rs.next();

			c.setId(rs.getInt("id"));
			c.setIlosc(rs.getInt("ilosc"));
			c.setNazwa(rs.getString("nazwa"));

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return c;
	}

	public Samochod pobierzSamochodId(String model, String rocznik, String typ, String silnik) {

		ResultSet rs = null;
		Samochod s = new Samochod();
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from samochod where model=? and rocznik=? and typ=? and silnik=?");
			stmt.setString(1, model);
			stmt.setString(2, rocznik);
			stmt.setString(3, typ);
			stmt.setString(4, silnik);
			rs = stmt.executeQuery();
			rs.next();

			s.setId(rs.getInt("samochod_id"));
			s.setModel(model);
			s.setRocznik(Integer.parseInt(rocznik));
			s.setSilnik(silnik);
			s.setTyp(typ);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return s;
	}

	/**
	 * Metoda dodajaca pozycje do bazy samochodow
	 * 
	 * @param model
	 * @param rocznik
	 * @param typ
	 * @param silnik
	 * @return
	 */
	public boolean dodajSamochod(String model, String rocznik, String typ, String silnik) {

		PreparedStatement stmt = null;

		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("insert into `samochod` (`model`, `rocznik`, `typ`, `silnik`) values(?,?,?,?)");
			stmt.setString(1, model);
			stmt.setString(2, rocznik);
			stmt.setString(3, typ);
			stmt.setString(4, silnik);
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("blad");
			return false;

		} finally {
			close(stmt);
		}
		return true;
	}

	public boolean aktualizujStanWarsztatu(int id_warsztatu, int id_czesci, int ile) {
		boolean odp = true;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE warsztat_czesc SET ilosc=? WHERE warsztat_id_fk=? and czesc_id_fk=?");
			stmt.setInt(1, ile);
			stmt.setInt(2, id_warsztatu);
			stmt.setInt(3, id_czesci);

			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {

			close(stmt);
		}
		return odp;
	}

	public boolean aktualizujONas(String tresc) {
		boolean odp = true;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("UPDATE informacje SET tresc=? WHERE typ_informacji='o_nas'");
			stmt.setString(1, tresc);

			stmt.executeUpdate();

		} catch (SQLException e) {
			odp = false;
			e.printStackTrace();
			return false;

		} finally {

			close(stmt);
		}
		return odp;
	}
	

	public boolean usunUzytkownika(String login) {
		PreparedStatement stmt = null;
		boolean odp = true;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("DELETE from uzytkownik where login=? ");
			stmt.setString(1, login);
			stmt.executeUpdate();
		} catch (SQLException e) {
			odp = false;
			return false;

		} finally {
			close(stmt);
		}
		return odp;
	}
	
	public Czesc pobierzCzesc(int id_czesci) {

		ResultSet rs = null;
		Czesc c = new Czesc();
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from czesc where id=?");
			stmt.setInt(1, id_czesci);
			rs = stmt.executeQuery();
			rs.next();

			c.setId(rs.getInt("id"));
			c.setIlosc(rs.getInt("dostepnych_w_magazynie"));
			c.setNazwa(rs.getString("nazwa"));
			c.setCena(rs.getDouble("cena_za_sztuke"));

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return c;
	}
	
	public int pobierzId() {

		ResultSet rs = null;
		int id;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("SELECT LAST_INSERT_ID() as id");
			rs = stmt.executeQuery();
			rs.next();
			id=rs.getInt("id");

		} catch (SQLException e) {
			e.printStackTrace();
			return -1;

		} finally {
			close(rs);
			close(stmt);
		}
		return id;
	}
	
	public boolean dodajZamowienie(String data, double koszt) {

		PreparedStatement stmt = null;

		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("insert into zamowienie (data,koszt) values(?,?)");
			stmt.setString(1,data);
			stmt.setDouble(2, koszt);
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("blad");
			return false;

		} finally {
			close(stmt);
		}
		return true;
	}
	
	public boolean dodajZamowienie(int id_zamowienia,int id_czesci,int ilosc) {

		PreparedStatement stmt = null;

		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("insert into zamowienie_czesc (zamowienie_id_fk,czesc_id_fk,ilosc) values(?,?,?)");
			stmt.setInt(1, id_zamowienia);
			stmt.setInt(2, id_czesci);
			stmt.setInt(3, ilosc);
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("blad");
			return false;

		} finally {
			close(stmt);
		}
		return true;
	}
	
	public ArrayList<Zamowienie> pobierzZamowienia() {
		ArrayList<Zamowienie> zamowienia = new ArrayList<Zamowienie>();
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from zamowienie");
			rs = stmt.executeQuery();
			Zamowienie z;
			while (rs.next()) {

				z=new Zamowienie();
				z.setId(rs.getInt("id"));
				z.setKoszt(rs.getDouble("koszt"));
				z.setData(rs.getString("data"));
				zamowienia.add(z);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return zamowienia;
	}
	
	public Zamowienie pobierzZamowienie(int id) {
		ResultSet rs = null;
		Zamowienie z;
		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select * from zamowienie where id=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			rs.next();

				z=new Zamowienie();
				z.setId(rs.getInt("id"));
				z.setKoszt(rs.getDouble("koszt"));
				z.setData(rs.getString("data"));
				
			

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return z;
	}
	
	public ArrayList<Czesc> pobierzCzesciZamowienie(int id) {
		ArrayList<Czesc> czesci = new ArrayList<Czesc>();
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try {
			// przygotowanie zapytania
			stmt = con.prepareStatement("Select ilosc,nazwa,cena_za_sztuke from zamowienie_czesc join czesc on zamowienie_czesc.czesc_id_fk=czesc.id where zamowienie_id_fk=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			Czesc c;
			while (rs.next()) {

				c=new Czesc();
				c.setCena(rs.getDouble("cena_za_sztuke"));
				c.setNazwa(rs.getString("nazwa"));
				c.setIlosc(rs.getInt("ilosc"));
				czesci.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			close(rs);
			close(stmt);
		}
		return czesci;
	}
	
	
	// -----------------------------------------------------------------------------------------------------

	/**
	 * Metoda zamykajaca obiekt result set
	 * 
	 * @param rs
	 *            obiekt jaki zamykamy
	 */
	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Metoda zamykajaca obiekt statement
	 * 
	 * @param stmt
	 *            obiekt jaki zamykamy
	 */
	public static void close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}