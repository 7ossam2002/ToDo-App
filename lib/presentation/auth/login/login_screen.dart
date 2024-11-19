import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/routes_manager.dart';
import 'package:todo/core/strings_manager.dart';
import 'package:todo/database_manager/model/user_dm.dart';
import '../../../core/constant_manager.dart';
import '../../../core/images_manager.dart';
import '../../../core/reusable_components/custom_text_form_field.dart';
import '../../../core/utiles/dialog_utiles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  TextEditingController passwordController=TextEditingController();
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



              SizedBox(height: 15,),
              Text(AppLocalizations.of(context)!.email,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height: 8,),
              CustomTextFormField(hintText: AppLocalizations.of(context)!.enter_your_email, validator: (input){
                if(input==null||input.trim().isEmpty){
                  return "please enter your e-mail";
                }
                return null;

              },
                controller: emailController,

              ),
              /////////////////////////
              SizedBox(height: 15,),
              Text(AppLocalizations.of(context)!.password,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height: 8,),
              CustomTextFormField(hintText: AppLocalizations.of(context)!.enter_your_password, validator: (input) {
                if(input==null||input.trim().isEmpty){
                  return "please enter your password";
                }
              },
                controller: passwordController,
                isSecure: true,

              ),

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
                      signIn(context);
                    }, child:Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10),
                  child: Text(AppLocalizations.of(context)!.sign_in,style: GoogleFonts.poppins(color: Color(0xFF004182),fontSize: 20,fontWeight: FontWeight.w600),),
                ) ),
              ),
               Center(
                child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                     Text(AppLocalizations.of(context)!.dont_have_account,style: TextStyle(color: Colors.white,),),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed(RoutesManager.registerRoute);
                      },
                      child:  Text(AppLocalizations.of(context)!.sign_up,style: TextStyle(color: Colors.red,decoration: TextDecoration.underline),),
                    ),


                  ],
                ),
              )],
          ),
        ),
      ),
    );
  }
   void signIn(context)async{


     try {
       DialogUtiles.showLoadingDialog(context,message:"Loading...");
       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailController.text,
         password: passwordController.text,
       );
       UserDm.userDm=await getUserFromFireStore(credential.user!.uid);
       DialogUtiles.hideDialog(context);
       DialogUtiles.showMessageDialog(context,content: "User logged in successfully",posActionTitle: "Ok",posAction: (){
         Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
       });
     } on FirebaseAuthException catch (authError) {
       DialogUtiles.hideDialog(context);
       String message;
       if (authError.code == AppConstant.invalidCredentialMessage) {
         message=AppConstant.wrongEmailOrPasswordMessage;
       }
       else{
         message="Try Again";
       }
       DialogUtiles.showMessageDialog(context,title: "Error",content: message,posActionTitle: "Ok");
     } catch (e) {
       DialogUtiles.hideDialog(context);
       DialogUtiles.showMessageDialog(context,title: "Error",content: e.toString(),posActionTitle: "Ok");

       print(e);
     }
   }

  Future<UserDm> getUserFromFireStore(String uid)async{
    CollectionReference collectionReference=FirebaseFirestore.instance.collection(UserDm.collectionName);
   DocumentReference userDoc= collectionReference.doc(uid);
   DocumentSnapshot documentSnapshot=await userDoc.get();
   var json=documentSnapshot.data()as Map<String,dynamic>;
   return UserDm.fromFireStore(json);
   }

}
