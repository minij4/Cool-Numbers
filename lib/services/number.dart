import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';

class Number {
  String number;
  String text = "";

  Number({ required this.number });

  Future<void> getText() async {
    try {
      // making dif. url requests
      Random random = new Random();
      int randomNumber = random.nextInt(1);

      Response response = randomNumber == 0 ?
        await get(Uri.parse('http://numbersapi.com/$number/math')) :
        await get(Uri.parse('http://numbersapi.com/$number'));

      // assigning text property
      text = response.body;
      //print(text);

    } catch(e) {
      text = e.toString();
    }
  }
}