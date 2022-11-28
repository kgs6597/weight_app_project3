import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weight_app_project3/page/breakfast.dart';
import 'package:weight_app_project3/page/dinner.dart';
import 'package:weight_app_project3/page/lunch.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Color.fromARGB(255, 207, 242, 142),
        foregroundColor: Colors.black,
      )),
      home: const FirstPage(),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DateTime selectDate = DateTime.now();

  _selDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
    );

    if (date != null) {
      setState(() {
        selectDate = date;
      });
    }
  }

  List data = [];
  _foodTotal(BuildContext context) async {
    List result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => BreakFast()));
    setState(() {
      data.add(result);
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('탄수화물', 1100),
      ChartData('단백질', 120),
      ChartData('지방', 80),
      ChartData('당류', 50),
    ];
    const double breakCal = 600;
    const double lunchCal = 750;
    const double dinnerCal = 0;
    const double total = 2800;
    const curTotal = breakCal + lunchCal + dinnerCal;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('운동보조프로그램'),
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
                padding: const EdgeInsets.all(20),
                child: Text(
                  "하루식사량",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                color: Colors.grey[100],
                width: 400,
                height: 650,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_left,
                                size: 30.0,
                              ),
                              label: Text(""),
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  _selDatePicker(context);
                                },
                                child: Text('$selectDate')),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_right,
                                size: 30.0,
                              ),
                              label: Text(""),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Center(
                            child: Container(
                          child: SfCircularChart(
                              legend: Legend(isVisible: true, itemPadding: 25),
                              series: <CircularSeries>[
                                PieSeries<ChartData, String>(
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true),
                                )
                              ]),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          color: Colors.grey[350],
                          width: 380,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('아침식사: $breakCal'),
                              ElevatedButton(
                                onPressed: () {
                                  _foodTotal(context);
                                },
                                child: Text('음식추가'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          color: Colors.grey[350],
                          width: 380,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('점심식사: $lunchCal'),
                              ElevatedButton(
                                onPressed: () {
                                  _foodTotal(context);
                                },
                                child: Text('음식추가'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          color: Colors.grey[350],
                          width: 380,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('저녁식사: $dinnerCal'),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Dinner()),
                                  );
                                },
                                child: Text('음식추가'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          color: Colors.grey[350],
                          width: 380,
                          height: 50,
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                      '총량: $breakCal + $lunchCal + $dinnerCal = $curTotal Kcal'),
                                ),
                              ),
                              Container(
                                height: 10,
                                width: 300,
                                child: LinearProgressIndicator(
                                  value: (breakCal + lunchCal + dinnerCal) /
                                      total, // percent filled
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.lightGreenAccent),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ));
  }
}
