import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Obliviate"), centerTitle: true,),
      body:Center(
        child: Padding(
          padding:EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 100,
                  child: Image.asset("assets/logo1.png",
                      fit: BoxFit.contain)),
              Text("say yes to create memories & cherish it", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height:10),
              Text(
                "Name",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                )),
              Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height:10),
              ActionChip(label: Text("Logou"), onPressed: (){}),

            ],
          ),
        ),

      )

    );
  }
}
