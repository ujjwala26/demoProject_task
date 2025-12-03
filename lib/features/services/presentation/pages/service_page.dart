
import 'package:demoproject/features/services/presentation/widgets/provider_list.dart';
import 'package:demoproject/features/services/presentation/widgets/service_item_card.dart';
import 'package:demoproject/features/services/presentation/widgets/services_card.dart';


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
              ServicesCard(),
            SizedBox(height: 20),
                SearchBar(),
              const SizedBox(height: 20),
              ServiceItemCard(),

           
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
                    ProviderList(),

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