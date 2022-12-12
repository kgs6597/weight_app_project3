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

  final List data2;
  Yam_Screen({required this.data2});
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
                "${data2[0]}",
                style: TextStyle(fontSize: 15),
              ), //식품명
              Text(
                "${data2[1]}",
                style: TextStyle(fontSize: 15),
              ), //1회제공량
              Text(
                "${data2[2]}",
                style: TextStyle(fontSize: 15),
              ), //열량
              Text(
                "${data2[3]}",
                style: TextStyle(fontSize: 15),
              ), //
              Text(
                "${data2[4]}",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${data2[5]}",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${data2[6]}",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${data2[7]}",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${data2[8]}",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${data2[9]}",
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
