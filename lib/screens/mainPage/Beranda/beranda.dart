import 'package:dipandu/screens/mainPage/Beranda/appBarBeranda.dart';
import 'package:dipandu/screens/mainPage/Beranda/bodyBeranda.dart';
import 'package:dipandu/screens/mainPage/Beranda/bottomnav.dart';
import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:dipandu/screens/mainPage/Notifikasi/notifikasi.dart';
import 'package:dipandu/screens/mainPage/Profil/profil.dart';
import 'package:dipandu/screens/mainPage/Profil/settings.dart';
import 'package:dipandu/screens/mainPage/Simpan/simpan.dart';
import 'package:dipandu/screens/mainPage/Toko/toko.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appBarBeranda.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animasi;
  //Shared Preferensces
  String _nama = 'anonim';
  SharedPreferences _prefs;

  Future<Null> _setPref(String nama) async {
    _prefs = await SharedPreferences.getInstance();
    await this._prefs.setString('nama', nama);
  }

  void _loadTaskPref() async{
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      this._nama = this._prefs.getString('nama') ?? 'anonim';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTaskPref();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    _animasi = Tween(begin: 135.0, end: 300.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInCirc));
    _animationController.addListener(() {

      this.setState((){});

    });
    _controller.addListener(() {
      setState(() {
        if(currentPage == 4){
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  int currentPage = 0;
  double _appBarHeight = 135;
  PageController _controller = PageController();
  _onchanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(child: AnimatedCrossFade(
        duration: Duration(milliseconds: 300),
        crossFadeState: (currentPage == 4)? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: MyAppBar(nama: _nama, index: currentPage, onTapProfil: (){
            setState(() {
              _controller.animateToPage(
                  4,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint);
            });
          },) ,
        secondChild: ProfilAppBar(
            nama: _nama,),
      ), preferredSize: Size.fromHeight(_animasi.value)),
      body:Stack(children:[
              PageView(scrollDirection: Axis.horizontal,
                onPageChanged: _onchanged,
                controller: _controller,
                children: [
                  BodyBeranda(profil: false,),
                  Simpan(),
                  Toko(),
                  Notifikasi(),
                  BodyBeranda(profil: true,)
                ]
            ), Align(alignment: Alignment.bottomCenter,child: MyBottomBarBeranda(currentPage, _controller,)) ]),
    );
  }

  Widget SettingsWidget() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pengaturan',
            style: TextStyle(
                color: Constant().blueTheme, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Constant().blueTheme),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    _setPref("anjay");
                  }),
              IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
              Container(
                color: Colors.blue,
                child: Text('kucing menangis'),
              ),
            ])));
  }

  Widget MyBottomBarBeranda (int page, PageController controller){
    List<BottomBarItem> bottomBarItems = [
      BottomBarItem(icon: Icons.home, title: 'Beranda'),
      BottomBarItem(icon: Icons.turned_in, title: 'Simpan'),
      BottomBarItem(icon: Icons.shopping_basket, title: 'Toko'),
      BottomBarItem(icon: Icons.notifications, title: 'Notifikasi'),
      BottomBarItem(icon: Icons.person, title: 'Profil'),
    ];
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 5,
            )
          ]
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(bottomBarItems.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);
                  });
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(bottomBarItems[index].icon, color: (index == currentPage)? Color(0xFF445EE9) : Colors.grey, size: (index == currentPage)? 30 : 25,),
                      Text(bottomBarItems[index].title, style: TextStyle(fontSize: (index == currentPage)? 12 : 10, color: (index == currentPage)? Color(0xFF445EE9) : Colors.grey),)
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
