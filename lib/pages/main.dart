import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cool_numbers/services/number.dart';
import 'dart:math';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    return Scaffold(
      backgroundColor: Colors.purple[700],
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text('Facts about numbers'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(     // <-- TextButton
                  onPressed: () async {
                    // creating random number
                    Random random = new Random();
                    int randomNumber = random.nextInt(1000);

                    // making a request
                    Number instance = Number(number: randomNumber.toString());
                    await instance.getText();

                    // renew the number state
                    setState(() {
                      data = {
                        'text': instance.text,
                        'number': instance.number,
                      };
                    });
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.purple[100], //<-- SEE HERE
                  ),
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.purple[100],
                    size: 30.0,
                  ),
                  label: Text(
                    'Get random number',
                    style: TextStyle(
                      color: Colors.purple[100],
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple[400],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      data['number'],
                      style: TextStyle(
                        fontSize: 50.0,
                        letterSpacing: 2.0,
                        color: Colors.purple[100],

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  data['text'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                    color: Colors.purple[100],
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
