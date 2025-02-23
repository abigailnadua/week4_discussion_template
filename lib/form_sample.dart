import 'package:flutter/material.dart';
import 'package:myapp/models/form_values.dart';

class FormSample extends StatefulWidget {
  const FormSample({super.key});

  @override
  State<FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  // required to specify the data type of the key
  final formKey = GlobalKey<FormState>();
  bool isFinal = false;
  final List<String> kpopGroups = [
    "Stray Kids",
    "Itzy",
    "Aespa",
    "NMIXX",
    "Blackpink",
    "Twice",
    "IVE",
    "Baby Monster",
    "Le Sserafim",
    "Kiss of Life",
    "INFINITE",
  ];
  FormValues formValues = FormValues();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form and Form Input Widgets")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              // createTextFormField(),
              // createDropdownFormField(),
              // createCheckboxFormField(),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       createResetButton(),
              //       createValidateButton(),
              //       createSubmitButton(),
              //     ],
              //   ),
              // ),
              // showSavedValues(),
            ],
          ),
        ),
      ),
    );
  }

  Widget createTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Sino crush mo?",
        hintText: "Ito yung hint",
      ),
      // try exploring what to do if we used a controller
      // since using it is more flexible for componentization
      onSaved: (String? val) {
        formValues.textfieldValue = val;
      },
      onChanged: (value) => formValues.textfieldValue = value,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "Huy di pwedeng wala!";
      //   }

      //   return null;
      // },
    );
  }

  Widget createDropdownFormField() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            "Favorite Kpop Group?",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          DropdownButtonFormField(
            hint: Text("Choose one"),
            items:
                kpopGroups.map((element) {
                  return DropdownMenuItem(value: element, child: Text(element));
                }).toList(),
            onChanged: (String? val) {
              setState(() {
                formValues.dropdownValue = val;
              });
            },
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return "Ibahin mo naman!";
            //   }
            //   return null;
            // },
          ),
        ],
      ),
    );
  }

  Widget createCheckboxFormField() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children:
            formValues.checkboxValues.keys.map((key) {
              return FormField(
                builder: (FormFieldState state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CheckboxListTile(
                        title: Text(key),
                        value: formValues.checkboxValues[key],
                        onChanged:
                            (bool? val) => setState(() {
                              formValues.checkboxValues[key] = val;
                            }),
                      ),
                      // formValues.checkboxValues[key]!
                      //     ? Text("", style: TextStyle(fontSize: 12))
                      //     : Text(
                      //       state.errorText ?? '',
                      //       style: TextStyle(
                      //         color: Theme.of(context).colorScheme.error,
                      //         fontSize: 12,
                      //       ),
                      //     ),
                    ],
                  );
                },
                // validator: (bool? val) {
                //   if (val == null || !val) return "Hindi pwede!";
                //   return null;
                // },
              );
            }).toList(),
      ),
    );
  }

  Widget createResetButton() {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState?.reset();
        // checkbox is not reset using the above line
        // we also need to reset the saved values themselves
        formValues = FormValues();

        setState(() {
          isFinal = false;
        });
      },
      child: Text("Reset Form"),
    );
  }

  Widget createValidateButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(content: Text("The form is good to go!"));
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Hey, your form is missing something!"),
              );
            },
          );
        }
      },
      child: Text("Validate Form"),
    );
  }

  Widget createSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // the common practice is to check if the form is valid using validate()
        // before using save()
        formKey.currentState?.save();
        setState(() {
          isFinal = true;
        });
      },
      child: Text("Submit Form"),
    );
  }

  Widget showSavedValues() {
    return !isFinal
        ? Container()
        : Column(
          children:
              [
                Text("Sino crush mo? ${formValues.textfieldValue}"),
                Text("Favorite Kpop group: ${formValues.dropdownValue}"),
              ] +
              formValues.checkboxValues.keys.map((key) {
                return Text(
                  "$key ${formValues.checkboxValues[key]! ? 'Syempre!' : 'Tapusin na natin to'}",
                );
              }).toList(),
        );
  }
}

// NOTE:

// ALL OF THESE FORM WIDGETS ARE PLACED IN THE SAME FILE,
// WHICH COULD GET REALLY CLUTTERED AND DIFFICULT TO MANAGE.
// TRY EXPLORING HOW WE CAN SEPARATE THESE WIDGETS INTO DIFFERENT LIBRARIES
// SO THAT IT'S EASIER TO MANAGE AND DEBUG. (HINT: SEARCH FOR CALLBACK FUNCTIONS)

// EXPLORING THIS IS OPTIONAL SINCE WE WILL BE DISCUSSING AN ALTERNATIVE WAY FOR MANAGING
// DIFFERENT LIBRARIES/STATES NEXT WEEK (WHICH IS RELATIVELY EASIER).
// HOWEVER, YOU ARE STILL ENCOURAGED TO EXPLORE IT JUST SO YOU'LL KNOW THE DIFFERENCE.
// YOU DON'T NECESSARILY HAVE TO IMPLEMENT IT, JUST TRY CHECKING OUT SOME SOLUTIONS ONLINE.
