import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: Constant().pemandu.length * 2 + 1,
        itemBuilder: (context, index){
          if(index == Constant().pemandu.length * 2){
            return SizedBox(height: 72,);
          } else if (index >= 5) {
            return MyListTile(index: index - 5,timeIndex: index,);
          } else {
            return  MyListTile(index: index, timeIndex: index,);
          }
    });
  }
}

class MyListTile extends StatelessWidget {
  int index;
  int timeIndex;
  MyListTile({this.index, this.timeIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          ClipOval(child: SizedBox(width: 60, height: 60, child: Image.asset(Constant().pemandu[index].foto, fit: BoxFit.cover,)),),
          SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constant().pemandu[index].nama,
                style: TextStyle(fontWeight: FontWeight.w700),),
              SizedBox(height: 3,),
              Text('mengirimkan pesan kepadamu',
                style: TextStyle(color: Colors.grey),),
              SizedBox(height: 3,),
              Text('${12 + timeIndex * 6} menit yang lalu',
                style: TextStyle(color: Colors.grey, fontSize: 10),),
            ],
          ),
        ],
      ),
    );
  }
}

