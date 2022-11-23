import 'package:flutter/material.dart';
import 'package:weight_app_project3/page/search.dart';

import '../apiModel/food_model.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({super.key});

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  List data = [];
  bool isLoading = true;

  _foodDataGet(BuildContext context) async {
    List result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Search()));
    setState(() {
      isLoading = false;
      data.add(result);
    });

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('아침식사입력'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.grey[100],
                width: 400,
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: MaterialButton(
                        height: 50,
                        minWidth: 300,
                        color: Colors.lightBlueAccent[400],
                        onPressed: () {
                          _foodDataGet(context);
                        },
                        child: Text(
                          '음식 검색하기',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 400,
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ListView(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            width: 380,
                            height: 50,
                            child: isLoading
                                ? Center(
                                    child: Text(''),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          color: Colors.grey[300],
                                          width: 250,
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('test'),
                                            ],
                                          )),
                                      Container(
                                        color: Colors.grey[300],
                                        width: 130,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            MaterialButton(
                                              height: 20,
                                              minWidth: 20,
                                              color:
                                                  Colors.lightBlueAccent[400],
                                              onPressed: () {},
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            MaterialButton(
                                              height: 20,
                                              minWidth: 20,
                                              color:
                                                  Colors.lightBlueAccent[400],
                                              onPressed: () {},
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            MaterialButton(
                                              height: 20,
                                              minWidth: 20,
                                              color:
                                                  Colors.lightBlueAccent[400],
                                              onPressed: () {},
                                              child: Text(
                                                'x',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      color: Colors.grey[350],
                      width: 380,
                      height: 50,
                      child: Center(child: Text('총량: 300kcal')),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
