/**
 * return api data
 */
function loadFlightDetails(){
	alert("hai");
	const settings = {
	"async": true,
	"crossDomain": true,
	"url": "https://travel-advisor.p.rapidapi.com/locations/v2/auto-complete?query=pollachi&lang=en_US&units=km",
	"method": "GET",
	"headers": {
		"X-RapidAPI-Host": "travel-advisor.p.rapidapi.com",
		"X-RapidAPI-Key": "5385aa3d75msh90a707c7f111a18p159f94jsn62841641ade8"
	}
};

$.ajax(settings).done(function (response) {
	console.log(response);
	alert(response);
});
}