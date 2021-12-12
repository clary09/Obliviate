 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obliviate_app/model/user_model.dart';
import 'package:obliviate_app/screens/login.dart';
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(

              child: Text(
                'Welcome to Oblivate!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),

            ),
            decoration: BoxDecoration(
              color: Colors.cyan[900],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Location'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Emergency call'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Know more About Alzeheimer'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {

    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){  this.loggedInUser = UserModel.fromMap(value.data());
         setState(() {

         });

  });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // elevation: 0,
          // leading: IconButton(),
          title: Text("OBLIVIATE",), centerTitle: true,foregroundColor: Colors.white,),
        body:Center(
          child: Padding(
            padding:EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //     height: 100,
                //     child: Image.asset("assets/logo1.png",
                //         fit: BoxFit.contain)),
                Text("Create memories and cherish it!", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height:10),
                Text(
                    "${loggedInUser.firstName} ${loggedInUser.secondName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                    "${loggedInUser.email}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height:10),

                // ActionChip(label: Text("Logout"), onPressed: (){
                //   logout(context);
                // }),

              ],
            ),
          ),

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          logout(context);
          },
        backgroundColor: Colors.teal,
         child: const Icon(Icons.logout),
         ),

        );
  }

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>LoginScreen()));
  }


}
