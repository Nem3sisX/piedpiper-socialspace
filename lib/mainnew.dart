import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialspace/screens/main_screen.dart';
import 'package:socialspace/util/const.dart';

void main() async {
  runApp(MainPageHome());
}

class MainPageHome extends StatefulWidget {
  @override
  _MainPageHomeState createState() => _MainPageHomeState();
}

class _MainPageHomeState extends State<MainPageHome> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: MainScreen(),
    );
  }
}


















//
//import 'package:flutter/material.dart';
//import 'package:splashscreen/splashscreen.dart';
//import 'package:flutter/services.dart';
//import 'package:socialspace/util/const.dart';
//
//import 'main.dart';
//import 'mainnew.dart';
//void main(){
//  runApp(new MaterialApp(
//    home: new MyApp(),
//      debugShowCheckedModeBanner: false
//  ));
//}
//
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => new _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  @override
//  Widget build(BuildContext context) {
//    return new SplashScreen(
//        seconds: 4,
//        navigateAfterSeconds: new MainPageHome(),
//        title: new Text('socialspace',
//          style: new TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 40.0
//          ),),
//        image: new Image.asset('assets/socialspace_icon.png'),
//        backgroundColor: Colors.white,
//        styleTextUnderTheLoader: new TextStyle(),
//        photoSize: 100.0,
//        onClick: ()=>print("socialspace"),
//        loaderColor: Colors.red
//    );
//  }
//}
//
//class AfterSplash extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//          title: new Text("Welcome In SplashScreen Package"),
//          automaticallyImplyLeading: false
//      ),
//      body: new Center(
//        child: new Text("Done!",
//          style: new TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 30.0
//          ),),
//
//      ),
//    );
//  }
//}
