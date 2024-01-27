import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'world_time_daytime.PNG' : 'world_time_nighttime.PNG';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
              child: Column(
                children: <Widget>[
                  //SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: bgColor,
                        width: 411,
                        height: 30,
                        child: Text(
                          data['location'],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(textStyle:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                            color: Colors.grey[50], )
                          ),
                        ),
                      ),
                    ]
                  ),
                  //SizedBox(height: 20.0),
                  Container(
                    color: data['isDaytime'] ? Colors.white30 : Colors.white10,
                    width: 411,
                    child: Text(
                      data['time'],
                      textAlign: TextAlign.center,
                      style:
                      GoogleFonts.lato(textStyle: TextStyle(
                        fontSize: 78.0,
                        color: data['isDaytime'] ? Colors.lightBlue[900] : Colors.grey[50],
                      ))
                    ),
                  ),
                  Container(
                    width: 411,
                    height: 8,
                    color: bgColor,
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 110,
                    height: 35,
                    child: FloatingActionButton(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      },
                      backgroundColor: bgColor,
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                      child: Text(
                          'Edit Location',
                          style: GoogleFonts.lato(textStyle: TextStyle(
                            color: Colors.grey[50],
                            fontWeight: FontWeight.w600,
                          ))
                      ),
                    ),
                  ),
                ]
              ),
            ),
          )
      ),
    );
    }
  }

