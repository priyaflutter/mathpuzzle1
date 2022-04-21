import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class bill extends StatefulWidget {
  const bill({Key? key}) : super(key: key);


  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  GlobalKey globalKey = GlobalKey();


  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary = globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return Future.value();
  }

  String folderpath = "";

  _createFolder() async {
    final folderName = "Bill1";
    final pathxx = Directory("storage/emulated/0/$folderName");
    if ((await pathxx.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      pathxx.create();
    }

    folderpath = pathxx.path;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createFolder();
    permission();
  }

  Future<void> permission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await [
        Permission.storage,
      ].request();
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery
        .of(context)
        .size
        .height;
    double twidth = MediaQuery
        .of(context)
        .size
        .width;
    double statusbar = MediaQuery
        .of(context)
        .padding
        .top;
    double navigator = MediaQuery
        .of(context)
        .padding
        .bottom;
    double tappbar = kToolbarHeight;

    double tbodyheight = theight - tappbar - statusbar - navigator;
    return RepaintBoundary(
      key: globalKey,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF210219),
          toolbarHeight: tbodyheight * 0.10,
          title: Text("Bill"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: tbodyheight * 0.10,
                    child: Center(child: Text("No")),
                  ),
                  Container(
                    height: tbodyheight * 0.10,
                    child: Center(child: Text("Items")),
                  ),
                  Container(
                    height: tbodyheight * 0.10,
                    child: Center(child: Text("Rs")),
                  ),
                  Container(
                    height: tbodyheight * 0.10,
                    child: Center(child: Text("Plate")),
                  ),
                  Container(
                    height: tbodyheight * 0.10,
                    child: Center(child: Text("Select")),
                  ),
                ],
              ),
              Container(
                height: tbodyheight * 0.60,
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text(srno[index]),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(20)) ,
                            // border: Border.all(width: 2)
                          ),
                          child: Text(item[index]),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(20)) ,
                            // border: Border.all(width: 2)
                          ),
                          child: Text("${rate[index]}"),
                        ),
                        Container(
                            child:DropdownButton(
                                hint: Text("Select"),
                                value: selectedno,
                                onChanged: <String>(value) {

                                  setState(() {
                                    selectedno=value;
                                  });

                                },
                                items:getitems(),)
                        ),
                        Container(
                          child: Checkbox(
                            onChanged: (value) {
                              setState(() {
                                status[index] = value!;
                                getmyvalue(
                                    status[index], rate[index], no[index]);
                              });
                            }, value: status[index],),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: tbodyheight * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: twidth * 0.30,
                    ),
                    Text("Total"),
                    Text("Rs"),
                    Container(
                      height: tbodyheight * 0.05,
                      width: twidth * 0.30,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Text("${a}/-"),)
                  ],
                ),
              ),
              Container(
                height: tbodyheight * 0.10,
                child: InkWell(
                  onTap: () {
                    _capturePng().then((value) async {
                      print(value);
                      String imagename = "Image.jpg";
                      String imagepath = "$folderpath/$imagename";
                      File ff = File(imagepath);
                      ff.writeAsBytes(value);

                      await ff.create();

                      Share.shareFiles(['${ff.path}']);
                    });
                  },
                  child: Icon(Icons.share),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  List<bool> status = [false, false, false, false];
  List srno = ["1", "2", "3", "4"];
  List item = ["Panipuri", "Alupuri", "Vadapav", "Dabeli"];
  List<String> rate = ["10", "25", "15", "25"];
  List<String> no = ["1", "2", "3", "4"];
  String selectedno="1";

  int a = 0;


  List<DropdownMenuItem> getitems()
  {
    List<DropdownMenuItem> id = <DropdownMenuItem>[];

    for (int i = 0; i < no.length; i++) {
      id.add(DropdownMenuItem(child: Text(no[i]), value: no[i]));
    }

    return id;
  }

  void getmyvalue(bool status, String rate, String no) {
    if (status) {
      setState(() {
        a = a + (int.parse(rate) * int.parse(no));
      });
    }
    else {
      setState(() {
        a = a - (int.parse(rate) * int.parse(no));
      });
    }
  }





}
