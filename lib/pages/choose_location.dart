import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'Asia/Ho_Chi_Minh', location: 'Ho Chi Minh', flag: 'vietnam.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/Anchorage', location: 'Anchorage', flag: 'usa.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires', flag: 'argentina.png'),
    WorldTime(url: 'America/Edmonton', location: 'Edmonton', flag: 'canada.png'),
    WorldTime(url: 'America/Vancouver', location: 'Vancouver', flag: 'canada.png'),
    WorldTime(url: 'America/Halifax', location: 'Halifax', flag: 'canada.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),

  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                )
              )
            ),
          );
        },
      )
    );
  }
}
