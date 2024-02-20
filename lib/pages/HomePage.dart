import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = (data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments
            as Map<dynamic, dynamic>?)!;

    String night = 'assets/night.jpeg';
    String day = 'assets/day.png';

    String bgImage = data['isDayTime'] ? day : night;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/chooseLocation');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.amber[800],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.amber[800]),
                  )),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data?['location'],
                    style: TextStyle(
                        fontSize: 30, letterSpacing: 2, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66, color: Colors.white),
              )
            ],
          )),
        ),
      ),
    );
  }
}
