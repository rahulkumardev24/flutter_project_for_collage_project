import 'package:datatable_in_flutter/date_picker_flutter.dart';
import 'package:datatable_in_flutter/flutterDataTable.dart';
import 'package:datatable_in_flutter/selectable_text_flutter.dart';
import 'package:datatable_in_flutter/time_picke_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Flutterdatatable()


    );
  }
}

