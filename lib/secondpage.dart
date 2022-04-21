import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzle/modeclass.dart';
import 'package:mathpuzzle/winnerpage.dart';

class secondpage1 extends StatefulWidget {
  int level;

  secondpage1(this.level);

  @override
  State<secondpage1> createState() => _secondpage1State();
}

class _secondpage1State extends State<secondpage1> {
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
          // margin: EdgeInsets.fromLTRB(0, bodyheight * 0.01, 0, bodyheight * 0.02),
          height: bodyheight,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/gameplaybackground.jpg",
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Container(
                height: bodyheight * 0.10,
                padding: EdgeInsets.all(bodyheight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Skip"),
                              content: Text(
                                  "Are you sure want ro skip this level?You can play skipped leves later by clicking on PUZZLES menu from main screen"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);

                                      setState(() {
                                        model.statuslist[widget.level] = "skip";
                                        model.prefs!.setString("status${widget.level}", "skip");
                                        setState(() {
                                          widget.level++;
                                        });
                                        model.prefs!.setInt("level", widget.level);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return secondpage1(widget.level);
                                          },
                                        ));
                                      });
                                    },
                                    child: Text(
                                      "Yes",
                                      textAlign: TextAlign.end,
                                    )),
                                FlatButton(
                                    onPressed: () {
                                      return Navigator.pop(context);
                                    },
                                    child: Text(
                                      "NO",
                                      textAlign: TextAlign.end,
                                    ))
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: bodyheight * 0.07,
                        margin: EdgeInsets.fromLTRB(0, 0, bodyheight * 0.02, 0),
                        child: Image(
                            image: AssetImage(
                              "images/skip.png",
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: bodyheight * 0.08,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/level_board.png"),
                                fit: BoxFit.fill)),
                        child: Center(
                            child: Text(
                          "Puzzle-${widget.level + 1}",
                          style: TextStyle(fontSize: bodyheight * 0.05),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text("hint"),
                                  content: Text("${model.hint[widget.level]}"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            return Navigator.pop(context);
                                          });
                                        },
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.end,
                                        ))
                                  ],
                                ));
                      },
                      child: Container(
                        height: bodyheight * 0.08,
                        margin: EdgeInsets.fromLTRB(bodyheight * 0.02, 0, 0, 0),
                        child: Image(
                          image: AssetImage(
                            "images/hint.png",
                          ),

                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: bodyheight * 0.42,
                margin: EdgeInsets.fromLTRB(bodyheight * 0.03,
                    bodyheight * 0.02, bodyheight * 0.03, bodyheight * 0.02),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/p${widget.level + 1}.png"),
                        fit: BoxFit.fill)),
              ),
              Expanded(
                child: SizedBox(
                  height: bodyheight * 0.22,
                ),
              ),
              Container(
                color: Colors.black,
                height: bodyheight * 0.15,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(bodyheight * 0.01),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(bodyheight * 0.01))),
                              height: bodyheight * 0.05,
                              child: Text(
                                "${model.s}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.03,
                                    color: Colors.black),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              model.s =
                                  model.s.substring(0, model.s.length - 1);
                            });
                          },
                          child: Container(
                            height: bodyheight * 0.05,
                            child:
                                Image(image: AssetImage("images/delete.png")),
                          ),
                        ),
                        InkWell(
                          onTap: () {

                                if (model.s == model.ans[widget.level]) {
                                  String levelstatus = model.statuslist[widget.level];
                                  {
                                    if (levelstatus == "clear") {

                                        model.prefs!.setInt("level", widget.level);
                                        model.s="";
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                          builder: (context) {

                                            return winnerpage1(widget.level+1);
                                          },
                                        ));


                                    }
                                    else if(levelstatus=="skip")
                                      {
                                        //clear

                                          model.statuslist[widget.level]="clear";
                                          model.prefs!.setString("status${widget.level}","clear");
                                          // model.prefs!.setInt("level", widget.level);
                                          model.s="";

                                            //win
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                  builder: (context) {

                                                    return winnerpage1(widget.level+1);
                                                  },
                                                ));


                                      }
                                    else
                                      {
                                          setState(() {
                                            //clear
                                            model.statuslist[widget.level]="clear";
                                            model.prefs!.setString("status${widget.level}","clear");


                                            //level++
                                              widget.level++;
                                            model.prefs!.setInt("level", widget.level);
                                            model.s="";
                                            //win
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                     return winnerpage1(widget.level);
                                            },));
                                          });
                                      }
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Pls Solve this Puzzle",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                      model.s="";

                                }


                          },
                          child: Container(
                            height: bodyheight * 0.05,
                            child: Center(
                              child: Text(
                                "SUBMIT",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.03,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: bodyheight * 0.07,
                      // padding: EdgeInsets.all(bodyheight * 0.01),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: model.no.length,
                        itemBuilder: (context, level) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                model.s = "${model.s}" + "${model.no[level]}";
                                print(model.s);
                              });
                            },
                            child: Container(
                              width: twidth * 0.06,
                              margin: EdgeInsets.all(bodyheight * 0.01),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                // color: Colors.grey
                              ),
                              child: Center(
                                  child: Text(
                                "${model.no[level]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyheight * 0.03),
                              )),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
