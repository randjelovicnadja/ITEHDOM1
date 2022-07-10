<?php include 'konekcija.php'; ?>
<!DOCTYPE html>
 <html >
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Masaza</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />


	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,900' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/superfish.css">
	<link rel="stylesheet" href="css/style.css">


	<script src="js/modernizr-2.6.2.min.js"></script>

	</head>
	<body>
		<div id="glavni-wrapper">
		<div id="glavni-page">
		<div id="glavni-header">

      <?php include 'header.php'; ?>

		<div id="glavni-work-section">
			<div class="container">
              <h1 class="naslov text-center"> Administracija </h1>
              <button class="btn btn-primary" onclick="vratiPodatke('asc')" >Sortiraj rastuce</button>
              <button class="btn btn-primary" onclick="vratiPodatke('desc')" >Sortiraj opadajuce</button>
              <div id="ponuda">
              </div>
			</div>
		</div>
		<?php include 'footer.php'; ?>


	</div>

	</div>



	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<script src="js/main.js"></script>
  <script>
    function vratiPodatke(sort){
      var zahtev = $.ajax({
          url: "kontroler.php",
          method: "GET",
          data: { opcija : 'sort', sort: sort }
          });

        zahtev.done(function( json ) {
          var nalepi='<table class="table table-hover">';
          nalepi+='<thead>';
          nalepi+='<tr>';
          nalepi+='<th>Naziv masaze</th>';
          nalepi+='<th>Trajanje</th>';
          nalepi+='<th>Tip masaze</th>';
          nalepi+='<th>Osnovna cena</th>';
          nalepi+='<th>Ukupna cena</th>';
          nalepi+='<th>Izmeni</th>';
          nalepi+='<th>Obrisi</th>';
          nalepi+='</tr>';
          nalepi+='</thead>';
          nalepi+='<tbody>';

          $.each($.parseJSON(json), function(idx, obj) {
                  nalepi+='<tr>';
                  nalepi+='<td>'+obj.nazivMasaze+'</td>';
                  nalepi+='<td>'+obj.trajanje.trajanje+'</td>';
                  nalepi+='<td>'+obj.tip.nazivTipa+'</td>';
                  nalepi+='<td>'+obj.osnovnaCena+' RSD </td>';
                  nalepi+='<td>'+obj.ukupnaCena+' RSD </td>';
                  nalepi+='<td><a href="izmeniMasazu.php?id='+obj.masazaID+'&cena='+obj.osnovnaCena+'" class="btn btn-primary"><i class="icon-refresh2"></i></a></td>';
                  nalepi+='<td><a href="obrisiMasazu.php?id='+obj.masazaID+'" class="btn btn-danger"><i class="icon-trash2"></i></a></td>';

                  nalepi+='</tr>';
              });

          nalepi+='</tbody>';
          nalepi+='</table>';

          $("#ponuda").html(nalepi);

        });

    }

  </script>
  <script>
    vratiPodatke('asc');

  </script>

	</body>
</html>
