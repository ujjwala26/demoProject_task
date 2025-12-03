import 'package:demoproject/features/services/presentation/widgets/services_item.dart';
import 'package:flutter/material.dart';

class ServiceItemCard extends StatelessWidget {
  const ServiceItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
              );
  }
}