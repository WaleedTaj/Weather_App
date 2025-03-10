import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/screens/no_internet_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the app in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckConnection(),
    );
  }
}

class CheckConnection extends StatefulWidget {
  const CheckConnection({super.key});

  @override
  State<CheckConnection> createState() => _CheckConnectionState();
}

class _CheckConnectionState extends State<CheckConnection> {
  @override
  void initState() {
    super.initState();
    checkInternetConnection(); // Check initially
  }

  // ✅ Function to manually check the internet connection
  Future<void> checkInternetConnection() async {
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoadingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
