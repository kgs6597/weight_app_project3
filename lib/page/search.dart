import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void _callAPI() async {
    var url = Uri.parse(
      'https://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey=nfGyrhix1PGJ1x6F%2BZ2%2Frqm0BLUzXIXxcN1sCy2dmW0SfkEgRbq3y1yqJYChKcvhuC6Yi9yDLlZuXzrbc8OkqA%3D%3D&desc_kor=%EB%B0%94%EB%82%98%EB%82%98&pageNo=1&numOfRows=20&type=xml',
    );
    var res = await http.get(url);
    print('response: ${res.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('음식검색'),
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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  prefix: const Icon(Icons.search),
                                  hintText: '음식입력',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.lightBlueAccent))),
                            ),
                            ElevatedButton(
                              onPressed: _callAPI,
                              child: const Text("Call API"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 450,
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: ListView(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              width: 380,
                              height: 50,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.grey[300],
                                      width: 230,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('계란 후라이'),
                                          Text('50 Kcal')
                                        ],
                                      ),
                                    ),
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
                                            color: Colors.lightBlueAccent[400],
                                            onPressed: () {},
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          MaterialButton(
                                            height: 20,
                                            minWidth: 20,
                                            color: Colors.lightBlueAccent[400],
                                            onPressed: () {},
                                            child: Text(
                                              '음식정보',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
