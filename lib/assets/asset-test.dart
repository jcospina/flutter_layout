import 'package:flutter/material.dart';
import 'dart:async'; // to use Futures
import 'package:flutter/services.dart' show rootBundle; // To use rootBundle

void main() => runApp(MyApp());

// Each flutter app has a rootBundle object for easy access to the main asset
// bundle. However it's recommended to obtain the AssetBundle for the current
// BuildContext using DefaultAssetBundle.
// Typically, you'll use DefaultAssetBundle.of() to indirectly load an asset,
// for example a JSON file, from the app's runtime rootBundle.
// Outside of a Widget context or when a handle to AssetBundle is not available
// you can use rootBundle to directly load such assets


// To use this Future in a widget we need to define a StatefulWidget
// that subscribes to it and calls setState when it returns
Future<String> loadAsset() async {
 return await rootBundle.loadString('assets/config.json');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp() {
    loadAsset().then((text) {
      debugPrint(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Assets Demo')
        ),
        body: Center(
          child: Image.asset('images/bg.jpg')
        )
      )
    );
  }
}
