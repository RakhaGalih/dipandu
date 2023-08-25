import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bodyBeranda.dart';
import 'card.dart';

class DetailWisataWidget extends StatelessWidget {
  int indexP;
  final double padding = 20;
  DetailWisataWidget({this.indexP});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Tempat', style: TextStyle(color: Constant().blueTheme, fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Constant().blueTheme),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Row(
                children: [
                  Text(
                    Constant().wisataCards[indexP].nama,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Constant().blueTheme,),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(Icons.star, color: Constant().blueTheme, size: 20,),
                  Text(
                    Constant().wisataCards[indexP].rating,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Constant().blueTheme,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 5,),child: Icon(Icons.place, size: 20,color: Color(0xFF445EE9),)),
                  Text(Constant().detailWisata[indexP].tempat, style: TextStyle(fontSize: 13,),),
                  Expanded(child: SizedBox()),
                  Text('${Constant().detailWisata[indexP].km} km', style: TextStyle(fontSize: 13,),),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                height: 200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                    itemCount: Constant().detailWisata[indexP].cardImage.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: EdgeInsets.only(left: 15, right: (index == Constant().detailWisata[indexP].cardImage.length - 1)? 15 : 0 ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [ Image.asset(Constant().detailWisata[indexP].cardImage[index], height : 200, width: 150,fit: BoxFit.cover),
                                Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)), color: Constant().blueTheme),
                                    child: SaveButton(index: index,)
                                ),
                            ],
                          ),
                        ),
                      );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(padding, 10, padding, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Deskripsi', style: TextStyle(fontSize: 18,  color: Constant().blueTheme, fontWeight: FontWeight.w700),),
                      Expanded(child: SizedBox()),
                      IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: (){})
                    ],
                  ),
                  Text(Constant().wisataCards[indexP].deskripsi,
                    style: TextStyle(color: Colors.grey, fontSize: 15,),
                  ),
                  SizedBox(height: padding,),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFBC0E),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('BUAT TOUR', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: "Lato"),),
                    ),
                  ),
                ],
              ),
            ),
            MyDivider('Pemandu Tersedia', 'Cari pemandu wisata untuk tempat ini'),
            PemanduCard(indexP: indexP,),
            MyDivider('Periksa Rapid Test', 'Rapid Test untuk penuhi kebutuhan berlibur'),
            Container(
              height: 200,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Constant().rapidCards.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: (index == Constant().rapidCards.length - 1)? 15 : 0 ),
                        child: RapidCardWidget(list: Constant().rapidCards[index]));
              }),
            ),
            MyDivider('Oleh - Oleh Khas', 'Lihat oleh - oleh khas daerah ini'),
            (Constant().detailWisata[indexP].olehKhas == [])?
            SizedBox(width: 0,) :
            Container(
              height: 200,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Constant().detailWisata[indexP].olehKhas.length,
                  itemBuilder: (context, index){
                    return Padding(
                        padding: EdgeInsets.only(left: 15, right: (index == Constant().detailWisata[indexP].olehKhas.length - 1)? 15 : 0 ),
                        child: RapidCardWidget(list: Constant().tokoCards[Constant().detailWisata[indexP].olehKhas[index]]));
                  }),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }


  Widget MyDivider(String title, String subtitle){
    return Padding(
      padding: EdgeInsets.all(padding),
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

  Widget MyListView (){
    return Container(
      height: 200,
      child: ListView.builder(itemBuilder: (context, index){
        return Container();
      }),
    );
  }
}



