
import 'package:demoproject/core/shared_pref.dart';
import 'package:demoproject/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

Future<void> showLogoutPopup(BuildContext context) {
   return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context); 
              },
            ),
            TextButton(
              child: Text("Logout"),
              onPressed: () async {
                Navigator.pop(context); 

                await AppPrefs.clearTokens();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
            ),
          ],
        
        );
    
      }
    );
}
