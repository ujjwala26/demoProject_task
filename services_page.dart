

import 'package:demoproject/features/services/data/services/services_list.dart';
import 'package:demoproject/features/services/presentation/widgets/provider_card.dart';
import 'package:demoproject/features/services/presentation/widgets/services_item.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            
              Container(
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
              ),

              const SizedBox(height: 20),

             
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
                        color: Color.fromARGB(255, 238, 238, 238),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "Search Services",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
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
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  children: [
                    serviceItem("assets/images/tools.jpeg", "Repair", context),
                    serviceItem("assets/images/rentals.jpeg", "Rentals", context),
                    serviceItem("assets/images/tractor.jpeg", "Tractors", context),
                    serviceItem("assets/images/logistics.jpeg", "Logistic", context),
                    serviceItem("assets/images/harvesting.jpeg", "Harvesting", context),
                    serviceItem("assets/images/hitech.jpeg", "Hi-Tech", context),
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

                   
                   
                    ListView.builder(
                      itemCount:providerList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context , index){
                        final p = providerList[index];

                        return providerCard(
                          image: p.image, 
                          name: p.name, 
                          address: p.address, 
                          type: p.type, 
                          rating: p.rating, 
                          jobs: p.jobs,
                           price: p.price, 
                          context: context
                          );
                        
                      
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
