import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/botton.dart';
import '../utils/colornotifire.dart';
import '../utils/ctextfield.dart';
import '../utils/itextfield.dart';
import '../utils/media.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ColorNotifire notifire;
  bool status = false;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: () => Scaffold(
        backgroundColor: notifire.getprimerycolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 11),
              Center(
                child: Image.asset(
                  "image/getevent.png",
                  height: height / 13,
                ),
              ),
              SizedBox(height: height / 100),
              Text(
                "EventHub",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Gilroy Medium',
                  color: notifire.gettextcolor,
                ),
              ),
              SizedBox(height: height / 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy Medium',
                        color: notifire.getwhitecolor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Customtextfild.textField(
                  "User",
                  Colors.grey,
                  notifire.getwhitecolor,
                  "image/Message.png",
                ),
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Customtextfild2.textField(
                  _obscureText,
                  "Password",
                  Colors.grey,
                  notifire.getwhitecolor,
                  "image/Lock.png",
                  GestureDetector(
                      onTap: () {
                        _toggle();
                      },
                      child: _obscureText
                          ? Image.asset("image/eye.png")
                          : const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            )),
                ),
              ),
              SizedBox(height: height / 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        activeColor: notifire.getbuttonscolor,
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: width / 60),
                    Text(
                      "Remember Me",
                      style: TextStyle(
                        color: notifire.getwhitecolor,
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child:  Container()));
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: notifire.getwhitecolor,
                              fontFamily: 'Gilroy Medium',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child:  Container()));
                },
                child: Custombutton.button(
                  notifire.getbuttonscolor,
                  "SIGN IN",
                  SizedBox(
                    width: width / 4,
                  ),
                  SizedBox(
                    width: width / 7,
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              Text(
                "OR",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy Medium',
                ),
              ),
              SizedBox(height: height / 40),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child:  Container()));
                  },
                  child: log(notifire.getblackcolor, "Login with Google",
                      "image/google.png", notifire.getwhitecolor)),
              SizedBox(height: height / 50),
              log(notifire.getblackcolor, "Login with Facebook",
                  "image/facebook.png", notifire.getwhitecolor),
              SizedBox(height: height / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(
                        color: notifire.getwhitecolor,
                        fontSize: 12.sp,
                        fontFamily: 'Gilroy Medium',
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child:  Container()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xff5669FF),
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                  ),
                ],
              ),
              line(
                "image/darkmode.png",
                "Dark Mode",
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: notifire.getbuttonscolor,
                    value: notifire.getIsDark,
                    onChanged: (val) async {
                      final prefs =
                      await SharedPreferences.getInstance();
                      setState(() {
                        notifire.setIsDark = val;
                        prefs.setBool("setIsDark", val);
                      });
                    },
                  ),
                  // CupertinoSwitch(
                  //   activeColor: notifire.getbuttonscolor,
                  //   value: status3,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       status3 = value;
                  //     });
                  //   },
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget log(clr, name, img, clr2) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child:  Container()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: clr,
          ),
          height: height / 15,
          width: width / 1.5,
          child: Row(
            children: [
              SizedBox(
                width: width / 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Image.asset(img),
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(
                name,
                style: TextStyle(
                    color: clr2,
                    fontFamily: 'Gilroy Medium',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget line(img, name, se) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: width / 25,
            ),
            Image.asset(
              img,
              color: notifire.getdarkscolor,
              height: height / 35,
            ),
            SizedBox(
              width: width / 30,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Gilroy Normal',
                color: notifire.getdarkscolor,
              ),
            ),
            const Spacer(),
            se,
            SizedBox(
              width: width / 20,
            ),
          ],
        ),
      ],
    );
  }
}
