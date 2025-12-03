import 'package:demoproject/features/services/data/services/services_list.dart';
import 'package:demoproject/features/services/presentation/widgets/provider_card.dart';
import 'package:flutter/material.dart';

class ProviderList extends StatelessWidget {
  const ProviderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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

                    // for (var p in providerList)
                    //   providerCard(
                    //     image: p.image,
                    //     name: p.name,
                    //     address: p.address,
                    //     type: p.type,
                    //     rating: p.rating,
                    //     jobs: p.jobs,
                    //     price: p.price,
                    //     context: context,
                    //   ),
                        
                      
                    });
  }
}