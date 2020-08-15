import 'dart:math';

import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  double _calculation;
  String _calcResult;
  String _result;

  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFieldController = new TextEditingController();
  TextEditingController _weightFieldController = new TextEditingController();

  void _calculateBMI() {
    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);
    if (height != null && weight != null) {
      setState(() {
        _calculation = weight /pow(height/120,2);
        _calcResult = _calculation.toStringAsFixed(2);
        if (_calculation >= 28) {
          _result = 'OBESE';
        } else if (_calculation >= 23) {
          _result = 'OVERWEIGHT';
        } else if (_calculation >= 17.5) {
          _result = 'NORMAL';
        } else {
          _result = 'UNDERWEIGHT';
        }
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI CALCULATOR'),
      ),
      body: ListView(
        padding: EdgeInsets.all(3.5),
        children: [
          Image.asset(
            'images/bmi.png',
            height: 200.0,
            width: 200.0,
          ),
          SizedBox(height: 20,),
          Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _ageFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Umur', icon: Icon(Icons.calendar_today)),
                ),
                TextField(
                  controller: _heightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Tinggi (cm)', icon: Icon(Icons.info)),
                ),
                TextField(
                  controller: _weightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Berat (kg)',
                      icon: Icon(Icons.shutter_speed)),
                ),
                new Padding(
                  padding: EdgeInsets.all(7.5),
                ),
                new RaisedButton(
                  onPressed: _calculateBMI,
                  child: new Text(
                    'HITUNG BMI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(5.5),
          ),
          new Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _calcResult != null ? '$_calcResult' : '',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w800,
                      fontSize: 44.5),
                ),
                Text(
                  _result != null ? _result : '',
                  style: TextStyle(fontSize: 28.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
