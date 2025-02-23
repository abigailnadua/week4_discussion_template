import 'package:flutter/material.dart';

class DropdownSample extends StatefulWidget {
  const DropdownSample({super.key});

  @override
  State<DropdownSample> createState() => _DropdownSampleState();
}

class _DropdownSampleState extends State<DropdownSample> {
  // static final List<String> kpopGroups = [
  //   "Choose one", // initial value
  //   "Stray Kids",
  //   "Itzy",
  //   "Aespa",
  //   "NMIXX",
  //   "Blackpink",
  //   "Twice",
  //   "IVE",
  //   "Baby Monster",
  //   "Le Sserafim",
  //   "Kiss of Life",
  //   "INFINITE",
  // ];
  // String dropdownValue = kpopGroups.first;

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text("Favorite Kpop Group?")]);
  }

  // Widget get createDropdownMenu {
  //   return DropdownButton(
  //     value: dropdownValue,
  //     items:
  //         kpopGroups.map((element) {
  //           return DropdownMenuItem(value: element, child: Text(element));
  //         }).toList(),
  //     onChanged: (String? val) {
  //       setState(() {
  //         dropdownValue = val!;
  //       });
  //     },
  //   );
  // }
}
