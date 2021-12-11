import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/register.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController= new TextEditingController();
  final TextEditingController passwordController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField =TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value)
      {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );
    //password field
    final passwordField =TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      onSaved: (value)
      {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

    final loginButton =Material  (
     elevation: 5,
      borderRadius:  BorderRadius.circular(30),
      color: Colors.tealAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20, color: Colors.black38,fontWeight: FontWeight.bold ),
        )),


      );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    SizedBox(
                      height: 200,
                        child: Image.asset("assets/logo1.png",
                      fit: BoxFit.contain)),
                    SizedBox(height: 45),


                    emailField ,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Text("Dont have an account?"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=> RegistrationScreen()));
                          },
                          child: Text("SignUp",style: TextStyle(
                             color: Colors.black,
                              fontWeight: FontWeight.w600,fontSize: 15),
                          ),
                        )
                        
                      ],
                    )
                  ],
                ),
              ),
            ),


          ),
        ),
      ),

    );
  }
}