import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for the UI
  String time = ""; //time in that location
  String flag; //URL to an asset flag icon
  String url; //location URL for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url });


  Future<void> getTime() async {

    //make request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0,3);
    //print(datetime);
    //print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);


    //set the time property
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);


  }

}


