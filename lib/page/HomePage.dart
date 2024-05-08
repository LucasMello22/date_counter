import 'package:flutter/material.dart';

import '../main.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Diferença de Datas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DateDifferencePage(),
    );
  }
}

class DateDifferencePage extends StatefulWidget {
  @override
  _DateDifferencePageState createState() => _DateDifferencePageState();
}

class _DateDifferencePageState extends State<DateDifferencePage> {
  late DateTime _startDate;
  late DateTime _endDate;
  int _differenceDays = 0;

  @override
  void initState() {
    super.initState();
    // Inicializando as datas com a data atual
    _startDate = DateTime.now();
    _endDate = DateTime.now();
    // Calculando a diferença inicialmente
    _calculateDifference();
  }

  void _calculateDifference() {
    // Calculando a diferença em dias
    final difference = _endDate.difference(_startDate).inDays;
    setState(() {
      _differenceDays = difference.abs();
    });
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final pickedStartDate = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate) {
      setState(() {
        _startDate = pickedStartDate;
      });
      _calculateDifference();
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final pickedEndDate = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedEndDate != null && pickedEndDate != _endDate) {
      setState(() {
        _endDate = pickedEndDate;
      });
      _calculateDifference();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB9CCF2),
      body:
      Stack(
     children: [
       Positioned(
        left: -60,
        top: 650,
        child: CustomPaint(
          size: Size(300, 300),
          painter: EllipsePainter(color: Color.fromRGBO(10, 72, 233, 0.42)),
        ),
      ),
      Positioned(
        left: 206.02,
        top: -116,
        child: CustomPaint(
          size: Size(300, 300),
          painter: EllipsePainter(color: Color.fromRGBO(10, 72, 233, 0.42)),
        ),
      ),

          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Data de Início: ${_startDate.day}/${_startDate.month}/${_startDate.year}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectStartDate(context),
              child: Text('Selecionar Data de Início'),
            ),
            SizedBox(height: 40),
            Text(
              'Data de Fim: ${_endDate.day}/${_endDate.month}/${_endDate.year}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectEndDate(context),
              child: Text('Selecionar Data de Fim'),
            ),
            SizedBox(height: 40),
            Text(
              'Diferença em Dias: $_differenceDays',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
     ],),
    );

  }
}