import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/constant_manager.dart';
import 'package:todo/core/images_manager.dart';
import 'package:todo/core/reusable_components/custom_text_form_field.dart';
import 'package:todo/core/strings_manager.dart';
import 'package:todo/core/utiles/dialog_utiles.dart';
import 'package:todo/database_manager/model/user_dm.dart';

import '../../../core/routes_manager.dart';
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController fullNameController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController rePasswordController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004281),
      appBar: AppBar(
        toolbarHeight: 5,
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(ImagesManager.loginPage,height: 250,),

              SizedBox(height: 15,),
              Text("full name",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height: 8,),
              CustomTextFormField(hintText: "enter your full name", validator: (input) {
                if(input==null||input.trim().isEmpty){
                  return "please enter your full name";
                }
              },
                controller: fullNameController,

              ),

              //////////////////////////
              SizedBox(height: 15,),
              Text("user name",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height: 8,),
              CustomTextFormField(hintText: "enter your user name", validator: (input) {
                if(input==null||input.trim().isEmpty){
                  return "please enter your user name";
                }
              },
                controller: userNameController,

              ),
              ////////////////////////////
              SizedBox(height: 15,),
              Text("e-mail",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height: 8,),
              CustomTextFormField(hintText: "enter your e-mail", validator: (input) {
                if(input==null||input.trim().isEmpty){
                  return "please enter your e-mail";
                }

              },
                controller: emailController,

              ),
              /////////////////////////
              SizedBox(height: 15,),
              Text("password",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height: 8,),
              CustomTextFormField(hintText: "enter your password", validator: (input) {
                if(input==null||input.trim().isEmpty){
                  return "please enter your password";
                }
              },
                controller: passwordController,
                isSecure: true,

              ),
              ////////////////////////
              SizedBox(height: 15,),
              Text("confirm password",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height: 8,),
              CustomTextFormField(hintText: "enter your password again", validator: (input) {
                if(input==null||input.trim().isEmpty){
                  return "please enter your password";
                }
                // if(input.length<6){
                //   return "password should be at least 6 characters";
                // }
              },
                controller: rePasswordController,
                isSecure: true,
              ),
              ////////////////////
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    )
                  ),
                    onPressed: (){
                    signUp(context);
                  //register(),
                }, child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("Sign Up",style: GoogleFonts.poppins(color: Color(0xFF004182),fontSize: 20,fontWeight: FontWeight.w600),),
                ) ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text("Already have account ? ",style: TextStyle(color: Colors.white,),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed(RoutesManager.loginRoute);
                        },
                        child: const Text(StringsManager.signIn,style: TextStyle(color: Colors.red,decoration: TextDecoration.underline),),
                      ),


                    ],
                  ),
                ),
              )],
          ),
        ),
      ),
    );
  }
  void signUp(context)async{


    try {
      DialogUtiles.showLoadingDialog(context,message:"Loading...");
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: emailController.text,
        password: passwordController.text,
      );
      UserDm user =UserDm(id: credential.user!.uid, fullName: fullNameController.text, userName: userNameController.text, email: emailController.text);
      addUserToFirebase(user);
      DialogUtiles.hideDialog(context);
      DialogUtiles.showMessageDialog(context,content: "User register successfully",posActionTitle: "Ok",posAction: (){
        Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
      });
    } on FirebaseAuthException catch (authError) {
      DialogUtiles.hideDialog(context);
      String message;
      if (authError.code == AppConstant.weakPassword) {
        message=AppConstant.weakPassMessage;
      } else if (authError.code ==AppConstant.emailAlreadyInUse ) {
       message=AppConstant.inUseEmailMessage;
      }else{
        message=AppConstant.wentWrongMessage;
      }
      DialogUtiles.showMessageDialog(context,title: "Error",content: message,posActionTitle: "Ok");
    } catch (e) {
      DialogUtiles.hideDialog(context);
      DialogUtiles.showMessageDialog(context,title: "Error",content: e.toString(),posActionTitle: "Ok");

      print(e);
    }
  }

  void addUserToFirebase(UserDm user)async{
    CollectionReference collectionReference= FirebaseFirestore.instance.collection(UserDm.collectionName);
    DocumentReference addUser=collectionReference.doc(user.id);
   await addUser.set(
      user.toFireStore()
    );
  }
}
