import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class Sewa extends StatelessWidget {
  int index;
  Sewa({this.index});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sewa Pemandumu', style: TextStyle(color: Constant().blueTheme, fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Constant().blueTheme),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Hero(tag: 'foto${index}',child:ClipOval(child: SizedBox(width: 90, height: 90,child: Image.asset(Constant().pemandu[index].foto, fit: BoxFit.cover,))),),
                    SizedBox(width: 30,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(tag: 'nama${index}', child: Text(Constant().pemandu[index].nama, style: TextStyle(fontSize: width * 0.042,  color: Constant().blueTheme, fontWeight: FontWeight.w700))),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            children: [
                              Hero(tag: 'star${index}', child: Icon(Icons.star, color: Constant().blueTheme, size: 15,)),
                              Hero(
                                tag: 'rating${index}',
                                child: Text(
                                  Constant().pemandu[index].rating,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Constant().blueTheme,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('Lihat Profil', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white,),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 450,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black12)]),
                child: PemanduForm(),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOTAL:', style: TextStyle(fontSize: width * 0.042,  color: Constant().blueTheme, fontWeight: FontWeight.w700)),
                        SizedBox(height: 5,),
                        Text('Rp. 300.000,-', style: TextStyle(fontSize: width * 0.042,  color: Color(0xFFEF0F0F), fontWeight: FontWeight.w700)),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('Lihat Detail', style: TextStyle(fontSize: width * 0.032,  color: Constant().blueTheme,),),
                            GestureDetector(child: Icon(Icons.navigate_next, color: Constant().blueTheme,),)
                          ],
                        )
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            color: Color(0xFFFFBC0E),
                            child: Text('SEWA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PemanduForm extends StatefulWidget {
  @override
  _PemanduFormState createState() => _PemanduFormState();
}

class _PemanduFormState extends State<PemanduForm> {

  DateTime _fromDate = DateTime.now();
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Yuk Atur Pemandumu!', style: TextStyle(fontSize: width * 0.042,  color: Constant().blueTheme, fontWeight: FontWeight.w700)),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DateForm(width),
                  SizedBox(width: 20,),
                  WaktuForm(width),
                  SizedBox(width: 20,),
                ],
              ),
            ),
          LowerForm(width, 'Ketemuan Di Mana?', 'Jalan Danau Ranau No. 1A Sawojajar', 1),
          LowerForm(width, 'Ada Catatan Khusus?', 'Ketemuan deket pasar sawojajar mas. Nanti saya tunggu di sana', 2),
          CheckboxListTile(value: _checked, onChanged: (bool val){setState(() {
            _checked = val;
          });}, title: Text('*Saya setuju dengan syarat dan ketentuan' ,style: TextStyle(fontSize: width * 0.029,  color: Constant().blueTheme)), controlAffinity: ListTileControlAffinity.leading,),
      ],
    );
  }

  Future<void> _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
    }
  }

  Widget DateForm (double width){
    return Expanded(
      child: Container(
        height: 140,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Atur Tanggalnya!', style: TextStyle(fontSize: width * 0.038,  color: Constant().blueTheme, fontWeight: FontWeight.w700)),
                  GestureDetector(child: Icon(Icons.calendar_today, color: Constant().blueTheme, size: width * 0.050,), onTap: (){_showDatePicker();})
                ],
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: TextFormField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: '${Constant().bulan[_fromDate.month-1]} ${_fromDate.day}, ${_fromDate.year}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget WaktuForm(double width){
    return Expanded(
      child: Container(
        height: 140,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mau Berapa Lama?', style: TextStyle(fontSize: width * 0.038,  color: Constant().blueTheme, fontWeight: FontWeight.w700,), textAlign: TextAlign.center,),
            Row(
              children: [
                    Expanded(
                      child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '1',
                            ),
                          ),
                    ),
                    SizedBox(width: 10,),
                    Text('Jam', style: TextStyle(fontSize: width * 0.038),),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextFormField( 
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isCollapsed: false,
                          hintText: '20',
                        ),
                      ),
                    ),
                      SizedBox(width: 10,),
                      Text('Menit', style: TextStyle(fontSize: width * 0.038),),
                  ],
                ),
          ],
        ),
      ),
    );
  }

  Widget LowerForm(double width, String title, String description, int lines){
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: width * 0.038,  color: Constant().blueTheme, fontWeight: FontWeight.w700,), textAlign: TextAlign.center,),
            Expanded(
                  child: TextFormField(
                    maxLines: lines,
                    decoration: InputDecoration(
                      hintText: description,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

