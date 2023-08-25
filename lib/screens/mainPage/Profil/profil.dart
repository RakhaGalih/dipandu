import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:dipandu/screens/mainPage/Profil/settings.dart';
import 'package:flutter/material.dart';



class ProfilAppBar extends StatelessWidget {
  String nama;
  Function onSettingsClick;
  ProfilAppBar({this.nama, this.onSettingsClick});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(child:
    Padding(
        padding: EdgeInsets.all(15),
        child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Profil', style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 15),
                      Hero(tag: 'profil',
                        child: ClipOval(child: SizedBox(width: 90,
                            height: 90,
                            child: Image.asset(
                              'assets/faces/ToyFaces_Colored_BG_56.jpg',
                              fit: BoxFit.cover,))),),
                      SizedBox(height: 20,),
                      Text(nama, style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Kedungwaru, Tulungagung', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListProfile(text: 'Rekreasi', jumlah: 2),
                          SizedBox(width: width * 0.20,),
                          ListProfile(text: 'Menyewa', jumlah: 2),
                          SizedBox(width: width * 0.20,),
                          ListProfile(text: 'Disimpan', jumlah: 12),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.settings, color: Constant().blueTheme,),
                    onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context) => Settings()));},
                  )
              )
            ]
        )
    )
    );
  }
}

class ListProfile extends StatelessWidget {
  int jumlah;
  String text;
  ListProfile({this.text, this.jumlah});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$jumlah', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Constant().blueTheme,),),
        Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),),
      ],
    );
  }
}
