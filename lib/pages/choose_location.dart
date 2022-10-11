import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations=[
    WorldTime(location: 'Auckland', flag: 'nz.png', url: 'Pacific/Auckland'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Delhi', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Hong Kong', flag: 'hk.png', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Los Angeles', flag: 'usa.png', url: 'America/Los_Angeles'),
    WorldTime(location: 'Johannesburg', flag: 'sa', url: 'Africa/Johannesburg'),
    WorldTime(location: 'Moscow', flag: 'rus.png', url: 'Europe/Moscow'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Singapore', flag: 'singa.png', url: 'Asia/Singapore'),
    WorldTime(location: 'Shanghai', flag: 'china.png', url: 'Asia/Shanghai'),
    WorldTime(location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),
    WorldTime(location: 'Toronto', flag: 'canada.png', url: 'America/Toronto'),

  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title:Text('Choose a location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          })
    );
  }
}
