import 'package:flutter/material.dart';
import 'package:inclinationapp/gyroscope.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GyroscopeScreen(),
    );
  }
}


//   Widget build(BuildContext context) {
//     kk();
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text("x: ${_gyroscopeEvent?.x}"),
//               Text("y: ${_gyroscopeEvent?.y}"),
//               Text("z: ${_gyroscopeEvent?.z}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





