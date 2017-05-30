package pl.komp.aso.testy;

import org.junit.Assert;
import org.junit.Test;

import pl.komp.aso.sterowniki.SterownikRejestracji;

public class SterownikRejestracjiTest {
	
	@Test
	public void testUwierzytelnijImie() {
		SterownikRejestracji sr = new SterownikRejestracji();
				//Imie ma cyfry ( błędne znaki)
		          Assert.assertEquals(1, sr.uwierzytelnij("89saasdasdasds", null, null, null, null, null, null));
		        //Imie ma ponad 30 znaków (jest za długie)
		          Assert.assertEquals(5, sr.uwierzytelnij("abcabcabcabcabcabcabcabcabcabcabcabcabcabcbacbacbacabcabcabcabca", null, null, null, null, null, null));
		        //Imie jest równe null (nie podane)
				  Assert.assertEquals(18, sr.uwierzytelnij(null, null, null, null, null, null, null));
	}

	@Test
	public void testUwierzytelnijNazwisko() {
		SterownikRejestracji sr = new SterownikRejestracji();
		        //Nazwisko zawiera cyfry i inne znaki ( błędne znaki)
		          Assert.assertEquals(2, sr.uwierzytelnij("Kamilek", "#%^78", null, null, null, null, null));
		        //Nazwisko ma ponad 30 znaków (jest za długie)
		          Assert.assertEquals(6, sr.uwierzytelnij("Kamilek", "abcabcabcabcabcabcabcabcabcabcabcabcabcabcbacbacbacabcabcabcabca", null, null, null, null, null));
		        //Nazwisko jest równe null (nie podane)
		          Assert.assertEquals(19, sr.uwierzytelnij("Kamilek", null, null, null, null, null, null)); 
	}

	@Test
	public void testUwierzytelnijNumerTelefonu() {
		SterownikRejestracji sr = new SterownikRejestracji();
				//Numer telefonu zawiera litery (błędne znaki)
		          Assert.assertEquals(3, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "&*^", null, null, null));
		        //Numer telefonu zawiera mniej niż 9 cyfer (jest za krótkie)
		          Assert.assertEquals(11, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "000", null, null, null));
			    //Numer telefonu widnieje już w bazie danych (numer telefonu istnieje)
// baza danych    //Assert.assertEquals(16, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "123123123", null, null, null));

	}
	
	@Test
	public void testUwierzytelnijEmail() {
		SterownikRejestracji sr = new SterownikRejestracji();
				//Niepoprawny adres email(brak końcówki)
		          Assert.assertEquals(17, sr.uwierzytelnij("Kamilek", "Nowak", "emailemail@", null, null, null, null));
			   //Email widnieje już w bazie danych (email istnieje)
// baza danych    //Assert.assertEquals(15, sr.uwierzytelnij("Kamilek", "Nowak", dlaczego@placze.pl", null, null, null, null));

	}

	@Test
	public void testUwierzytelnijLogin() {
		SterownikRejestracji sr = new SterownikRejestracji();
				//Login zawiera znaki (błędne znaki)
		          Assert.assertEquals(4, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl","145256856" , "*&(kkkk<<<", null, null));
		        //Login ma ponad 30 znaków (jest za długie)
		          Assert.assertEquals(7, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "145256856", "abcabcabcabcabcabcabcabcabcabcabcabcabcabcbacbacbacabcabcabcabca", null, null));
		        //Login ma mniej niż 8 znaków (jest za krótkie)
		          Assert.assertEquals(8, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "145256856", "mal", null, null));
			    //Login widnieje już w bazie danych (login istnieje)
 // baza danych   //Assert.assertEquals(14, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "145256856", "ukasz", null, null));
	}
	
	@Test
	public void testUwierzytelnijHaslo() {
		SterownikRejestracji sr = new SterownikRejestracji();
				//Hasło ma mniej niż 8 znaków (jest za krótkie)
		          Assert.assertEquals(9, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "145256856", "loginek", "mal", null));
		      	//Hasło ma ponad 30 znaków (jest za długie)
		          Assert.assertEquals(10, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "145256856", "loginek", "abcabcabcabcabcabcabcabcabcabcabcabcabcabcbacbacbacabcabcabcabca", null));
		        //Hasło nie spełnia wymagań (jest za słabe)
		          Assert.assertEquals(12, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "145256856", "loginek", "abcABCabcccc", null));
		        //Drugie hasło wpisane błędnie (niezgodność z pierwszym hasłem)
		          Assert.assertEquals(13, sr.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "145256856", "loginek", "abc23ABCabcccc", "Abc23ABCabcccc"));     
	}

}
