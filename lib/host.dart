import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Organise extends StatelessWidget {
  final nameController = TextEditingController();
  final emailIdController = TextEditingController();
  final partyNameController = TextEditingController();
  final numberController = TextEditingController();
  final dateOfEventController = TextEditingController();
  final timingController = TextEditingController();
  final addressController = TextEditingController();
  final themeController = TextEditingController();
  final otherCommentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Host')),
            body: ListView(
              children: <Widget>[
                Card(
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Event Details",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(

                                labelText: 'Full Name',
                              ),
                            ),
                            TextField(
                              controller: emailIdController,
                              decoration: InputDecoration(

                                labelText: 'EmailId',
                              ),
                            ),
                            TextField(
                              controller: partyNameController,
                              decoration: InputDecoration(

                                labelText: 'Event Name',
                              ),
                            ),
                            TextField(
                              controller: numberController,
                              decoration: InputDecoration(

                                labelText: 'Number of guests expected',
                              ),
                            ),
                            TextField(
                              controller: dateOfEventController,
                              decoration: InputDecoration(

                                labelText: 'Date of the event',
                              ),
                            ),
                            TextField(
                              controller: timingController,
                              decoration: InputDecoration(

                                labelText: 'Timing of the event',
                              ),
                            ),
                            TextField(
                              controller: addressController,
                              decoration: InputDecoration(

                                labelText: 'Venue Address',
                              ),
                            ),
                            TextField(
                              controller: themeController,
                              decoration: InputDecoration(

                                labelText: 'Theme Of The Event',
                              ),
                            ),
                            TextField(
                              controller: otherCommentsController,
                              decoration: InputDecoration(

                                labelText: 'Special Comments',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(30.0)),
                                color: Colors.blue,
                                child: new Text('Organise Event',
                                    style: new TextStyle(
                                        fontSize: 20.0, color: Colors.white)),
                                onPressed: () {
//                                  if (nameController.text.isNotEmpty &&
//                                      emailIdController.text.isNotEmpty &&
//                                      numberController.text.isNotEmpty &&
//                                      addressController.text.isNotEmpty &&
//                                      dateOfEventController.text.isNotEmpty &&
//                                      themeController.text.isNotEmpty && timingController.text.isNotEmpty) {
                                    Firestore.instance.collection('Events').add({
                                      "Name": nameController.text,
                                      "EmailId": emailIdController.text,
                                      "Guests": numberController.text,
                                      "Date Of Event": dateOfEventController.text,
                                      "Time": timingController.text,
                                      "Theme":
                                      themeController.text,
                                      "Address": addressController,
                                    });
//                                    Navigator.pop(context);

                                },
                              ),
                            )
                          ]),
                    )),
              ],
            )));
  }
}
