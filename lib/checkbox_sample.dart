import 'package:flutter/material.dart';

class CheckboxSample extends StatefulWidget {
  const CheckboxSample({super.key});

  @override
  State<CheckboxSample> createState() => _CheckboxSampleState();
}

class _CheckboxSampleState extends State<CheckboxSample> {
  bool isChecked = false;
  // List<CheckboxListTile> checkboxItems = [];
  // Map<String, bool> symptoms = {
  //   "cold": false,
  //   "cough": false,
  //   "runny nose": false,
  //   "fever": false,
  // };

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }

  // Widget get normalCheckbox {
  //   return Checkbox(
  //     value: isChecked,
  //     onChanged:
  //         (bool? val) => setState(() {
  //           isChecked = val!;
  //         }),
  //   );
  // }

  // Widget get checkboxWithLabel {
  //   return CheckboxListTile(
  //     title: Text("Masaya ka pa ba?"),
  //     value: isChecked,
  //     onChanged:
  //         (bool? val) => setState(() {
  //           isChecked = val!;
  //         }),
  //   );
  // }

  // List<Widget> get createCheckboxListTile {
  //   return symptoms.keys.map((key) {
  //     return CheckboxListTile(
  //       title: Text(key),
  //       value: symptoms[key],
  //       onChanged:
  //           (bool? val) => setState(() {
  //             symptoms[key] = val!;
  //           }),
  //     );
  //   }).toList();
  // }
}
