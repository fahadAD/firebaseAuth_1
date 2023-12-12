import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController signupEmailController=TextEditingController();
  TextEditingController signupPasswordController=TextEditingController();

  void signUPFunction()async{
    if(signupEmailController.text !='' && signupPasswordController.text !=''){
      if(signupEmailController.text.contains('@') &&signupEmailController.text.contains('.com')){
        try{

          EasyLoading.show(status: "Loading..");
          var auth= FirebaseAuth.instance;

          UserCredential users=await auth.createUserWithEmailAndPassword(
              email: signupEmailController.text,
              password: signupPasswordController.text);

          if(users.user != null){
            EasyLoading.showSuccess("Signup Successfully Done");
            Navigator.pop(context);
          }
          else{
            EasyLoading.showError("Something is Wrong");
          }
        }on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            EasyLoading.showError('The password provided is too weak.');
          }
          else if (e.code == 'email-already-in-use') {
            EasyLoading.showError('The account already exists for that email.');
          }
        } catch(e){
          print(e.toString());
        }
      }else{
        EasyLoading.showError("Enter a valid E-mail");
      }
    }else{
      EasyLoading.showError("Enter email & password");

    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [



            Text("Sign up Here"),
            SizedBox(height: 20,),
            TextFormField(
              controller: signupEmailController,
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: signupPasswordController,
            ),
            SizedBox(height: 20,),


            ElevatedButton(onPressed: () async {

              signUPFunction();


            }, child: Text("Sign up")),


            SizedBox(height: 40,),




            TextButton(onPressed: () {
Navigator.pop(context);
            }, child: Text("Login",style: TextStyle(color: Colors.red),)),

          ],
        ),
      ),
    );
  }
}