import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                  child: SizedBox(
                      height: 350, width: 350, child: Widget3DModel())),
              Container(
                child: SizedBox(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            controller.playAnimation(
                                animationName: "SmolAnimationsRESOURCE");
                          },
                          child: Text("SmolAnimationsRESOURCE")),
                      SizedBox(height: 10.0,),
                      ElevatedButton(
                          onPressed: () {
                            controller.playAnimation(animationName: "ParadeWalkLeft");
                          },
                          child: Text("ParadeWalkLeft")),
                      SizedBox(height: 10.0,),
                      ElevatedButton(
                          onPressed: () {
                            controller.playAnimation(animationName: "idle");
                          },
                          child: Text("idle")),
                    ],
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}

class Widget3DModel extends StatefulWidget {
  @override
  _Widget3DModelState createState() => _Widget3DModelState();
}

late Flutter3DController controller;

class _Widget3DModelState extends State<Widget3DModel> {
  @override
  void initState() {
    super.initState();
    controller = Flutter3DController();
    Future.delayed(Duration(seconds: 10), () async{
      setState(() {
        controller.playAnimation(animationName: "idle");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flutter3DViewer(
        progressBarColor: Colors.blue,
        controller: controller,
        src: 'assets/watson.glb',
      ),
    );
  }
}
