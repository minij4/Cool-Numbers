import 'package:cool_numbers/services/number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {

    Number instance = Number(number: "10");
    await instance.getText();

    //print(instance.text);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'text': instance.text,
      'number': instance.number,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
