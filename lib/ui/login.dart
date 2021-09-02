import 'package:flutter/material.dart';
import 'package:furniture_app/const.dart';
import 'package:furniture_app/ui/main_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;

  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double smallDiameter = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          width: width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  top: -smallDiameter / 3,
                  left: -smallDiameter / 3,
                  child: Container(
                    width: smallDiameter,
                    height: smallDiameter,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2), shape: BoxShape.circle),
                  )),
              Positioned(
                  bottom: -smallDiameter / 2,
                  right: -smallDiameter / 2,
                  child: Container(
                    width: smallDiameter,
                    height: smallDiameter,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              primaryColor.withOpacity(0.5),
                              primaryColor.withOpacity(0.2)
                            ]),
                        shape: BoxShape.circle),
                  )),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Selamat datang kembali!",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Login untuk melanjutkan.",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(
                      "images/login_cleaned.svg",
                      width: width * 0.45,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: primaryColor.withOpacity(0.2)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        obscureText: _secureText,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: _secureText
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              color: primaryColor,
                              onPressed: () {
                                showHide();
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: primaryColor.withOpacity(0.2)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      color: primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            letterSpacing: 2.2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      minWidth: width,
                      height: 45,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
