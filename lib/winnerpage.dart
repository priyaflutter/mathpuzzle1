import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzle/main.dart';
import 'package:mathpuzzle/modeclass.dart';
import 'package:mathpuzzle/secondpage.dart';
import 'package:share_plus/share_plus.dart';

class winnerpage1 extends StatefulWidget {
  int level;
  winnerpage1(this. level);

  @override
  State<winnerpage1> createState() => _winnerpage1State();
}

class _winnerpage1State extends State<winnerpage1> {

  String folderpath="";

  _createFolder()async{
    final folderName="Puzzle";
    final pathxxx= Directory("storage/emulated/0/$folderName");
    if ((await pathxxx.exists())){
      // TODO:
      print("exist");
    }else{
      // TODO:
      print("not exist");
      pathxxx.create();
    }
    folderpath=pathxxx.path;
    setState(() {

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createFolder();
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    // double appbarheight =kToolbarHeight;

    double bodyheight = theight - navibartheight-statusbarheight;


    return Scaffold(
      body: SafeArea(
        child: Container(
          height: bodyheight,
          width: twidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: EdgeInsets.all(bodyheight*0.05),
                  height: bodyheight * 0.05,
                  child: Center(
                    child: Text(
                      "Puzzle-${widget.level} Completed",
                      style: TextStyle(fontSize: bodyheight * 0.04,color: Color(0xff0d035f),fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                height: bodyheight * 0.30,
                child: Image.asset("images/trophy.png"),
              ),
              Container(
                height: bodyheight * 0.06,
                padding: EdgeInsets.all(bodyheight * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white, Colors.grey])),
                child: MaterialButton(
                    onPressed: () {

                      setState(() {
                        model.s="";
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return secondpage1(widget.level);

                        },));
                      });

                    },
                    child: Text(
                      "CONTIUNE",
                      style: TextStyle(fontSize: bodyheight * 0.03),
                    )),
              ),
              Container(
                height: bodyheight * 0.06,
                padding: EdgeInsets.all(bodyheight * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white, Colors.grey])),
                child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return firstpage();
                      },));

                    },
                    child: Text(
                      "MAIN MENU",
                      style: TextStyle(fontSize: bodyheight * 0.03),
                    )),
              ),
              Container(
                height: bodyheight * 0.06,
                padding: EdgeInsets.all(bodyheight * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white, Colors.grey])),
                child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "BUY PRO",
                      style: TextStyle(fontSize: bodyheight * 0.03),
                    )),
              ),
              Container(
                height: bodyheight * 0.05,
                child: InkWell(
                  onTap: () {

                  },
                  child: Text(
                    "SHARE THIS PUZZLE",
                    style: TextStyle(fontSize: bodyheight * 0.03,
                        color:Color(0xff0d035f),fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: bodyheight * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white, Colors.grey])),
                child: InkWell(
                  onTap: () {

                    String imagename="images/share${widget.level}.png";
                    String imagepath ="$folderpath/$imagename";
                    File ff=File(imagepath);

                    Share.shareFiles(['${ff.path}']);
                    // Share.share("images/share${widget.level}.png");
                  },
                  child: Image(image: AssetImage("images/shareus.png"),fit: BoxFit.fill,),
                ),
              ),
              SizedBox(height: bodyheight*0.10,)

            ],
          ),
        ),
      ),
    );
  }


}
