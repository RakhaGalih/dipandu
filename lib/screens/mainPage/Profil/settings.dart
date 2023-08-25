import 'package:dipandu/screens/mainPage/Beranda/beranda.dart';
import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:dipandu/screens/mainPage/Profil/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SharedPreferences _prefs;
  String _nama = 'anonim';

  Future<Null> _setPref(String nama) async {
    _prefs = await SharedPreferences.getInstance();
    await this._prefs.setString('nama', nama);
  }

  void _loadTaskPref() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      this._nama = this._prefs.getString('nama') ?? 'anonim';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadTaskPref();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    _setPref(null);
                  }),
              IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
              Container(
                color: Colors.blue,
                child: Text('kucing menangis'),
              ),
            ])));
  }
}
