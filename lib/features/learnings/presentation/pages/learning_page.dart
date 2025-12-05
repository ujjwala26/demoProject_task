
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_bloc.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_event.dart';
import 'package:demoproject/features/learnings/presentation/widgets/learning_center_card.dart';
import 'package:demoproject/features/learnings/presentation/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {

    final height =MediaQuery.of(context).size.height;
 

    // List<Map<String, dynamic>> dummyList = [
    //   {
    //     "image": "assets/images/farm1.jpeg",
    //     "title": "27 May 2025 • 5:30 PM",
    //     "description":
    //         "Excellent harvest grapoes have a rich flavour and aroma.",
    //     "video":
    //         "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
    //   },
    //   {
    //     "image": "assets/images/farm2.jpeg",
    //     "title": "27 May 2025 • 5:30 PM",
    //     "description":
    //         "Excellent harvest grapoes have a rich flavour and aroma.",
    //     "video":
    //         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    //   },
    //   {
    //     "image": "assets/images/farm3.jpeg",
    //     "title": "27 May 2025 • 5:30 PM",
    //     "description":
    //         "Excellent harvest grapoes have a rich flavour and aroma.",
    //     "video": "https://samplelib.com/lib/preview/mp4/sample-10s.mp4",
    //   },
    //   {
    //     "image": "assets/images/farm4.jpeg",
    //     "title": "27 May 2025 • 5:30 PM",
    //     "description":
    //         "Excellent harvest grapoes have a rich flavour and aroma.",
    //     "video":
    //         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    //   },
    //   {
    //     "image": "assets/images/farm4.jpeg",
    //     "title": "27 May 2025 • 5:30 PM",
    //     "description":
    //         "Excellent harvest grapoes have a rich flavour and aroma.",
    //     "video":
    //         "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
    //   },
    //   {
    //     "image": "assets/images/farm4.jpeg",
    //     "title": "27 May 2025 • 5:30 PM",
    //     "description":
    //         "Excellent harvest grapoes have a rich flavour and aroma.",
    //     "video":
    //         "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
    //   },
    //   {
    //     "image": "assets/images/farm4.jpeg",
    //     "title": "27 May 2025 • 5:30 PM",
    //     "description":
    //         "Excellent harvest grapoes have a rich flavour and aroma.",
    //     "video":
    //         "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
    //   },
    // ];

    return BlocProvider(
      create: (context) => LearningPageBloc()..add(LoadItemsEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 230, 230),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 230, 230),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          title: Text("Todays Weather"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(child: Icon(Icons.notifications_active)),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              WeatherCard(),
              SizedBox(height: height * 0.03),
              LearningCenterCard(),

            ],
          ),
        ),
      ),
    );
  }
}
