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
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: size.width*0.50,
                left: size.height*0.50,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
