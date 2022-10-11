import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty? data:ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch (e) {
      data = data;
    }
    print(data);
    return Scaffold(
      backgroundColor:Colors.blue,
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/day.jpg'),
                fit: BoxFit.cover,
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(
                  children: [
                    TextButton.icon(
                      onPressed: () async{
                        dynamic result=await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data={
                            'time':result['time'],
                            'location':result['location'],
                            'flag':result['flag'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Edit location',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 40.0,
                              letterSpacing: 2.0,
                              color: Colors.black,
                            ))
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 80,
                        letterSpacing: 3,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
