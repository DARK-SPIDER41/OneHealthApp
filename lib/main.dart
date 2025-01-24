import 'package:flutter/material.dart';
import 'package:one_health/screens/welcome_screen.dart';

import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:one_health/screens/home_screen.dart';
import 'package:one_health/additions/welcome_Doctor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the platform-specific WebView implementation
  if (WebViewPlatform.instance == null) {
    WebViewPlatform.instance = AndroidWebViewPlatform();
  }

  runApp(MyApp());
  // WidgetsFlutterBinding.ensureInitialized();
  // WebViewPlatform.instance = SurfaceAndroidWebView(); // Use SurfaceView for Android
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomeScreen(),
      home: DoctorPageApp(),
    );

    // return MaterialApp(
    //   title: 'Flutter Blockchain App',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Blockchain Interaction'),
    //     ),
    //     body: Center(
    //       child: ElevatedButton(
    //         onPressed: () {
    //           // Create an instance of BlockchainService
    //           final blockchainService = BlockchainService();

    //           // Replace with an actual Ethereum address
    //           blockchainService.getAccountBalance(
    //               '0x2d2b0c7eae5277696edeb538adc6015cd0dc4c39');
    //         },
    //         child: Text('Check Balance'),
    //       ),
    //     ),
    //   ),
    // );
  }
}
// import 'package:flutter/material.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:one_health/screens/home_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Set the platform-specific WebView implementation
//   if (WebViewPlatform.instance == null) {
//     WebViewPlatform.instance = AndroidWebViewPlatform();
//   }

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'One Health App',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: HomeScreen(), // Ensure HomeScreen is imported
//     );
//   }
// }
