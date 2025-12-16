
import 'package:demoproject/features/signup/presentation/widgets/sign_up_background.dart';
import 'package:demoproject/features/signup/presentation/widgets/sign_up_form.dart';
import 'package:demoproject/core/shared_pref.dart';
import 'package:flutter/material.dart';



class SignUpPage extends StatefulWidget {
 const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int empId = 0;
  String orgId = '1';
  int createdBy = 0;
  int lastUpdatedBy = 0;
  String employeeId = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await AppPrefs.getUserData();
    if (user.isNotEmpty) {
      setState(() {
        employeeId = user['employeeId']?.toString() ?? '';
        final userIdStr = user['userId']?.toString();
        final uid = int.tryParse(userIdStr ?? '') ?? 0;
        empId = uid;
        createdBy = uid;
        lastUpdatedBy = uid;
        orgId = user['orgId']?.toString() ?? '1';
      });
    } else {
      final userIdStr = await AppPrefs.getUserId();
      final uid = int.tryParse(userIdStr ?? '') ?? 0;
      setState(() {
        empId = uid;
        createdBy = uid;
        lastUpdatedBy = uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const SignUpBackground(),
          SignUpForm(
            employeeId: employeeId,
            empId: empId,
            orgId: orgId,
            createdBy: createdBy,
            lastUpdatedBy: lastUpdatedBy,
          ),
        ],
      ),
    );
  }
}
