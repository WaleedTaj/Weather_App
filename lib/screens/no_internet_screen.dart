import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_container.dart';

import '../main.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
            Row(
              children: [
                // App icon display
                SizedBox(
                  height: height * 0.2, // 15% of screen height
                  width: width * 0.34, // 30% of screen width
                  child: Image.asset('assets/images/app icon.jpg'),
                ),
                SizedBox(
                  height: height * 0.118,
                ),
                Text(
                  "Weather App",
                  style: TextStyle(
                    fontSize: width * 0.11,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'AsapCondensed',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    widget: Icon(
                      Icons.wifi_off,
                      size: width * 0.35,
                      color: Colors.orangeAccent,
                    ),
                    padding: EdgeInsets.all(width * 0.02),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    "No Internet Connection!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Saira',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      "Please check your network settings.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckConnection(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: width * 0.006,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.015,
                        horizontal: width * 0.07,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Retry",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
