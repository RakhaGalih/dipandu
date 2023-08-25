import 'dart:convert';

import 'package:dipandu/screens/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Pemandu Wisata",
        description:
        "Dapatkan pemandu wisata lokal yang professional untuk pemandumu!",
        image: "assets/open_map.svg"),
    SliderPage(
        title: "Majukan UMKM",
        description:
        "Yuk bantu UMKM lokal memajukan usaha oleh - olehnya!",
        image: "assets/restaurant.svg"),
    SliderPage(
        title: "Spot Wisata",
        description:
        "Temukan spot berwisata yang menarik dari Sabang hingga Merauke!",
        image: "assets/navigation.svg"),
    SliderPage(
        title: "Yuk Mulai!",
        description:
        "Ayo cari dan sewa pemandu pribadimu dan nikmati perjalanan wisatamu!",
        image: "assets/start_up.svg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? Color(0xFF445EE9)
                              : Color(0xFF445EE9).withOpacity(0.5)));
                })),
          ),

          Align(
            alignment: Alignment(0, 0.8),
            child: AnimatedCrossFade(
              alignment: Alignment.bottomCenter,
              crossFadeState: (_currentPage == _pages.length - 1)? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
              firstChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          _controller.animateToPage(
                              _pages.length - 1,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('LEWATI', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFBC0E),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('LANJUT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
              secondChild: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => Auth(signIn: false,)));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.8,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFBC0E),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('SIGN UP', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white,),),
                    ),
                  ),
                  SizedBox( height: height * 0.02,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => Auth(signIn: true,)));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.8,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('SIGN IN', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700,),),
                    ),
                  ),
                  SizedBox(height: height * 0.05,)
                ],
              ),
            ),
            ),
            ],
          ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: height * 0.15,
          ),
          SvgPicture.asset(
            image,
            height: height * 0.3,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            title,
            style: TextStyle(fontSize: height * 0.035, fontWeight: FontWeight.w700, color: Color(0xFF445EE9),),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: height * 0.02,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

