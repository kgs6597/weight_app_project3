import 'dart:convert';

import 'package:weight_app_project3/apiModel/food_model.dart';
import 'package:http/http.dart' as http;

class FoodProvider {
  Future<List<FoodModel>> getdata(menu) async {
    Uri uri = Uri.parse(
        'https://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey=nfGyrhix1PGJ1x6F%2BZ2%2Frqm0BLUzXIXxcN1sCy2dmW0SfkEgRbq3y1yqJYChKcvhuC6Yi9yDLlZuXzrbc8OkqA%3D%3D&desc_kor=${menu}&pageNo=1&numOfRows=3&type=json');
    List<FoodModel> foods = [];

    final res = await http.get(uri);

    foods = jsonDecode(res.body)['body']['items'].map<FoodModel>((items) {
      return FoodModel.fromMap(items);
    }).toList();
    return foods;
  }
}
