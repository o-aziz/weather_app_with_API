import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data.model.dart';

Future fetchData({required String city}) async {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };
  String baseUrl =
      "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=48127d16e141a9325a73107afeb88441";
  final Uri uri = Uri.parse(baseUrl);
  final http.Response response = await client.get(
    uri,
    headers: headers,
  );
  final statusCode = response.statusCode;
  final body = response.body;

  if (statusCode == 200) {
    var modelledData = WeatherData.fromJson(jsonDecode(body));
    var weather = modelledData.weather;
    var humidity = modelledData.main.humidity;
    var visibility = modelledData.visibility;
    var temp = modelledData.main.temp;
    var windSpeed = modelledData.wind.speed;
    // print(weather[0].main);
    // print(humidity.toString());
    // print(visibility.toString());

    return [weather, humidity, visibility, temp, windSpeed];
  } else {
    return false;
  }
}
