import 'package:dipandu/screens/mainPage/Beranda/DetailWisata/ChatScreen/chat.dart';
import 'package:dipandu/screens/mainPage/Beranda/DetailWisata/SewaScreen/sewa.dart';
import 'package:flutter/material.dart';

import '../constant.dart';


class PemanduCard extends StatelessWidget {
  int indexP;
  PemanduCard({this.indexP});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 205,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 2.5),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: Constant().detailWisata[indexP].pemandu.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.only(left: (index == 0)?20:15, right: (index == Constant().detailWisata[indexP].pemandu.length - 1)? 20 : 0),
              child: Container(
                width: 140,
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black12)]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(tag: 'foto${Constant().detailWisata[indexP].pemandu[index]}',child:ClipOval(child: SizedBox(width: 60, height: 60,child: Image.asset(Constant().pemandu[Constant().detailWisata[indexP].pemandu[index]].foto, fit: BoxFit.cover,))),),
                    Hero(tag: 'nama${Constant().detailWisata[indexP].pemandu[index]}',child: Text(Constant().pemandu[Constant().detailWisata[indexP].pemandu[index]].nama, style: TextStyle(fontSize: 15,  color: Constant().blueTheme, fontWeight: FontWeight.w700),)),
                    Row(
                      children: [
                        Hero(tag: 'star${Constant().detailWisata[indexP].pemandu[index]}',child: Icon(Icons.star, color: Constant().blueTheme, size: 15,)),
                        Hero(tag: 'rating${Constant().detailWisata[indexP].pemandu[index]}',
                          child: Text(
                            Constant().pemandu[Constant().detailWisata[indexP].pemandu[index]].rating,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(Icons.place, size: 15,color: Constant().blueTheme),
                        Text('${Constant().pemandu[Constant().detailWisata[indexP].pemandu[index]].location} km', style: TextStyle(fontSize: 12, ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (context) => Sewa(index: Constant().detailWisata[indexP].pemandu[index],)));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Constant().blueTheme,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('Sewa', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white,),),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (context) => Chat(index: Constant().detailWisata[indexP].pemandu[index],)));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 42,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFBC0E),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.chat_bubble, color: Colors.white, size: 20,)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  String title;
  String subtitle;
  double padding;
  MyDivider({this.title, this.subtitle, this.padding});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 15),child: Divider(thickness: 1.5,)),
          Row(
            children: [
              Text(title, style: TextStyle(fontSize: 18,  color: Constant().blueTheme, fontWeight: FontWeight.w700),),
              Expanded(child: SizedBox()),
              Text('Lihat Semua', style: TextStyle(fontSize: 15,  color: Constant().blueTheme,),),
              GestureDetector(child: Icon(Icons.navigate_next, color: Constant().blueTheme,),)
            ],
          ),
          SizedBox(height: 5,),
          Text(subtitle, style:  TextStyle(color: Colors.grey, fontSize: 12,),)
        ],
      ),
    );
  }
}

class RapidCardWidget extends StatelessWidget {
  Function onClick;
  int index;
  var list;

  RapidCardWidget({this.index, this.onClick, this.list});

  final double height= 200;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: onClick,
        child: SizedBox(
          height: height,
          width: 150,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(
                        list.foto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  height: height * 0.4,
                  width: double.infinity,
                  child: Padding(padding: EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list.nama,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 13, color: Colors.grey,),
                          ),
                          Expanded(child: SizedBox(child: Align(alignment: Alignment.centerLeft,child:
                          Text(list.harga, style: TextStyle(fontWeight: FontWeight.w700,))),
                          )),
                        ]
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

