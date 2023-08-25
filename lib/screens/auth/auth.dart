import 'package:dipandu/screens/mainPage/Beranda/beranda.dart';
import 'package:dipandu/screens/stepper/stepper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget {
  bool signIn;
  Auth({this.signIn});
  @override
  _AuthState createState() => _AuthState(signIn: signIn);
}

class _AuthState extends State<Auth> {
  bool signIn;
  _AuthState({this.signIn});

  final _formKey = GlobalKey<FormState>();
  bool _obs = true;
  bool _signInclick = false;

  bool _usernameValid = true;
  bool _emailValid  = true;
  bool _passwordValid  = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obs = true;
    _usernameValid = true;
    _emailValid = true;
    _passwordValid = true;
  }
  //Shared Preferences
  SharedPreferences _prefs;
  String _namaPrefs;
  String _emailPrefs;
  String _passPrefs;
  Future<Null> _setPref(String prefs, String nama) async {
    _prefs = await SharedPreferences.getInstance();
    await this._prefs.setString(prefs, nama);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Align(alignment: Alignment.topCenter, child: Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(color: Colors.white,),
            )),
            Align(alignment: Alignment.bottomCenter, child: Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(color: Color(0xFF445EE9),),
            )),
            // yang dipake
            Align(alignment: Alignment.topCenter, child: Container(
              height: size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFF445EE9), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.width * 0.2))),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),child: Image.asset('assets/Logo-DiPandu-Putih.png')),
            )),
            Align(alignment: Alignment.bottomCenter, child: Container(
              clipBehavior: Clip.none,
              height: size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(color:  Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(size.width * 0.2))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*GestureDetector(
                              child: Text('SIGN IN', style: TextStyle(fontWeight: FontWeight.w500,color: (signIn)? Colors.black : Colors.grey, fontSize: size.width * 0.05,),),
                              onTap: (){
                                setState(() {
                                 signIn = true;
                                });
                              },
                            )*/
                            FlatButton(onPressed:  (){
                              setState(() {
                                _signInclick = true;
                                signIn = true;
                                _passwordValid = true;
                                _emailValid = true;
                                _usernameValid = true;
                              });},
                                child: Text('SIGN IN', style: TextStyle(fontWeight: FontWeight.w500,
                                    color: (signIn)? Colors.black : Colors.grey, fontSize: size.width * 0.05))),

                            FlatButton(onPressed:  (){
                              setState(() {
                                signIn = false;
                                _passwordValid = true;
                                _emailValid = true;
                                _usernameValid = true;
                              });},
                              child: Text('SIGN UP', style: TextStyle(fontWeight: FontWeight.w500,
                                  color: (signIn)? Colors.grey : Colors.black, fontSize: size.width * 0.05))),
                          ],
                        ),
                    AnimatedCrossFade(
                      crossFadeState: (signIn)? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 300),
                      firstChild: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                        child: TextFormField(
                          onChanged: (val) { setState(() =>_namaPrefs = val);},
                          validator: (val) {
                            if(val.isEmpty){
                              if(signIn){
                                return null;
                              }else {
                                setState(() {
                                  _usernameValid = false;
                                });
                                return 'Masukkan username';
                              }
                            } else {
                              setState(() {
                                _usernameValid = true;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'username',
                              icon: CircularIcon(color: (_usernameValid) ? Color(0xFF445EE9) : Color(0xFFEF0F0F), icon: Icon(Icons.person, color: Colors.white, ), width: 50, height: 50,)
                          ),
                        ),
                      ),
                      secondChild:  SizedBox( width: 0),
                    ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                        child: TextFormField(
                          onChanged: (val) { setState(() =>_emailPrefs = val);},
                          validator: (val) {
                            if(val.isEmpty){
                              setState(() {
                                _emailValid = false;
                              });
                              return 'Masukkan email';
                            } else {
                              setState(() {
                                _emailValid = true;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'email',
                              icon: CircularIcon(color: (_emailValid) ? Color(0xFF445EE9) : Color(0xFFEF0F0F), icon: Icon(Icons.mail, color: Colors.white, ), width: 50, height: 50,)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                        child: TextFormField(
                          onChanged: (val) { setState(() =>_passPrefs = val);},
                          validator: (val) {
                            if(val.length < 8){
                              setState(() {
                                _passwordValid = false;
                              });
                              return 'Password setidaknya 8 karakter';
                            } else {
                              setState(() {
                                _passwordValid = true;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'password',
                            icon: CircularIcon(color: (_passwordValid) ? Color(0xFF445EE9) : Color(0xFFEF0F0F), icon: Icon(Icons.lock, color: Colors.white, ), width: 50, height: 50,),
                            suffixIcon: IconButton(icon: Icon((_obs)? Icons.visibility_off : Icons.visibility, color: (_passwordValid) ? null : Color(0xFFEF0F0F)), onPressed: (){
                              setState(() {
                                _obs = !_obs;
                              });
                            }),
                          ),
                          obscureText: _obs,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                        child: InkWell(
                          onTap: () {
                            if (!_formKey.currentState.validate()) {
                              _setPref('nama', _namaPrefs);
                              _setPref('email', _emailPrefs);
                              _setPref('pass', _passPrefs);
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => Beranda()));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
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
                            child: Text((signIn)?'SIGN IN' : 'SIGN UP', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: "Lato"),),
                          ),
                        ),
                      ),
                      AnimatedCrossFade(
                        duration: Duration(milliseconds: 300),
                        crossFadeState: (signIn) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        firstChild: Padding(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),child: Center(child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text('Forgot Password?', style: TextStyle(color: Color(0xFF445EE9), fontSize: 12, fontWeight: FontWeight.w500),)),)),
                        secondChild: SizedBox( width: 0),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class CircularIcon extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularIcon({this.width, this.height, this.color, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        width: width,
        height: height,
        child: icon,
      ),
    );
  }
}

