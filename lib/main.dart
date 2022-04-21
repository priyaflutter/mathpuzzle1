import 'package:flutter/material.dart';
import 'package:mathpuzzle/modeclass.dart';
import 'package:mathpuzzle/puzzles.dart';
import 'package:mathpuzzle/puzzlesecond.dart';
import 'package:mathpuzzle/secondpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkradiodropdown.dart';
import 'dropdown.dart';
import 'new.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: bill(),
  ));
}

class firstpage extends StatefulWidget {
  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  bool status = false;

   int? level;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetSharedPreferences();
  }

  GetSharedPreferences() async {
    // Obtain shared preferences.
    // model.statuslist.clear();
    model.prefs = await SharedPreferences.getInstance();
    level = model.prefs!.getInt("level") ??0;
    setState(() {
      status = true;
    });

    for(int i=0;i<75;i++)
      {
        String levelstatus=model.prefs!.getString("status$i")??"pending";
        model.statuslist.add(levelstatus);
      }
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    // double appbarheight =kToolbarHeight;

    double bodyheight = theight - navibartheight - statusbarheight;

    return status
        ? Scaffold(
            body: SafeArea(
              child: Container(
                height: bodyheight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.jpg"),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Container(
                      height: bodyheight * 0.10,
                      margin: EdgeInsets.fromLTRB(0, bodyheight * 0.01, 0, 0),
                      child: Center(
                          child: Text(
                        "MATH PUZZLES",
                        style: TextStyle(
                            fontSize: bodyheight * 0.03,
                            fontFamily: "chalk",
                            color: Color(0xff0d035f),
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      height: bodyheight * 0.70,
                      margin: EdgeInsets.fromLTRB(
                          bodyheight * 0.03,
                          bodyheight * 0.02,
                          bodyheight * 0.03,
                          bodyheight * 0.02),
                      width: twidth,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("images/blackboard_main_menu.png"),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return secondpage1(level!);
                                },
                              ));
                            },
                            child: Text(
                              "CONTINUE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: bodyheight * 0.03,
                                  fontFamily: "chalk"),
                            ),
                          ),
                          SizedBox(
                            height: bodyheight * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return puzzlesecond1();
                                },
                              ));
                            },
                            child: Text(
                              "PUZZLES",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: bodyheight * 0.03,
                                  fontFamily: "chalk"),
                            ),
                          ),
                          SizedBox(
                            height: bodyheight * 0.02,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "BUY PRO",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: bodyheight * 0.03,
                                  fontFamily: "chalk"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: bodyheight * 0.05,
                      margin: EdgeInsets.fromLTRB(0, 0, bodyheight * 0.03, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: bodyheight * 0.04,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF8E8E84),
                                  Color(0x7BA8A2A2)
                                ]),
                                borderRadius:
                                    BorderRadius.circular(bodyheight * 0.01)),
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.share,
                                size: bodyheight * 0.04,
                              ),
                            ),
                          ),
                          Container(
                            height: bodyheight * 0.04,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF8E8E84),
                                  Color(0x7BA8A2A2)
                                ]),
                                borderRadius:
                                    BorderRadius.circular(bodyheight * 0.01)),
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.email_outlined,
                                size: bodyheight * 0.04,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: bodyheight * 0.05,
                      margin: EdgeInsets.fromLTRB(0, 0, bodyheight * 0.03, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration:
                                BoxDecoration(border: Border.all(width: 2)),
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
