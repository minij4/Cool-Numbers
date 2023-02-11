import 'package:cool_numbers/pages/loading.dart';
import 'package:cool_numbers/pages/home.dart';

import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
  },
));