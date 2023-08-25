import 'package:dipandu/screens/mainPage/Beranda/beranda.dart';
import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:dipandu/screens/stepper/stepper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato', primaryColor: Constant().blueTheme, errorColor: Color(0xFFEF0F0F), buttonColor: Color(0xFFFFBC0E), dialogTheme: DialogTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),)),  inputDecorationTheme: InputDecorationTheme(fillColor: Constant().blueTheme,)),
      title: 'DiPandu',
      debugShowCheckedModeBanner: false,
      home: /*CustomSplash(
        imagePath: 'assets/Logo-DiPandu.png',
        backGroundColor: Color(0xFF9ab3f5),
        animationEffect: 'fade-in',
        logoSize: 100.0,
        duration: 2500,
        home: Splash(),
        type: CustomSplashType.StaticDuration,
      ),*/
      MySplash()
    );
  }
}

class MySplash extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MySplash> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animasi;
  SharedPreferences _prefs;
  String _nama;

  @override
  void initState(){
    // TODO: implement initState
    _loadTaskPref();
    _animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    _animasi = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc));
    _animationController.forward();

    super.initState();
  }

  void _loadTaskPref() async{
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      this._nama = this._prefs.getString('nama');
      bool login = (_nama == null)? false : true;
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => (login)? Beranda() : Splash()));
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FadeTransition(opacity: _animasi ,child: Image.asset('assets/Logo-DiPandu.png', width: MediaQuery.of(context).size.width * 0.6)),
      ),
    );
  }
}

