import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/home_screen.dart';
import '../screens/no_internet_screen.dart';
import '../services/random_cities.dart';
import '../services/weather.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final WeatherModel weatherModel = WeatherModel();
  final TextEditingController _controller = TextEditingController();
  String? randomCity;
  String cityName = '';

  @override
  void initState() {
    super.initState();
    randomCity = RandomCities().getCityNames(); // Generate once
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  void _handleSearch() async {
    FocusScope.of(context).unfocus(); // Close the keyboard

    if (cityName.trim().isEmpty) {
      _controller.clear();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please enter a city name!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          backgroundColor: Colors.orangeAccent,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: MediaQuery.of(context).size.width * 0.006,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
      return;
    }

    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NoInternetScreen(),
        ),
      );
    } else {
      // ✅ Fetch weather data if internet is available
      var weatherData = await weatherModel.getCityWeather(cityName);
      _controller.clear(); // Clear the input field after search

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(locationWeather: weatherData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      margin: EdgeInsets.fromLTRB(
        width * 0.06,
        height * 0.01,
        width * 0.06,
        height * 0.016,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: width * 0.008,
        ),
        color: Colors.white70,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: width * 0.077,
            color: Colors.blue,
          ),
          SizedBox(width: width * 0.009),
          Expanded(
            child: TextField(
              controller: _controller,
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search $randomCity Here...",
              ),
              onChanged: (value) => cityName = value,
              onSubmitted: (_) =>
                  _handleSearch(), // Show results on tapping enter button on the keyboard
            ),
          ),
          GestureDetector(
            onTap: _handleSearch,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: width * 0.049,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
