import 'package:flutter/material.dart';
import 'package:n_p/main.dart';
import 'package:n_p/host.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Party extends StatefulWidget {
  @override
  _PartyState createState() => _PartyState();
}

class _PartyState extends State<Party> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                    child: Center(
                      child: Text(
                        "WELCOME!!",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        "Setup Profile",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(Icons.more_vert),
                      leading: Icon(Icons.person),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        "Organise",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(Icons.more_vert),
                      leading: Icon(Icons.event_available),
                      onTap:() {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Organise()));},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        "Your Events",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(Icons.more_vert),
                      leading: Icon(Icons.event_available),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        "Settings",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(Icons.more_vert),
                      leading: Icon(Icons.settings),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        "Log Out",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(Icons.more_vert),
                      leading: Icon(Icons.power_settings_new),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => MyHome()));
                      },
                    ),
                  )
                ],
              ),
            ),
            body: Container(
              child:ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  Container(
                    width: 160.0,
                    child: ListTile(title: Text("Party 1"),
                    subtitle: Text("Host Name ,Event Details , Venue , Entry Fees"),),
                  ),
                  Container(
                    width: 160.0,
                    child: ListTile(title: Text("Party 1"),
                      subtitle: Text("Host Name ,Event Details , Venue , Entry Fees"),),
                  ),
                  Container(
                    width: 160.0,
                    child: ListTile(title: Text("Party 1"),
                      subtitle: Text("Host Name ,Event Details , Venue , Entry Fees"),),
                  ),

                ],
              ),

            ),

            appBar: AppBar(title: Text("Party"))));
  }
}
