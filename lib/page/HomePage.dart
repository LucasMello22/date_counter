import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _dataInicial;
  late DateTime _dataFinal;
  late int _quantidadeDias;

  @override
  void initState() {
    super.initState();
    _dataInicial = DateTime(2022, 12, 23);
    _dataFinal = DateTime(2023, 12, 18);
    _calcularQuantidadeDias();
  }

  void _calcularQuantidadeDias() {
    setState(() {
      _quantidadeDias = _dataFinal.difference(_dataInicial).inDays;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB9CCF2),
      body: Stack(
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Data Inicial:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${_dataInicial.day}/${_dataInicial.month}/${_dataInicial.year}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Data Final:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${_dataFinal.day}/${_dataFinal.month}/${_dataFinal.year}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Quantidade de Dias:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    _quantidadeDias.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _mostrarDatePickerInicial(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Selecionar Data Inicial'),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _mostrarDatePickerFinal(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Selecionar Data Final'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDatePickerInicial(BuildContext context) async {
    final DateTime? novaDataInicial = await showDatePicker(
      context: context,
      initialDate: _dataInicial,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (novaDataInicial != null && novaDataInicial != _dataInicial) {
      setState(() {
        _dataInicial = novaDataInicial;
        _calcularQuantidadeDias();
      });
    }
  }

  void _mostrarDatePickerFinal(BuildContext context) async {
    final DateTime? novaDataFinal = await showDatePicker(
      context: context,
      initialDate: _dataFinal,
      firstDate: _dataInicial,
      lastDate: DateTime.now(),
    );
    if (novaDataFinal != null && novaDataFinal != _dataFinal) {
      setState(() {
        _dataFinal = novaDataFinal;
        _calcularQuantidadeDias();
      });
    }
  }
}

class EllipsePainter extends CustomPainter {
  final Color color;

  EllipsePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


