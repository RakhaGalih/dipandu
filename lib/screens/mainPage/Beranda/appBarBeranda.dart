import 'package:dipandu/screens/mainPage/Profil/profil.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class MyAppBar extends StatelessWidget {

  int index;
  String nama;
  Function onTapProfil;
  MyAppBar({this.index, this.onTapProfil, this.nama});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            children:[ Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomAppBar(index: index, nama: nama,)
                ),
                GestureDetector(
                  child: Hero(tag: 'profil1',child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.asset('assets/faces/ToyFaces_Colored_BG_56.jpg', width: 45, ),
                  ),
                  ),
                  onTap: onTapProfil,
                )
              ],),
              SizedBox(height: 10,),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border: Border.all(color: Color(0xFF445EE9).withOpacity(0.2),),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: (index == 0)?"Cari tempat wisata" :(index == 1)? "Cari disimpan" :(index == 2)? "Cari oleh-oleh khas" : "Cari notifikasi",
                              border: InputBorder.none,
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Color(0xFF445EE9).withOpacity(0.3),),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(icon: Icon(Icons.filter_list, color: Color(0xFF445EE9)), onPressed: null),
                    ),
                  ]
              )
            ]
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  int index;
  String nama;
  CustomAppBar({this.index, this.nama});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (index == 0)?
        Row(
          children: [
            Padding(padding: EdgeInsets.only(right: 5,),child: Icon(Icons.place, size: 20,color: Color(0xFF445EE9),)),
            Text('Malang, ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),), Text('Jawa Timur', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),),
            Expanded(child: SizedBox()),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ) : (index == 1)?
        Text('Disimpan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            : (index == 2)?
        Column(
          children: [
            Row(
              children: [
                Text('hi, ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),),
                Text(nama, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            Text('Cari oleh-oleh?', style: TextStyle(fontSize: 15,),)
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        :
        Text('Notifikasi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      ],
    );
  }
}


