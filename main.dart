import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Display Choice',
      home: MyFormList(),
    );
  }
}

// Define a custom Form widget.
class MyFormList extends StatefulWidget {
  const MyFormList({Key? key}) : super(key: key);
  @override
  _MyFormListState createState() => _MyFormListState();
}

// Define a corresponding State class.
// This class will hold the data related to the Form.
class _MyFormListState extends State<MyFormList> {
// Create a text controller and use it to retrieve the current value
// of the TextField.
  final myTextController = TextEditingController();
  final List<String> names = <String>[
    'Apple',
    'Orange',
    'Rambutan',
  ];

  @override
  void dispose() {
// Clean up the controller when the widget is disposed.
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Choice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter any number between 1 ~ 3",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
// When the user presses the button, show an alert dialog containing
// the text that the user has entered into the text field.
        onPressed: () {
          var one = int.parse(myTextController.text) - 1;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('${names[one]}'),
                );
              });
        },
        tooltip: 'Show the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
