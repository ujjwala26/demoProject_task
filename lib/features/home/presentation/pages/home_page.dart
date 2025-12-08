import 'package:demoproject/core/shared_pref.dart';
import 'package:demoproject/features/home/presentation/pages/cart_page.dart';
import 'package:demoproject/features/singIn/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
const  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




    final List<String> items=[
      "item1","item2","item3","item4","item5","item6",
     // "item1","item2","item3","item4","item5","item6",
    ];

  @override 
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;


    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {

        String? token = await AppPrefs.getAccessToken();
          if(token == null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInPage()));
      }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home,
          color: Colors.green,),
              
              title: Text("Address",
          style: TextStyle(
            color: Colors.green,
            fontSize: height * 0.03
          ),),
            
          
        
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToCartPAge()));
      
            }, icon: Icon(Icons.shopping_cart,
            color: Colors.green,))
          ],
         
      
        ),
        body: 
        SingleChildScrollView(
          child: Column(
             children: [
                        Padding(
                          padding:  EdgeInsets.all(width * 0.05),
                          child: Container(
                            width: double.infinity,
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,
                              image: const DecorationImage(
                                image: AssetImage("assets/images/backgroundPicture.jpg"), 
                              ),
                            ),
                          ),
                        ),
          
             
              SizedBox(height: height * 0.01,),
             Text("What Are You Looking For ? ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  
                ),
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding:  EdgeInsets.all(width * 0.05),
                  child: GridView.builder(
                     physics: const NeverScrollableScrollPhysics(), // Important
                     shrinkWrap: true,
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: width * 0.05,
                      mainAxisSpacing: height * 0.02
                      ), 
                      itemBuilder: (context , index){
                        return Card(
                          elevation: 10,
                          child: Text(items[index],textAlign: TextAlign.center,),
                        );
                      }
                      ),
                ),
      
                Padding(
                  padding:  EdgeInsets.all(width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Stores Near Me",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold
                                     ), ),
                                  SizedBox(height: height * 0.02),
                                     Row(
                                       children: [
                                         Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:BorderRadius.circular(8) 
                  
                                          ),
                                          
                                           width: width * 0.3,   
                                           height: height * 0.2,  
                                           child: Text("Image")),
                                         Column(
                                           children: [
                                             Text("Store Name"),
                                             Text("Store Address"),
                                           ],
                                         ),
                                  
                                       ],
                                     )
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

