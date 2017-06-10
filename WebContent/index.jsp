<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>

<jsp:include page="header.jsp" />

<div class="container marketing">

	<div class="row featurette">
		<%
			String blad = (String) request.getAttribute("blad");
		%>
		<%
			if (blad != null && !blad.equals("")) {
		%>
		<div class="alert alert-success" align="center">
			<%=blad%>
		</div>
		<%
			}
		%>
		<div class="col-md-7">

			<h2 class="featurette-heading">
				KOŚKA - Autoryzowane centrum serwisowe samochodów marki <span
					class="text-muted">VOLKSWAGEN.</span>
			</h2>
			<p class="lead">Oferujemy pełen zakres usług gwarancyjnych i
				pogwarancyjnych: przeglądowych, mechanicznych, blacharsko -
				lakierniczych, elektrycznych i elektronicznych w jednym miejscu – w
				tym także zgłaszanie i likwidacje szkód komunikacyjnych we
				wszystkich Towarzystwach Ubezpieczeniowych.</p>
		</div>
		<div class="col-md-5">
			<img class="featurette-image img-responsive center-block"
				data-src="holder.js/500x500/auto" src="vw2.jpg"
				alt="Błąd wczytywania obrazka." data-holder-rendered="true"
				vspace=30>
		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7 col-md-push-5">
			<h2 class="featurette-heading">
				Najwyższa jakość usług <span class="text-muted">Sprawdź sam.</span>
			</h2>
			<p class="lead">Dla potwierdzenia najwyższej jakości oferowanych
				przez nas usług, uzyskaliśmy certyfikaty jakości ISO 9001:2000 od
				Polskiego Centrum Badań i Certyfikacji w roku 2001, a w roku 2006 od
				firmy TUV AUTOMOTIVE.</p>
		</div>
		<div class="col-md-5 col-md-pull-7">
			<img class="featurette-image img-responsive center-block"
				data-src="holder.js/500x500/auto" src="tuv.png"
				alt="Błąd wczytywania obrazka." data-holder-rendered="true"
				width="300" height="300">
		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">
				Assistance 24h. <span class="text-muted">Dla Twojej wygody.</span>
			</h2>
			<p class="lead">Dla Państwa bezpieczeństwa oraz wygody
				stworzyliśmy usługę “Assistance 24h”, w skład której, wchodzi między
				innymi całodobowe holowanie samochodów do naszych serwisów.
				Wystarczy jeden telefon:</p>
		</div>
		<div class="col-md-5">
			<img class="featurette-image img-responsive center-block"
				data-src="holder.js/500x500/auto" src="ekipa.jpg"
				alt="Błąd wczytywania obrazka." data-holder-rendered="true"
				vspace=30>
		</div>
	</div>

	<hr class="featurette-divider">

	<jsp:include page="footer.jsp" />