// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
  WeatherData(
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  );

  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        Coord.fromJson(json["coord"]),
        List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        json["base"],
        Main.fromJson(json["main"]),
        json["visibility"],
        Wind.fromJson(json["wind"]),
        Clouds.fromJson(json["clouds"]),
        json["dt"],
        Sys.fromJson(json["sys"]),
        json["timezone"],
        json["id"],
        json["name"],
        json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  Clouds(
    this.all,
  );

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord(
    this.lon,
    this.lat,
  );

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        json["lon"].toDouble(),
        json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  );

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        json["temp"].toDouble(),
        json["feels_like"].toDouble(),
        json["temp_min"].toDouble(),
        json["temp_max"].toDouble(),
        json["pressure"],
        json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Sys {
  Sys(
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  );

  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        json["type"],
        json["id"],
        json["country"],
        json["sunrise"],
        json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  Weather(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  int id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        json["id"],
        json["main"],
        json["description"],
        json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind(
    this.speed,
    this.deg,
  );

  double speed;
  int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        json["speed"],
        json["deg"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
