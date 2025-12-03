import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
                height: height * 0.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 233, 213),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      right: -80,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 245, 233, 213),
                          BlendMode.multiply,
                        ),
                        child: Image.asset(
                          "assets/images/background1.jpeg",
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.arrow_back_ios, size: 28),
                          SizedBox(height: 10),
                          Text(
                            "Services",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}