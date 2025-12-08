
import 'package:demoproject/features/profile/presentation/widgets/section_tile.dart';
import 'package:demoproject/features/profile/presentation/widgets/show_alertdialogue.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
      ),
      body: Column(
        children: [
         ListTile(
          leading:  CircleAvatar(
           radius: 30,
          ),
          title: Text("Maria Karmila"),
          subtitle: Text("email Id "),

         ),
           sectionTitle("Account"),
           MenuItem("Account Information"),
           MenuItem("Account Information"),
           MenuItem("Account Information"),
           MenuItem("Account Information"),

           sectionTitle("Privacy"),
           MenuItem("Accoun Information"),
           MenuItem("Account Information"),
           MenuItem("Account Information"),
           MenuItem("Account Information"),
           
           
          ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Logout"),
        onPressed: () {
          showLogoutPopup(context);
        },
      ),
    );
  }

  
    
   
}
