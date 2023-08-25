import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class Chat extends StatefulWidget {
  int index;

  Chat({this.index});

  @override
  _ChatState createState() => _ChatState(index: index);
}

class _ChatState extends State<Chat> {
  int index;

  _ChatState({this.index});

  String chat;

  List<String> anjay = [
    'oke', 'lorem', 'ipsum'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruang Diskusi', style: TextStyle(
            color: Constant().blueTheme, fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Constant().blueTheme),
      ),
      body: Column(
        children: [
          Padding(
           padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
           child: Container(
             padding:  EdgeInsets.all(10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Constant().blueTheme.withOpacity(0.07),
             ),
             child: Row(
        children: [
          ClipOval(child: SizedBox(width: 60, height: 60,child: Image.asset(Constant().pemandu[widget.index].foto, fit: BoxFit.cover,)),),
          SizedBox(width: 15,),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constant().pemandu[widget.index].nama,
                  style: TextStyle(fontWeight: FontWeight.w700),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constant().blueTheme
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text('Online',
                      style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ],
          ),
          Expanded(child: SizedBox()),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
        ],
      ),
           ),
    ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: anjay.length,
                itemBuilder: (context, i){
              return Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                child: Column(
                  children: [
                    ChatCard(index: widget.index, text: anjay[i], me: true,),
                    SizedBox(height: 15,),
                    ChatCard(index: widget.index, text: 'Lorem ipsum dolor sit amet', me: false,),
                    (i == anjay.length-1)? SizedBox(height: 15,) : SizedBox(height: 0,)
                  ],
                ),
              );
            }),
          ),
          Container(
            padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 1.5, spreadRadius: 1, color: Colors.black12)]),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                    child: Icon(Icons.add, color: Constant().blueTheme,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black12)]),
                  padding: EdgeInsets.all(5),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Color(0xFF445EE9).withOpacity(0.2),),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        onChanged: (val){
                          setState(() {
                            chat = val;
                          });
                        },
                        minLines: 1,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Tanya ke pemandumu...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      anjay.add(chat);
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    child: Icon(Icons.send, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFBC0E),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black12)]),
                    padding: EdgeInsets.all(5),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  int index;
  bool me;
  String text;
  ChatCard({this.index, this.me, this.text});
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: (me)?TextDirection.ltr : TextDirection.rtl,
        children: [
          Column(
            children: [
               Container(
                  padding: EdgeInsets.all(12),
                  child: Text(text, style: TextStyle(fontSize: 12, color: Colors.white,),),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constant().blueTheme
                  ),
                 constraints: BoxConstraints(
                   maxWidth: MediaQuery.of(context).size.width - 200
                 ),
                ),
              SizedBox(height: 2,),
              Row(
                children: [
                  Text('09:28', style: TextStyle(fontSize: 10,  color: Constant().blueTheme,),),
                  (me)? SizedBox(width: 5,) : SizedBox(width: 0,),
                  (me)? Icon(Icons.done_all, size: 12,color: Constant().blueTheme) : SizedBox(width: 0,),
                ],
              ),
            ],
            textDirection:  (me)?TextDirection.ltr : TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          SizedBox(width: 15,),
          ClipOval(child: SizedBox(width: 60, height: 60,child: Image.asset((me)?'assets/faces/ToyFaces_Colored_BG_56.jpg' : Constant().pemandu[index].foto, fit: BoxFit.cover,)),),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
