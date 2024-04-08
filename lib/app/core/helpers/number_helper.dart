import 'package:intl/intl.dart';
import 'package:number_to_words_english/number_to_words_english.dart';


String formatNumberWithCommas(int number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}

String numberToChar(int number) {
  String charNum = "";
  final text = NumberToWordsEnglish.convert(number);
  final textArr = text.split(" ");
  for (var element in textArr) {
    final firstElem = element[0].toUpperCase();
    final restElem = element.substring(1);
    charNum += "$firstElem$restElem ";
  }
  charNum+= "Only/-";
  return charNum;
}
