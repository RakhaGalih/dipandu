import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:flutter/material.dart';

class TokoCardWidget extends StatelessWidget {
  Function onClick;
  int index;
  TokoCardWidget ({this.onClick, this.index,});
  double height = 250;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: GestureDetector(
            onTap: onClick,
            child: Container(
              color: Constant().blueTheme,
              height: height,
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                overflow: Overflow.clip,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: height * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(
                          Constant().tokoCards[index].foto),
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
                                    Constant().tokoCards[index].nama,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 13, color: Colors.grey,),
                                  ),
                                  Expanded(child: SizedBox(child: Align(alignment: Alignment.centerLeft,child:
                                  Text(Constant().tokoCards[index].harga, style: TextStyle(fontWeight: FontWeight.w700,))),
                                  )),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Constant().blueTheme, size: 15,),
                                      Text(
                                        Constant().tokoCards[index].rating,
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Constant().blueTheme,),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(Constant().tokoCards[index].pop, style: TextStyle(fontSize: 12, color: Colors.grey))
                                    ],
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
    );
  }
}