import 'dart:core';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MagiX App',
      home: MyHomePage(),
    );
  }
}

enum SingingCharacter { Male, Female }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var _cities = ['Warangal', 'Hyderabad', 'Karimnagar', 'Ranga Reddy'];
  var _currentItemSelected = 'Warangal';
  SingingCharacter _character = SingingCharacter.Male;

  bool checkBoxValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MAGiX Application')),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            DropdownButton<String>(
              key: Key('dropdown'),
              items: _cities.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected){
                _onDropDownItemSelected(newValueSelected);
               
              },
              value: _currentItemSelected,
            ), 
            ListTile(
              key: Key('MaleOption'),
              title: const Text('Male'),
              leading: Radio(
                value: SingingCharacter.Male,
                groupValue: _character,
                autofocus: true, 
                onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
                },
              ),
            ),
            ListTile(
              key: Key('FemaleOption'),
              title: const Text('Female'),
              leading: Radio(
                value: SingingCharacter.Female,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
                },
              ),
            ),
            Checkbox(
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              },
            ),
            Text("First Checkbox"),
            Checkbox(
              key: Key('First Checkbox'),
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              },
            ),
            Text("Second Checkbox"),
            Checkbox(
              key: Key('Second Checkbox'),
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              },
            ),
            Text("Third Checkbox")
          ]
          ),
        )
      ),
      
    );
  }

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}