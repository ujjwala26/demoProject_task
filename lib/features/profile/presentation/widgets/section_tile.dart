import 'package:flutter/material.dart';

Widget sectionTitle(String title){
  return Padding(
    padding: const EdgeInsets.all(22.0),
    child: Container(
      width: double.infinity,
      
      child: Text(title,
      style: TextStyle(
        color: const Color.fromARGB(255, 39, 123, 42),fontWeight: FontWeight.bold,fontSize: 20,
      ),),
    ),
  );

}

Widget MenuItem(String title){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(title),
      trailing: IconButton(onPressed: (){
    
      }, icon: Icon(Icons.arrow_forward_ios))),
  );
}