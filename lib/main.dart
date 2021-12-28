import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cuckoo/constants.dart';
import 'package:cuckoo/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.setEffect(
    effect: WindowEffect.acrylic,
    color: Color(0xDD222222),
  );

  // AudioPlayer.logEnabled = true;

  runApp(
    ProviderScope(
      child: App(),
    ),
  );

  doWhenWindowReady(() {
    final initialSize = Size(1000, 800);
    final minlSize = Size(800, 600);
    appWindow.minSize = minlSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionHandleColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: TextColor),
          bodyText2: TextStyle(color: TextColor),
          headline5: TextStyle(color: TextColor),
          headline3: TextStyle(color: TextColor, fontSize: 38, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
