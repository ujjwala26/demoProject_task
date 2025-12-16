import 'package:flutter/material.dart';

Widget textFieldWidget({required TextEditingController controller, required String labelText,bool enabled = true,}){
            return TextFormField(
              controller: controller,
               enabled: enabled,
                          keyboardType: (labelText.toLowerCase().contains('email'))? TextInputType.emailAddress:  (labelText.toLowerCase().contains('age'))?TextInputType.number: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: labelText,
                           
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                              
                            ),
                          ),
                        );
  }