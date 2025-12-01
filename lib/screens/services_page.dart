import 'package:demoproject/servicesPage/bloc/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesBloc()..add(ServicesEvent()),
      child: Scaffold(
        backgroundColor:  Colors.white,
        //const Color(0xfffef7ec),
        body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(
                      
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
          height: 240,
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
                  colorFilter:ColorFilter.mode(Color.fromARGB(255, 245, 233, 213), BlendMode.multiply) ,
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
                  children: [
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
        ),

       SizedBox(height: 20,),

     
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Transform.translate(
            offset: const Offset(0, -60),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 238, 238, 238)
                )
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text("Search Services",
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
          ),
        ),

       

     
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 0.9,
          children: [
            serviceItem("assets/images/tools.jpeg", "Repair",),
            serviceItem("assets/images/rentals.jpeg", "Rentals"),
            serviceItem("assets/images/tractor.jpeg", "Tractors"),
            serviceItem("assets/images/logistics.jpeg", "Logistic"),
            serviceItem("assets/images/harvesting.jpeg", "Harvesting"),
            serviceItem("assets/images/hitech.jpeg", "Hi-Tech"),
          ],
                      ),
        ),
                  
                  
              const SizedBox(height: 20),
                  
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Provider Near me",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                
                                
                              
                
                              const SizedBox(height: 10),
                
                              providerCard(
                                image: "assets/images/farmer1.jpeg",
                                name: "Olivia Blanton",
                                address: "74C Aaliyah River, Hemilton",
                                type: "Walk in",
                                rating: 5.0,
                                jobs: 148,
                                price: 20,
                              ),
                
                              providerCard(
                                image: "assets/images/farmer2.jpeg",
                                name: "Darrell Steward",
                                address: "4 Novella Block, Hemilton",
                                type: "Walk in & Mobile",
                                rating: 4.5,
                                jobs: 225,
                                price: 16,
                              ),
                              providerCard(
                                image: "assets/images/farmer1.jpeg",
                                name: "Olivia Blanton",
                                address: "74C Aaliyah River, Hemilton",
                                type: "Walk in",
                                rating: 5.0,
                                jobs: 148,
                                price: 20,
                              ),
                              providerCard(
                                image: "assets/images/farmer2.jpeg",
                                name: "Darrell Steward",
                                address: "4 Novella Block, Hemilton",
                                type: "Walk in & Mobile",
                                rating: 4.5,
                                jobs: 225,
                                price: 16,
                              ),
                
                            ],
                          ),
              ),
                ]
          
              )
              )
              )
                  
      ),
    );
  }

  Widget serviceItem(String img, String title) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:  Colors.grey[200],
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image.asset(img,
           height: 100,
                     
            fit: BoxFit.cover,),
          
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget providerCard({
    required String image,
    required String name,
    required String address,
    required String type,
    required double rating,
    required int jobs,
    required double price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, width: 120, height: 120, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                Divider(),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 86, 180, 89),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.white),
                          const SizedBox(width: 3),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "$jobs Jobs",
                      style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 200, 212, 190)),
                    ),
                    SizedBox(width: 60,),
                    Text(
            "\$$price",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
                  ],
                ),
              ],
            ),
          ),

         
        ],
      ),
    );
  }
}
