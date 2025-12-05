import 'package:demoproject/core/shared_pref.dart';
import 'package:demoproject/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     floatingActionButton: FloatingActionButton(
          child: Text("logout"),
          onPressed: ()async{
          await AppPrefs.clearTokens();
         Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => HomePage()),
);

        }),
    );
  }
}