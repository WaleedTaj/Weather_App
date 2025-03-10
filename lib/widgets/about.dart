import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: width * 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Developed By: Waleed Taj",
              style: TextStyle(
                fontFamily: 'Saira',
                fontSize: width * 0.032,
                color: Color(0xFF72ACDA),
              ),
            ),
            Text(
              "Data Provided By: openweathermap.org",
              style: TextStyle(
                fontFamily: 'Saira',
                fontSize: width * 0.032,
                color: Color(0xFF72ACDA),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
