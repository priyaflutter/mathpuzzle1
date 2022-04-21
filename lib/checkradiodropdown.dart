import 'package:flutter/material.dart';

class check extends StatefulWidget {
  const check({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  String gender = "male";
  bool panistatus = false;
  bool alustatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio // CheckBox"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Male"),
              Radio(
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
                value: "male",
                groupValue: gender,
              )
            ],
          ),
          Row(
            children: [
              Text("Female"),
              Radio(
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
                value: "female",
                groupValue: gender,
              )
            ],
          ),
          Row(
            children: [
              Text("Panipuri"),
              Checkbox(
                onChanged: (value) {
                  setState(() {
                    panistatus = value!;
                  });
                },
                value: panistatus,
              )
            ],
          ) ,
          Row(
            children: [
              Text("Alupuri"),
              Checkbox(
                onChanged: (value) {
                  setState(() {
                    alustatus = value!;
                  });
                },
                value: alustatus,
              )
            ],
          )
        ],
      ),
    );
  }
}
