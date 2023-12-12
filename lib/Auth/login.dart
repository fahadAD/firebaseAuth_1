
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth1/Auth/signup.dart';
import 'package:firebase_auth1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginEmailController=TextEditingController();
  TextEditingController loginPasswordController=TextEditingController();

void LoginFunction()async{
  if(loginEmailController.text != '' && loginPasswordController.text != ''){
    if(loginEmailController.text.contains('@') && loginEmailController.text.contains('.com') ){
      try{

        var auth=FirebaseAuth.instance;
        UserCredential users=await auth.signInWithEmailAndPassword(
            email: loginEmailController.text,
            password: loginPasswordController.text);

        if(users.user !=null){
          EasyLoading.showSuccess("Login Successfully Done");
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
        }else{
          EasyLoading.showError("Something is Wrong");
        }
      }on FirebaseAuthException catch (e) {
        EasyLoading.showError(e.code);
      } catch(e){
        EasyLoading.showError(e.toString());
      }

    }else{
      EasyLoading.showError("Enter a valid email");
    }
  }else{
    EasyLoading.showError("Enter email & password");
  }
}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

// Center(
//   child:   Container(
//
//     width: MediaQuery.of(context).size.width*0.8,
//
//     height: 500,
//
//     decoration: BoxDecoration(
// border: Border.all(color: Colors.black,width: 3),
//       borderRadius: BorderRadius.only(
//
//         topLeft: Radius.circular(40),
//
//         bottomRight: Radius.circular(40),
//
//
//
//       ),
//
//       color: Colors.white
//
//     ),
// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//    children: [
//      SizedBox(height: 30,),
//     IconButton(onPressed: () {
//
//     }, icon: Icon(Icons.person_pin,color: Colors.teal,size: 60,)),
//      SizedBox(height: 30,),
//      Container(
//        height: 45,
//        width: MediaQuery.of(context).size.width*0.7,
//        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.blueGrey),
//        child: Center(
//          child: TextFormField(
//            style: TextStyle(color: Colors.white),
//            decoration: InputDecoration(
//
//                enabledBorder: InputBorder.none,
//                focusedBorder: InputBorder.none,
//                prefixIcon: Icon(Icons.person,color: Colors.white,),
//                labelText: "E-mail",
//                labelStyle: TextStyle(color: Colors.white)
//            ),),
//        ),
//      ),
//      SizedBox(height: 30,),
//      Container(
//        height: 45,
//        width: MediaQuery.of(context).size.width*0.7,
//        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.blueGrey),
//        child: Center(
//          child: TextFormField(
//            style: TextStyle(color: Colors.white),
//            decoration: InputDecoration(
//
//                enabledBorder: InputBorder.none,
//                focusedBorder: InputBorder.none,
//                prefixIcon: Icon(Icons.attach_email_outlined,color: Colors.white,),
//                labelText: "Password",
//                labelStyle: TextStyle(color: Colors.white)
//            ),),
//        ),
//      ),
//
//
//
//    ],
// ),
//   ),
// )


            Text("Login"),
            SizedBox(height: 20,),
            TextFormField(
              controller: loginEmailController,
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: loginPasswordController,
            ),
            SizedBox(height: 20,),


            ElevatedButton(onPressed: () async {

             LoginFunction();

            }, child: Text("Login")),


            SizedBox(height: 40,),




            TextButton(onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
            }, child: Text("Sign up",style: TextStyle(color: Colors.red),)),

          ],
        ),
      ),
    );
  }
}