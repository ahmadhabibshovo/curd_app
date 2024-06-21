

import 'package:get/get.dart';
import 'package:math_parser/math_parser.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
bool switcher=false;
final keySwitcher=false.obs;
  final input = "".obs;
  final result = "".obs;
  final listOfButton=[].obs;
  
  final listOfButtonNormal = [
    "AC",
    "(",
    ")",
    "=",
    7,
    8,
    9,
    "/",
    4,
    5,
    6,
    "*",
    1,
    2,
    3,
    "-",
    ".",
    0,
    "C",
    "+"
  ];
  
  final listOfButtonSpecial = [
    "√",
    "^",
    "^2",
    "=",
    'sin(',
    'cos(',
    'tan(',
    'π',
    4,
    5,
    6,
    "*",
    1,
    2,
    3,
    "-",
    ".",
    0,
    "C",
    "+"
  ];
  addInput(index) {
    if (listOfButton[index].toString() == "AC") {
      input.value = "";
      result.value='';
    } else if (listOfButton[index].toString() == "=") {
      try {
        result.value = MathNodeExpression.fromStringExtended(input.value)
            .calc(
              MathVariableValues.none,
            )
            .toString();
      } catch (e) {
        result.value = e.toString();
      }
    } else if (listOfButton[index].toString() == "C") {
      if (input.value.isNotEmpty) {
        input.value = input.value.substring(0, input.value.length - 1);
      }
    } else {
      input.value += listOfButton[index].toString();
    }
  }
  acSwitch(index){
    if (listOfButton[index].toString() ==
                                  "AC") {
                                input.value = "";
                                result.value = '';
                              } else if (listOfButton[index]
                                      .toString() ==
                                  "=") {
                                if (!switcher) {listOfButton.value =
                                    listOfButtonSpecial;
                                switcher = true;
                                }
                                else {
                                
                                listOfButton.value =
                                    listOfButtonNormal;
                                switcher = false;
                              }
                                
                              } 
  }

  @override
  void onInit() {
    listOfButton.value=listOfButtonNormal;
    super.onInit();
  }


}
