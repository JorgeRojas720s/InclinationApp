import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeScreen extends StatefulWidget {
  const GyroscopeScreen({super.key});

  @override
  State<GyroscopeScreen> createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  GyroscopeEvent? _gyroscopeEvent;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSuscription;

  //cambiar en nuevas versiones
  void kk() {
    _gyroscopeSuscription = gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        setState(() {
          _gyroscopeEvent = event;
        });
      },
      onError: (e) {
        print("esta mrda no sirvió:   ${e}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    kk();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // El Stack centrado
            Stack(
              children: [
                Positioned(
                  top: (size.height - 300) / 2,
                  left: (size.width - 300) / 2,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top:
                      ((size.height - 50) / 2) +
                      (_gyroscopeEvent?.x ?? 0) * 100,
                  left:
                      ((size.width - 50) / 2) + (_gyroscopeEvent?.y ?? 0) * 100,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            // El texto debajo del Stack
            SizedBox(height: 20), // Espacio entre el stack y el texto
            Text("x: ${_gyroscopeEvent?.x}"), Text("y: ${_gyroscopeEvent?.y}"),
            SizedBox(height: 20), // Espacio entre el stack y el texto
            Text("z: ${_gyroscopeEvent?.z}"),
            SizedBox(height: 20), // Espacio entre el stack y el texto
          ],
        ),
      ),
    );
  }
}
