import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogUtiles{
 static void showLoadingDialog(context, {required String message}){

   showDialog(context: context, builder: (context){
return AlertDialog(
  content: Row(
    children: [
      Text("Loading...",style: TextStyle(color: Colors.white),),
      Spacer(),
      CircularProgressIndicator(color: Colors.white,),
    ],
  ),
);
   },
   );

  }
 static void hideDialog(context){
   Navigator.pop(context);



  }
 static void showMessageDialog(context,{String?title,String?content,
 String?negActionTitle,posActionTitle,
   Function? posAction,Function?negAction
 }){
   showDialog(context: context, builder: (context)=>CupertinoAlertDialog(
     title: title!=null?Text(title):null,
     content:content !=null?Text(content):null,
     actions: [
       TextButton(onPressed: (){
         if(posActionTitle!=null)
         Navigator.pop(context);
         posAction?.call();
       }, child: Text(posActionTitle)),

       // TextButton(onPressed: (){
       //  // if(negActionTitle!=null)
       //     Navigator.pop(context);
       //     negAction?.call();
       // }, child: Text(negActionTitle??""))

     ],
   )

   );


  }

 }
