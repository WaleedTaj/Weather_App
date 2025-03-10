import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/widgets/about.dart';
import '../services/weather.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // Getting the users current location and pass to the location screen for display data
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background image.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/app icon.jpg",
                    // height: height * 0.4,
                    width: width * 0.4,
                  ),
                  Text(
                    "Weather App",
                    style: TextStyle(
                      fontSize: width * 0.1,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'AsapCondensed',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Text(
                    "Getting Your Location...",
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'AsapCondensed',
                      color: Colors.white,
                    ),
                  ),

                  // Loading Indicator
                  SpinKitDoubleBounce(
                    color: Colors.white,
                    size: width * 0.16,
                  ),
                ],
              ),
            ),

            // Displaying About
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                About(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
