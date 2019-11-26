import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatelessWidget {
  final nameController = TextEditingController();
  final emailIdController = TextEditingController();
  final contactController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  final emergencyController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('SignUp')),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Registeration",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Full Name',
                              ),
                            ),
                            TextField(
                              controller: emailIdController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'EmailId',
                              ),
                            ),
                            TextField(
                              controller: contactController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                labelText: 'Contact Number',
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: 'Password',
                              ),
                            ),
                            TextField(
                              controller: dobController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                labelText: 'Date of Birth',
                              ),
                            ),
                            TextField(
                              controller: emergencyController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phonelink_ring),
                                labelText: 'Emergency Contact info',
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                labelText: 'Address',
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'your +1 (if any)',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Colors.blue,
                                child: new Text('Sign Up',
                                    style: new TextStyle(
                                        fontSize: 20.0, color: Colors.white)),
                                onPressed: () {
                                  if (nameController.text.isNotEmpty &&
                                      emailIdController.text.isNotEmpty &&
                                      contactController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty &&
                                      dobController.text.isNotEmpty &&
                                      emergencyController.text.isNotEmpty) {
                                    Firestore.instance.collection('users').add({
                                      "Name": nameController.text,
                                      "EmailId": emailIdController.text,
                                      "Mobile Number": contactController.text,
                                      "Password": passwordController.text,
                                      "Date of birth": dobController.text,
                                      "Emergency Contact":
                                          emergencyController.text,
                                      "Loged in": false,
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            )
                          ]),
                    )),
              ],
            )));
  }
}
