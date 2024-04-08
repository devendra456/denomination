import 'package:intl/intl.dart';
import 'package:number_to_character/number_to_character.dart';

var converter = NumberToCharacterConverter('en');

String formatNumberWithCommas(int number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}

String numberToChar(int number) {
  String charNum = "";
  final text = converter.convertInt(number);
  final textArr = text.split(" ");
  for (var element in textArr) {
    final firstElem = element[0].toUpperCase();
    final restElem = element.substring(1);
    charNum += "$firstElem$restElem ";
  }
  charNum+= "Only/-";
  return charNum;
}
