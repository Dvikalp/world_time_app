import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time;
  late String flag;
  late String url;
  WorldTime({required this.location,required this.flag,required this.url});
  Future <void> getTime ()async{

    Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data=jsonDecode(response.body);
    print(data);
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    String offsetmin = data["utc_offset"].substring(4, 6);
    String plusOrMinus=data['utc_offset'].substring(0,1);
    print(datetime);
    print(offset);
    DateTime now=DateTime.parse(datetime);
    if(plusOrMinus=='-'){
      now= now.subtract(Duration(hours: int.parse(offset),minutes: int.parse(offsetmin)));
    }
    else{
      now= now.add(Duration(hours: int.parse(offset),minutes: int.parse(offsetmin)));
    }
    //time=now.toString();
    time=DateFormat.jm().format(now);
    print(time);

  }
}
