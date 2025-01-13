import 'package:flutter/material.dart';

class SelectableTextFlutter extends StatefulWidget {
  const SelectableTextFlutter({super.key});

  @override
  State<SelectableTextFlutter> createState() => _SelectableTextFlutterState();
}

class _SelectableTextFlutterState extends State<SelectableTextFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selectable Text in fluttre " , style: TextStyle(fontSize: 25),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              showCursor: true ,
                maxLines: 2 ,
                cursorColor: Colors.red,
                minLines: 1,
                "You can able to select the text " , style: TextStyle(fontSize: 20),)

          ],
        ),
      ),
    );
  }
}
