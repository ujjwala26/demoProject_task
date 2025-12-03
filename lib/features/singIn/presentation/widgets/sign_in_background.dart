import 'package:flutter/material.dart';

class SignInBackground extends StatelessWidget {
  const SignInBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(

      children: [
              Positioned(
                top: -height * 0.15,
                right: -width * 0.40,
                child: Image.asset(
                  "assets/images/Vibrant Monstera Leaf Detail.png",
                  width: 500,
                ),
              ),
              Positioned(
                top: height * 0.25,

                right: -width * 0.45,

                child: Transform.rotate(
                  angle: 50 * 3.14 / 180,
                  child: Image.asset(
                    "assets/images/Vibrant Monstera Leaf Detail.png",
                    width: width * 0.70,
                  ),
                ),
              ),

              Positioned(
                bottom: -height * 0.1,
                left: -width * 0.3,
                child: Transform.rotate(
                  angle: 180 * 3.1415926535 / 180,

                  child: Opacity(
                    opacity: 0.15,
                    child: Image.asset(
                      "assets/images/Vibrant Monstera Leaf Detail.png",
                      width: width * 0.9,
                    ),
                  ),
                ),
              ),
      ],
      
    );
  }
}