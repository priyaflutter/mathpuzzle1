import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzle/modeclass.dart';
import 'package:mathpuzzle/puzzlelast.dart';
import 'package:mathpuzzle/puzzles.dart';
import 'package:mathpuzzle/secondpage.dart';
import 'package:mathpuzzle/winnerpage.dart';

class puzzlesecond1 extends StatefulWidget {
  @override
  State<puzzlesecond1> createState() => _puzzlesecond1State();
}

class _puzzlesecond1State extends State<puzzlesecond1> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    // double appbarheight =kToolbarHeight;

    double bodyheight = theight - navibartheight - statusbarheight;

    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(bodyheight * 0.03),
        height: bodyheight,
        width: twidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: bodyheight * 0.05,
              child: Center(
                child: Text(
                  "Select Puzzle",
                  style: TextStyle(
                      fontSize: bodyheight * 0.04,
                      color: Color(0xff0d035f),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: bodyheight * 0.80,
              width: double.infinity,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 75,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  String levelstatus = model.statuslist[index];
                  int level = model.prefs!.getInt("level") ?? 0;
                  if (levelstatus == "clear") {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return winnerpage1(index);
                          },
                        ));
                      },
                      child: Container( 
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(margin: EdgeInsets.only(top: bodyheight*0.01),
                              child: Text(
                                "${index + 1}",
                              ),
                            ),
                            Expanded(child: Icon(Icons.lock_open)),
                            Container(height: bodyheight*0.03,
                                decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                BorderRadius.only(bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
                            )
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (levelstatus == "skip") {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secondpage1(index);
                          },
                        ));
                      },
                      child:Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(margin: EdgeInsets.only(top: bodyheight*0.01),
                              child: Text(
                                "${index + 1}",
                              ),
                            ),
                            Expanded(child: Icon(Icons.lock_open)),
                            Container(height: bodyheight*0.03,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.only(bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    if (index == level) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return secondpage1(index);
                            },
                          ));
                        },
                        child:Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(margin: EdgeInsets.only(top: bodyheight*0.01),
                                child: Text(
                                  "${index + 1}",
                                ),
                              ),
                              Expanded(child: Icon(Icons.lock_open)),
                              Container(height: bodyheight*0.03,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius:
                                      BorderRadius.only(bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
                                  )
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(margin: EdgeInsets.only(top: bodyheight*0.01),
                              child: Text(
                                "${index + 1}",
                              ),
                            ),
                            Expanded(child: Icon(Icons.lock)),
                            Container(height: bodyheight*0.03,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius:
                                    BorderRadius.only(bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
                                )
                            )
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         Navigator.push(context, MaterialPageRoute(
            //           builder: (context) {
            //             return puzzles1();
            //           },
            //         ));
            //       },
            //       child: Container(
            //         height: bodyheight * 0.05,
            //         margin: EdgeInsets.only(top: bodyheight * 0.02),
            //         alignment: Alignment.bottomLeft,
            //         child: Image(
            //           image: AssetImage("images/back.png"),
            //           fit: BoxFit.fill,
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Navigator.pushReplacement(context, MaterialPageRoute(
            //           builder: (context) {
            //             return puzzlelast1();
            //           },
            //         ));
            //       },
            //       child: Container(
            //         height: bodyheight * 0.05,
            //         margin: EdgeInsets.only(top: bodyheight * 0.02),
            //         alignment: Alignment.bottomRight,
            //         child: Image(
            //           image: AssetImage("images/next.png"),
            //           fit: BoxFit.fill,
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    ));
  }
}
