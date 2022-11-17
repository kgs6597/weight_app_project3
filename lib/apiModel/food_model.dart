class FoodModel {
  late String DESC_KOR;
  late String SERVING_WT;
  late String NUTR_CONT1;
  late String NUTR_CONT2;
  late String NUTR_CONT3;
  late String NUTR_CONT4;
  late String NUTR_CONT5;
  late String NUTR_CONT6;
  late String NUTR_CONT7;
  late String NUTR_CONT8;
  late String NUTR_CONT9;
  late String BGN_YEAR;
  late String ANIMAL_PLANT;

  FoodModel(
      {required this.DESC_KOR,
      required this.SERVING_WT,
      required this.NUTR_CONT1,
      required this.NUTR_CONT2,
      required this.NUTR_CONT3,
      required this.NUTR_CONT4,
      required this.NUTR_CONT5,
      required this.NUTR_CONT6,
      required this.NUTR_CONT7,
      required this.NUTR_CONT8,
      required this.NUTR_CONT9,
      required this.BGN_YEAR,
      required this.ANIMAL_PLANT});

  FoodModel.fromMap(Map<String, dynamic>? map) {
    //String, dynamic 작성시 json-> Object형태로 변환되어 파싱이 된다.
    DESC_KOR = map?['DESC_KOR'] ?? '';
    SERVING_WT = map?['SERVING_WT'] ?? '';
    NUTR_CONT1 = map?['NUTR_CONT1'] ?? '';
    NUTR_CONT2 = map?['NUTR_CONT2'] ?? '';
    NUTR_CONT3 = map?['NUTR_CONT3'] ?? '';
    NUTR_CONT4 = map?['NUTR_CONT4'] ?? '';
    NUTR_CONT5 = map?['NUTR_CONT5'] ?? '';
    NUTR_CONT6 = map?['NUTR_CONT6'] ?? '';
    NUTR_CONT7 = map?['NUTR_CONT7'] ?? '';
    NUTR_CONT8 = map?['NUTR_CONT8'] ?? '';
    NUTR_CONT9 = map?['NUTR_CONT9'] ?? '';
    BGN_YEAR = map?['BGN_YEAR'] ?? '';
    ANIMAL_PLANT = map?['ANIMAL_PLANT'] ?? '';
  }
}
