import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:n_p/SignUp page.dart';
import 'package:n_p/partypage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final databaseReference = Firestore.instance;

  final usernameController = TextEditingController();

  final homePasswordController = TextEditingController();

  bool checking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: homePasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: checking
                          ? CircularProgressIndicator()
                          : RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: Colors.blue,
                              child: new Text('Login',
                                  style: new TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                              onPressed: () {
                                compareData();
                              },
                              textColor: Colors.white,

//                    child: Container(
//                        alignment: Alignment.center,
//                        decoration: const BoxDecoration(
//                          gradient: LinearGradient(
//                            colors: <Color>[
//                              Color(0xFF0D47A1),
//                              Color(0xFF1976D2),
//                              Color(0xFF42A5F5),
//                            ],
//                          ),
//                        ),
//                        padding: const EdgeInsets.all(10.0),
//                        child: const Text('LOGIN',
                              //                  style: TextStyle(fontSize: 20))
                            ),
                    ),
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.blue,
                      child: new Text('Sign Up',
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white)),

                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignUp())),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),

//                    child: Container(
//                        alignment: Alignment.center,
//                        decoration: const BoxDecoration(
//                          gradient: LinearGradient(
//                            colors: <Color>[
//                              Color(0xFF0D47A1),
//                              Color(0xFF1976D2),
//                              Color(0xFF42A5F5),
//                            ],
//                          ),
//                        ),
//                        padding: const EdgeInsets.all(10.0),
//                        child: const Text('SIGN UP',
//                            style: TextStyle(fontSize: 20)))
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> compareData() async {
//    var name=
//    databaseReference
//        .collection("users")
//        .getDocuments()
//        .then((QuerySnapshot snapshot) {
//      snapshot.documents.forEach((f) =>'$f.data["Name"]' );
//    });
    setState(() {
      checking = true;
    });
    DocumentSnapshot doc;
    await Firestore.instance
        .collection("users")
        .where("EmailId", isEqualTo: "harshharsola@gmail.com")
        .getDocuments()
        .then((querysnap) {
      doc = querysnap.documents[0];
    });
    print(doc.data);
    print(usernameController);
    print(homePasswordController);
    if (doc.data["EmailId"] == usernameController.text &&
        doc.data["Password"] == homePasswordController.text) {
      doc.reference.updateData({"Loged in": true});
      setState(() {
        checking = false;
        print("done");
      });
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Party()));
    } else
      setState(() {
        checking = false;
        print("false");
      });
  }
}
