import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shredpre11 extends StatefulWidget {
  @override
  State<shredpre11> createState() => _shredpre11State();
}

class _shredpre11State extends State<shredpre11> {

  String a="";
  String b="";
  SharedPreferences? prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetSharedprefrence();

  }
  GetSharedprefrence()
  async {

    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
    a=prefs!.getString("get")??"";
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text("SharedPreference"),),
      body: Container(   margin: EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        TextField(
          controller: blank,
          decoration: InputDecoration(  labelText:"Type here",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        ),
        ElevatedButton(onPressed: () {

                setState(() {
                  a=blank.text;
                  prefs!.setString("get", a);

                });

        }, child: Text("GetData")),
        Container(
          height:100,
          width: double.infinity,
          decoration: BoxDecoration( border: Border.all(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Text(a),),
        ElevatedButton(onPressed: () {

              setState(() {
                b=prefs!.getString("get")??"";
                print("${b}");
              });

        }, child: Text("SetData")),
          ],
        ),
      ),
    );
  }

  TextEditingController blank = TextEditingController();


}
