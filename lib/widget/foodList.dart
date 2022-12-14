import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:weight_app_project3/page/showFood.dart';

import '../apiModel/food_model.dart';
import '../apiModel/food_providers.dart';

//음식검색에서 제일 중요한 위젯
class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<FoodModel> foods = [];
  bool isLoading = true;
  FoodProvider foodprovider = FoodProvider();
  final myController = TextEditingController();
  List data = ['', 0, 0, 0, 0, 0, 1]; //식사에 적용할 list
  List data2 = ['', '', '', '', '', '', '', '', '', ''];

  Future searchFood() async {
    foods = await foodprovider.getdata(myController.text);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                        prefix: const Icon(Icons.search),
                        hintText: '음식입력',
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.lightBlueAccent))),
                    maxLines: 3,
                    minLines: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: searchFood,
                  child: const Text("검색"),
                ),
              ],
            ),
          ),
          isLoading
              ? Center(child: Text('검색결과가 나옵니다.'))
              : Container(
                  width: 400,
                  height: 450,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ListView.builder(
                    itemCount: foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                                    Text(foods[index].DESC_KOR),
                                    Text('${foods[index].NUTR_CONT1}Kcal'),
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
                                      onPressed: () {
                                        setState(() {
                                          // 버튼 클릭시 상품명, 칼로리, 탄수화물, 단백질, 지방, 당류 리스트에 입력
                                          data[0] = foods[index].DESC_KOR;
                                          data[1] = double.parse(
                                              foods[index].NUTR_CONT1);
                                          data[2] = double.parse(
                                              foods[index].NUTR_CONT2);
                                          data[3] = double.parse(
                                              foods[index].NUTR_CONT3);
                                          data[4] = double.parse(
                                              foods[index].NUTR_CONT4);
                                          if (foods[index].NUTR_CONT5 ==
                                              'N/A') {
                                            data[5] = 0;
                                          } else {
                                            data[5] = double.parse(
                                                foods[index].NUTR_CONT5);
                                          }
                                        });
                                        print(data);
                                        Navigator.pop(context, data);
                                      },
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
                                      onPressed: () {
                                        setState(() {
                                          data2[0] = foods[index].DESC_KOR;
                                          data2[1] = foods[index].SERVING_WT;
                                          data2[2] = foods[index].NUTR_CONT1;
                                          data2[3] = foods[index].NUTR_CONT2;
                                          data2[4] = foods[index].NUTR_CONT3;
                                          data2[5] = foods[index].NUTR_CONT4;
                                          data2[6] = foods[index].NUTR_CONT5;
                                          data2[7] = foods[index].NUTR_CONT6;
                                          data2[8] = foods[index].NUTR_CONT7;
                                          data2[9] = foods[index].NUTR_CONT8;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Yam_Screen(
                                                      data2: data2,
                                                    )));
                                      },
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
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
