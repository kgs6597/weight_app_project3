import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const TextStyle Style_nice = TextStyle(
  color: Color.fromRGBO(0, 0, 0, 0.8), //색상
  fontFamily: 'Anton',
  fontSize: 25, //글자 크기
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold, //굵기
  decoration: TextDecoration.none, //뭔진 모르는데 있어야함.
);

class Yam_Screen extends StatelessWidget {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent[100],
        title: Text(
          " 음식 정보 ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ), //식품명
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ), //1회제공량
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ), //열량
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ), //
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "text",
                style: TextStyle(fontSize: 15),
              ), //측정연도
            ],
          ),
          padding: EdgeInsets.all(20),
          color: Colors.grey[100],
          height: 450,
          width: 350,
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
