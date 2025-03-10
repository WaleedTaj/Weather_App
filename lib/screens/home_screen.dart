import 'package:flutter/material.dart';
import '../widgets/about.dart';
import '../widgets/custom_container.dart';
import '../widgets/location_button.dart';
import '../widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.locationWeather});

  final locationWeather;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String temperature = 'null';
  String cityName = 'null';
  String icon = 'null';
  String description = 'null';
  String airSpeed = 'null';
  String humidity = 'null';
  String feelsLike = 'null';
  String visibility = 'null';
  String pressure = 'null';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = 'This Area';
        description = 'Not Found';
        temperature = 'N/A';
        icon = '03n';
        airSpeed = 'N/A';
        humidity = 'N/A';
        feelsLike = 'N/A';
        visibility = 'N/A';
        pressure = 'N/A';
        return;
      }
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
      var getTemp = weatherData['main']['temp'];
      temperature = getTemp.toStringAsFixed(1);
      var getIcon = weatherData['weather'][0]['icon'];
      icon = getIcon.toString();
      var getAirSpeed = weatherData['wind']['speed'];
      airSpeed = getAirSpeed.toString();
      var getHumidity = weatherData['main']['humidity'];
      humidity = getHumidity.toString();
      var getFeelsLike = weatherData['main']['feels_like'];
      feelsLike = getFeelsLike.toStringAsFixed(1);
      var getVisibility = weatherData['visibility'] / 1000;
      visibility = getVisibility.toString();
      var getPressure = weatherData['main']['pressure'];
      pressure = getPressure.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final EdgeInsets containerPadding = EdgeInsets.symmetric(
      vertical: height * 0.015,
      horizontal: width * 0.012,
    );
    final EdgeInsets leftContainerMargin =
        EdgeInsets.fromLTRB(width * 0.016, 0, width * 0.045, 0);
    final EdgeInsets rightContainerMargin =
        EdgeInsets.fromLTRB(width * 0.045, 0, width * 0.016, 0);
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // Appbar of the App
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF5D85C2),
        ),
      ),

      // Body of the App
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background image.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),

        // Contents of the body
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // App icon display
                  SizedBox(
                    height: height * 0.15, // 15% of screen height
                    width: width * 0.3, // 30% of screen width
                    child: Image.asset('assets/images/app icon.jpg'),
                  ),

                  // Button for getting current location weather
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: LocationButton(),
                  ),
                ],
              ),
              Column(
                children: [
                  // App name display
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 0.020,
                      height * 0.015,
                      width * 0.005,
                      height * 0.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.118,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.24),
                          child: Text(
                            "Weather App",
                            style: TextStyle(
                                fontSize: width * 0.11,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AsapCondensed',
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search Bar
                  CustomSearchBar(),

                  // Displaying Data Contents
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Container for description and cityName
                          Row(
                            children: [
                              Expanded(
                                child: CustomContainer(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.045),
                                  padding: EdgeInsets.all(width * 0.02),
                                  widget: Row(
                                    children: [
                                      Image.network(
                                          "https://openweathermap.org/img/wn/$icon@2x.png"),
                                      SizedBox(
                                        width: width * 0.0001,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            description,
                                            style: TextStyle(
                                                fontSize: width * 0.055,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: "AnekLatin"),
                                          ),
                                          Text(
                                            "in $cityName",
                                            style: TextStyle(
                                                fontSize: width * 0.046,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Displaying the temperature and feels like in horizontal scroll view
                          Row(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      // Container for temperature
                                      SizedBox(
                                        height: height * 0.368,
                                        width: width * 0.956,
                                        child: CustomContainer(
                                          margin: EdgeInsets.fromLTRB(
                                            width * 0.045,
                                            height * 0.015,
                                            width * 0.0,
                                            height * 0.015,
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                            width * 0.04,
                                            height * 0.04,
                                            width * 0.04,
                                            0,
                                          ),
                                          widget: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    radius: width * 0.07,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage: AssetImage(
                                                        "assets/images/logo.png"),
                                                  ),
                                                  SizedBox(width: width * 0.03),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                          height:
                                                              height * 0.003),
                                                      Text(
                                                        "Temperature",
                                                        style: TextStyle(
                                                          fontSize:
                                                              width * 0.08,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "AnekLatin",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: height * 0.02),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      temperature,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: width * 0.25,
                                                        fontFamily:
                                                            "AsapCondensed",
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom:
                                                              height * 0.04),
                                                      child: Text(
                                                        "\u00B0C",
                                                        style: TextStyle(
                                                          fontSize: width * 0.1,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Container for feels like
                                      SizedBox(
                                        height: height * 0.368,
                                        width: width * 0.99,
                                        child: CustomContainer(
                                          margin: EdgeInsets.fromLTRB(
                                            width * 0.0365,
                                            height * 0.015,
                                            width * 0.045,
                                            height * 0.015,
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                            width * 0.04,
                                            height * 0.04,
                                            width * 0.075,
                                            height * 0.04,
                                          ),
                                          widget: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    radius: width * 0.08,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage: AssetImage(
                                                        "assets/images/Feels Like.png"),
                                                  ),
                                                  SizedBox(width: width * 0.04),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                          height:
                                                              height * 0.003),
                                                      Text(
                                                        "Feels Like",
                                                        style: TextStyle(
                                                          fontSize:
                                                              width * 0.085,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "AnekLatin",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: height * 0.0094),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      feelsLike,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: width * 0.25,
                                                        fontFamily:
                                                            "AsapCondensed",
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom:
                                                              height * 0.04),
                                                      child: Text(
                                                        "\u00B0C",
                                                        style: TextStyle(
                                                          fontSize: width * 0.1,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Displaying the Air Speed and Humidity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                // Container for Air Speed
                                child: CustomContainer(
                                  margin: rightContainerMargin,
                                  padding: containerPadding,
                                  widget: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: width * 0.053,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                "assets/images/9.png"),
                                          ),
                                          Text(
                                            "Air Speed",
                                            style: TextStyle(
                                              fontSize: width * 0.051,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "AnekLatin",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        airSpeed,
                                        style: TextStyle(
                                            fontSize: width * 0.1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "km/hr",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                // Container for Humidity
                                child: CustomContainer(
                                  margin: leftContainerMargin,
                                  padding: containerPadding,
                                  widget: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: width * 0.053,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                "assets/images/humidity.png"),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text(
                                            "Humidity",
                                            style: TextStyle(
                                                fontSize: width * 0.051,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "AnekLatin"),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        humidity,
                                        style: TextStyle(
                                            fontSize: width * 0.1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "percent(%)",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),

                          // Displaying the Pressure and Visibility
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                // Container for Pressure
                                child: CustomContainer(
                                  margin: rightContainerMargin,
                                  padding: containerPadding,
                                  widget: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: width * 0.053,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                "assets/images/Pressure.png"),
                                          ),
                                          Text(
                                            "Pressure",
                                            style: TextStyle(
                                              fontSize: width * 0.051,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "AnekLatin",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            pressure,
                                            style: TextStyle(
                                                fontSize: width * 0.1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "millibars(mb)",
                                                style: TextStyle(
                                                    fontSize: width * 0.035,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                // Container for Visibility
                                child: CustomContainer(
                                  margin: leftContainerMargin,
                                  padding: containerPadding,
                                  widget: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: width * 0.053,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                "assets/images/Visibility.png"),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text(
                                            "Visibility",
                                            style: TextStyle(
                                                fontSize: width * 0.051,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "AnekLatin"),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        visibility,
                                        style: TextStyle(
                                            fontSize: width * 0.1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "km",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Displaying About
                          About(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
