import 'package:flutter/material.dart';
import 'package:compasstools/compasstools.dart';

class CompassView extends StatefulWidget {
  @override
  _CompassViewState createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
  int _haveSensor;
  String sensorType;

  @override
  void initState() {
    super.initState();
    checkDeviceSensor();
  }
  Future<void> checkDeviceSensor() async{
    int sensorDetect;

    try{
      sensorDetect = await Compasstools.checkSensors;

      switch (sensorDetect) {
        case 0:
          sensorType = null;
          break;
        case 1:
          sensorType = "Accelerometer + Magnetometer";
          break;
        case 2:
          sensorType = "Gyroscope";
          break;
        default:
      }
    }on Exception{}
    if(!mounted)
      return;
    setState(() {
      _haveSensor = sensorDetect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Compass View'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                builder: (context, snapshot){
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(-snapshot.data / 360),
                          child: Image.asset("assets/compass.jpeg")
                        ),
                      ),
                      );
                  } else {
                    return Text("Error in stream");
                  }

                },
                stream: Compasstools.azimuthStream,
            ),Text('sensor Type : $sensorType')],
            
          ),
        ),
      )
    );
  }
    
}