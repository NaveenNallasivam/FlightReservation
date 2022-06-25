/**
 *returns JSON with weather details 
 */
  function getWeather(){
	  const settings = {
				"async": true,
				"crossDomain": true,
				"url": "https://community-open-weather-map.p.rapidapi.com/weather?q=London%2Cuk&lat=0&lon=0&callback=test&id=2172797&lang=null&units=imperial&mode=xml",
				"method": "GET",
				"headers": {
					"X-RapidAPI-Host": "community-open-weather-map.p.rapidapi.com",
					"X-RapidAPI-Key": "5385aa3d75msh90a707c7f111a18p159f94jsn62841641ade8"
				}
			};

			$.ajax(settings).done(function (response) {
				console.log(response);
				//var obj=JSON.parse(response);
				var weather=response;
				var tmp=weather.slice(weather.indexOf("temp")+6,weather.indexOf("temp")+11);
				document.getElementById("temp").innerHTML="London:"+tmp+" F";
			});  
  }