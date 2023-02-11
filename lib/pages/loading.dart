import 'package:cool_numbers/services/number.dart';
import 'package:flutter/material.dart';
import "package:cool_numbers/services/number.dart";

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {

    Number instance = Number(number: "10");
    await instance.getText();

    //print(instance.text);

    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   'location': instance.location,
    //   'flag': instance.flag,
    //   'time': instance.time,
    //   'isDayTime': instance.isDayTime,
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Loading page",
      ),
    );
  }
}
