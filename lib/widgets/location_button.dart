import 'package:flutter/material.dart';
import '../main.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.bottomCenter,
        backgroundColor: Colors.orangeAccent,
        shape: const CircleBorder(),
        side: BorderSide(
          width: width * 0.006,
          color: Colors.black,
        ),
        padding: EdgeInsets.all(width * 0.03),
      ),
      onPressed: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CheckConnection(),
          ),
        );
      },
      child: Icon(
        Icons.near_me,
        color: Colors.black,
        size: width * 0.08,
      ),
    );
  }
}
