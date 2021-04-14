import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'inputcheck',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Prime and Composite number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final thecontroller = TextEditingController();
  String message = "";

  bool _isPrimeOrNot(int num) {
    int prime = 1;
    Text("enter number");
    if (num < 2) return false;

    for (int i = 2; i <= num / 2; i++) {
      if (num % i == 0) {
        prime = 0;
        break;
      } else
        prime = 1;
    }
    if (prime == 1)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: new TextField(
                  controller: thecontroller,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter a number"),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(20)),
                  ElevatedButton(
                      child: Text(
                        "Check",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        var number =
                            int.parse(thecontroller.text); // number define
                        if (_isPrimeOrNot(number))
                          setState(() {
                            message = "Number is a prime number";
                          });
                        else
                          setState(() {
                            message = "Number is a composite number";
                          });
                      }),
                ],
              ),
            ),
            Text(message)
          ],
        ),
      ),
    );
  }
}
