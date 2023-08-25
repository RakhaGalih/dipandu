import 'package:dipandu/screens/auth/auth.dart';
import 'package:dipandu/screens/mainPage/Beranda/DetailWisata/detailWisata.dart';
import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyBeranda extends StatefulWidget {
  bool profil;
  BodyBeranda ({this.profil});
  @override
  _BodyBerandaState createState() => _BodyBerandaState(profil: profil);
}

class _BodyBerandaState extends State<BodyBeranda> {
  bool profil;
  _BodyBerandaState({this.profil});
  int _selectedFilter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedFilter = 0;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
        (profil)? Container() : Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Container(
              height: 35,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: Constant().filter.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: (index == Constant().filter.length-1)? 15 : 0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            _selectedFilter = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: (index == _selectedFilter)? Color(0xFF445EE9) : Colors.grey[100],
                              border: Border.all(color: Color(0xFF445EE9).withOpacity(0.3),),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(Constant().filter[index], style: TextStyle(color: (index == _selectedFilter)?  Colors.white : Color(0xFF445EE9)),),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text((profil)? 'Rekreasi Sebelumnya' : 'Favorit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Constant().blueTheme,),),
                Expanded(child: SizedBox()),
                Text('Lihat Semua', style: TextStyle(fontSize: 15,  color: Constant().blueTheme,),),
                GestureDetector(child: Icon(Icons.navigate_next, color: Constant().blueTheme,),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: List.generate(Constant().wisataCards.length, (index) {
                return WisataCardWidget(onClick: (){}, index: index);
              }),
            ),
          ),
          SizedBox(height: 60,)
        ]
    );
          /*;} else {
            return WisataCardWidget(onClick: (){}, index: index - 1,);   });*/
  }
}

class WisataCardWidget extends StatelessWidget {
  Function onClick;
  int index;
  WisataCardWidget ({this.onClick, this.index,});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: GestureDetector(
            onTap: onClick,
            child: Container(
              color: Constant().blueTheme,
              height: 350.0,
              child: Stack(
                clipBehavior: Clip.antiAlias,
                overflow: Overflow.clip,
                children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child:  Container(
                        height: 350/2,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(
                              Constant().wisataCards[index].foto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)), color: Constant().blueTheme),
                      child: SaveButton(index: index,)
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: 175.0,
                      width: double.infinity,
                      child: Padding(padding: EdgeInsets.all(15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Row(
                            children: [
                              Text(
                                Constant().wisataCards[index].nama,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Constant().blueTheme,),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(Icons.star, color: Constant().blueTheme, size: 20,),
                              Text(
                                Constant().wisataCards[index].rating,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Constant().blueTheme,),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                              SizedBox(height: 10,),
                              Text(
                                Constant().wisataCards[index].deskripsi,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, new MaterialPageRoute(
                                          builder: (context) => DetailWisataWidget(indexP: index,)));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                          color: Color(0xFFFFBC0E),
                                          child: Text('Lihat Detail', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),)),
                                  ),
                                ),
                                ),
                        ]
                        ),
                      ),
                    ),
                  )
                  ],
              ),
            ),
          )
      ),
    );
  }
}

class SaveButton extends StatefulWidget {
  int index;
  SaveButton({this.index});
  @override
  _SaveButtonState createState() => _SaveButtonState(index: index);
}

class _SaveButtonState extends State<SaveButton> {

  int index;
  _SaveButtonState({this.index});
  List<bool> simpan = [false, true, false, false];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Icon((simpan[index])?Icons.turned_in : Icons.turned_in_not,  color: Colors.white,),
        onTap: (){
      setState(() {
        simpan[index] = !simpan[index];
      });
        });
  }
}



