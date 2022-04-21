import 'package:flutter/material.dart';
import 'package:mathpuzzle/modeclass.dart';
import 'package:mathpuzzle/puzzlelastttt.dart';
import 'package:mathpuzzle/puzzlesecond.dart';
import 'package:mathpuzzle/secondpage.dart';
import 'package:mathpuzzle/winnerpage.dart';

class puzzlelast1 extends StatefulWidget {


  @override
  State<puzzlelast1> createState() => _puzzlelast1State();
}

class _puzzlelast1State extends State<puzzlelast1> {
  @override
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    // double appbarheight =kToolbarHeight;

    double bodyheight = theight - navibartheight-statusbarheight;

    return Scaffold(
      body:SafeArea(
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
                        fontWeight:FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: bodyheight * 0.75,
                width: double.infinity,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 24,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {

                    String levelstatus = model.statuslist[index];
                    int level = model.prefs!.getInt("level") ?? 0;
                    if (levelstatus == "clear") {
                      return InkWell(onTap: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return winnerpage1(index);
                        },));
                      },
                        child: Container(
                          decoration: BoxDecoration(image: DecorationImage(
                              image: AssetImage("images/tick.png"))
                          ),
                          child: Center(child: Text("${index + 49}",
                            style: TextStyle(
                                fontSize: bodyheight * 0.03),)),),
                      );
                    }
                    else if (levelstatus == "skip")
                    {
                      return InkWell(onTap: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return secondpage1(index);
                        },));
                      },
                        child: Container(child: Center(
                          child: Text("${index + 49}",
                            style: TextStyle(fontSize: bodyheight * 0.03),),
                        ),),
                      );
                    }
                    else
                    {
                      if(index==level)
                      {
                        return InkWell(onTap: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) {
                            return secondpage1(index);
                          },));
                        },
                          child: Container(child: Center(
                            child: Text("${index + 49}",
                              style: TextStyle(fontSize: bodyheight * 0.03),),
                          ),),
                        );
                      }
                      else
                      {
                        return Container(decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("images/lock.png"))),);
                      }
                    }
                  },
                ),
              ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return puzzlesecond1();
                        },
                      ));
                    },
                    child: Container(
                      height: bodyheight * 0.05,
                      margin: EdgeInsets.only(top: bodyheight * 0.02),
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: AssetImage("images/back.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return puzzlelasttt1();
                        },
                      ));
                    },
                    child: Container(
                      height: bodyheight * 0.05,
                      margin: EdgeInsets.only(top: bodyheight * 0.02),
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: AssetImage("images/next.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
