import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:obliviate_app/screens/addNote.dart';
class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  CollectionReference ref = FirebaseFirestore.instance.collection('users')
      .doc(
      FirebaseAuth.instance.currentUser!.uid).collection('notes');
  // List<Color> myColors = [
  //   Colors.white60,
  //   Colors.cyanAccent,
  //   Colors.red,
  //   Colors.green,
  //   Colors.deepPurple,
  //   Colors.purple,
  //   Colors.cyan,
  //   Colors.teal,
  //   Colors.tealAccent,
  //   Colors.pink,
  // ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                },
                child: Icon(
                    Icons.refresh
                ),
              )
          ),
        ],
        toolbarHeight: 40,

      ),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.teal,
       onPressed: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddNote(),),);
       },
       child: Icon(
         Icons.add,
         color: Colors.white,
       ),
     ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: FutureBuilder <QuerySnapshot>(
          future: ref.get() ,


            builder: (context,  snapshot){
            if(snapshot.hasData){

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    // Random random = new Random();
                    // Color bg = myColors[random.nextInt(4)];
                    Color bg = Colors.white60;
                    var data = snapshot.data!.docs[index].data();
                    data = data.toString();


                    // DateTime mydateTime = data['created'].toDate();



                  return Card(
                    color: bg,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(

                              // "${snapshot.data!.docs[index].title}",
                            "${data}",
                            // ""

                          ),

                        ],
                      ),
                    ),
                  );
              });

            }else {
              return Center(
                  child: Text("Loading....")
              );
            }
        },
            ),
      ),
    );
  }
}
