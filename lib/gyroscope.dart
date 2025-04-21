import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeScreen extends StatefulWidget {
  const GyroscopeScreen({super.key});

  @override
  State<GyroscopeScreen> createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  double _posX = 0.0;
  double _posY = 0.0;
  final double _blueCircleSize = 250;
  final double _whitheCircleSize = 60;
  final double _smoothingFactor = 0.2;
  final double _sensitivity =10.0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSuscription;

  @override
  void initState() {
    super.initState();
    _initGyroscope();
  }

  @override
  void dispose() {
    _accelerometerSuscription?.cancel();
    super.dispose();
  }

  void _initGyroscope() {
    _accelerometerSuscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _posX = _posX * (1 - _smoothingFactor) + event.x * _smoothingFactor;
        _posY = _posY * (1 - _smoothingFactor) + event.y * _smoothingFactor;
        
        final double maxDistance = 30;
        //sqrt((x2-x1)^2+(y2-y1)^2)
        final double distance = sqrt(pow(_posX, 2) + pow(_posY, 2));
        
        if (distance > maxDistance) {
          final double angle = atan2(_posY, _posX);
          _posX = maxDistance * cos(angle);
          _posY = maxDistance * sin(angle);
        }
      });
    }, onError: (e) {
      print("Error en el giroscopio: $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("x: $_posX y: $_posY"),),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: (size.height - _blueCircleSize) / 2,
              left: (size.width - _blueCircleSize) / 2,
              child: Container(
                height: _blueCircleSize,
                width: _blueCircleSize,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: (size.height - _whitheCircleSize) / 2 + _posY * _sensitivity,
              left: (size.width - _whitheCircleSize) / 2 + _posX * _sensitivity,
              child: Container(
                height: _whitheCircleSize,
                width: _whitheCircleSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}