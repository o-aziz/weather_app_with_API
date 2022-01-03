import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data.model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    Key? key,
    required this.humidity,
    required this.visibility,
    required this.cityName,
    required this.weather,
    required this.temperature,
    required this.windSpeed,
  }) : super(key: key);
  final String cityName;
  final int humidity, visibility;
  final Weather weather;
  final double temperature, windSpeed;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff000918),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.71,
                      width: constraints.maxWidth * 0.8,
                      decoration: BoxDecoration(
                        color: const Color(0xff1693F6).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff1693F6).withOpacity(0.4),
                            blurRadius: 10,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      width: constraints.maxWidth * 0.95,
                      decoration: BoxDecoration(
                          color: const Color(0xff1693F6),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      width: constraints.maxWidth * 0.95,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.white54,
                            Colors.white30,
                            Colors.black38,
                          ],
                          stops: [0.1, 0.5, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: constraints.maxHeight * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                widget.cityName.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: constraints.maxHeight * 0.05),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                    "https://openweathermap.org/img/wn/${widget.weather.icon}@2x.png"),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.05),
                          Text(
                            "${widget.temperature.floor()}°",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.weather.main,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.weather.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white60),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.storm_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "${widget.windSpeed.floor()} km/h",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "wind",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white60),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.water,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "${widget.humidity} %",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "humidity",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white60),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.visibility,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "${(widget.visibility / 1000).floor()} km ",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "visibility",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
