import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
            return Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 31, 98, 33),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bekasi Timur , 27 Nov 2023",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height * 0.02,
                                ),
                              ),
                              Text(
                                "33°C",
                                style: TextStyle(
                                  fontSize: height * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Humidity 76%",
                                style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              Container(
                                height: height * 0.08,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Image.asset(
                                  "assets/images/cloud.png",

                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Cloudy",
                                style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        "Today is a good day to apply pesticides",
                        style: TextStyle(fontSize: height * 0.02, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
  }
}