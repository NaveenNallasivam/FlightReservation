package Main;
import java.io.IOException;
import java.net.URI;
import java.net.http.*;

public class apiCall {
	HttpResponse<String> temperature;
	public  HttpResponse<String> callWeatherApi() throws IOException, InterruptedException {
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create("https://community-open-weather-map.p.rapidapi.com/weather?q=London%2Cuk&lat=0&lon=0&callback=test&id=2172797&lang=null&units=imperial&mode=xml"))
				.header("x-rapidapi-host", "community-open-weather-map.p.rapidapi.com")
				.header("x-rapidapi-key", "5385aa3d75msh90a707c7f111a18p159f94jsn62841641ade8")
				.method("GET", HttpRequest.BodyPublishers.noBody())
				.build();
		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		return response;
	}

}
