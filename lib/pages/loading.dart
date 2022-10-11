import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="loading";
  void setupWorldTime() async{
    WorldTime instance=WorldTime(location: 'Delhi', flag: 'germany.png', url: 'Asia/Kolkata');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time=instance.time;
    });
    print(time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50,
        ),
      )
    );
  }
}
