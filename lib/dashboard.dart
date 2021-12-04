import 'package:flutter/material.dart';
import './animation.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left),
          color: Colors.black,
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/one.jpg'),
                radius: 25.0,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fade(
                child: Text('Today',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0))),
            const SizedBox(height: 25.0),
            Row(
              children: <Widget>[
                Expanded(
                    child: Fade(
                        child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Colors.blue,
                                  Colors.blue.withOpacity(.7)
                                ])),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Steps",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "3 500",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            )))),
                Expanded(
                    child: Fade(
                        child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red.withOpacity(.7)])),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Sports",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "25 Min",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                )))
              ],
            ),
            const SizedBox(height: 40.0),
            Fade(
                child: Text('Health Catrgories',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0))),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: [
                  Fade(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.2)))),
                    child: Text(
                      "Activity 1",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Fade(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.2)))),
                    child: Text(
                      "Activity 2",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Fade(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.2)))),
                    child: Text(
                      "Activity 3",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Fade(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.2)))),
                    child: Text(
                      "Activity 4",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
