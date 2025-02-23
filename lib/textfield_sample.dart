import 'package:flutter/material.dart';

class TextFieldSample extends StatefulWidget {
  const TextFieldSample({super.key});

  @override
  State<TextFieldSample> createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {
  // final controller = TextEditingController();
  List<Text> games = [];
  String text = "";

  // @override
  // void initState() {
  //   super.initState();
  //   controller.addListener(() {
  //     setState(() {
  //       text = controller.text;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        createButton,
        Text("Live changes: $text"),
        Column(children: games),
      ],
    );
  }

  Widget get createButton {
    return Padding(
      padding: EdgeInsets.all(30),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            games.add(Text(text));
            text = "";
          });
        },
        child: Text("Add game"),
      ),
    );
  }

  // Widget get createTextFieldUsingOnChanged {
  //   return TextField(
  //     textAlign: TextAlign.center,
  //     onChanged:
  //         (String value) => setState(() {
  //           text = value;
  //         }),
  //   );
  // }

  // Widget get createTextFieldUsingController {
  //   return TextField(textAlign: TextAlign.center, controller: controller);
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}
