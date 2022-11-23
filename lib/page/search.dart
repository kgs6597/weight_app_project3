import 'package:flutter/material.dart';
import 'package:weight_app_project3/apiModel/food_model.dart';
import 'package:weight_app_project3/apiModel/food_providers.dart';
import 'package:weight_app_project3/widget/foodList.dart';

// 음식 검색 기본적 UI 페이지

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                  child: FoodList(),
                )),
          ],
        ),
      ),
    );
  }
}
