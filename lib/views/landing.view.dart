import 'package:flutter/material.dart';
import 'package:weather_app/api/fetch_weather_data.dart';
import 'package:weather_app/views/weather.view.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Image.asset(
                "assets/clear_sky.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              color: Colors.black26,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: constraints.maxWidth * 0.75,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: textEditingController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Enter City Name",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      var weatherData =
                          await fetchData(city: textEditingController.text);

                      if (weatherData != false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WeatherScreen(
                              windSpeed: weatherData[4],
                              temperature: weatherData[3],
                              weather: weatherData![0][0],
                              cityName: textEditingController.text,
                              humidity: weatherData![1],
                              visibility: weatherData![2],
                            ),
                          ),
                        );
                        print(weatherData![0][0].icon.toString());
                        print(weatherData![0][0].id.toString());
                        print(weatherData![0][0].description);
                        print(weatherData![1].toString());
                        print(weatherData![2].toString());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: EdgeInsets.only(
                              bottom: constraints.maxHeight * 0.8,
                              left: 20,
                              right: 20,
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text("city not recognized"),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: constraints.maxWidth * 0.55,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Search Weather",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
