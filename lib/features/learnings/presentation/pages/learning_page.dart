
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_bloc.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_event.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_state.dart';
import 'package:demoproject/features/learnings/presentation/pages/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {

    final height =MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
              Container(
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
              ),
              SizedBox(height: height * 0.03),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),

                height: height * 0.6,
                width: width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Learning Center",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<LearningPageBloc, LearningPageState>(
                          builder: (context, state) {
                            if (state is LearningLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is LearningLoaded) {
                              return ListView.builder(
                                itemCount: state.items.length,

                                //itemCount: dummyList.length,
                                itemBuilder: (context, index) {
                                  final item = state.items[index];
                                  //final item = dummyList[index];
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VideoScreenState(
                                                videoUrl:item['video'],
                                                   // dummyList[index]['video'],
                                                   //item[index]['video'],
                                                obj:item
                                                //item[index]
                                                // dummyList[index],

                                              ),
                                        ),
                                      );
                                    },
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10),
                                      child: Image.asset(
                                        item['image'],
                                        height: height * 0.05,
                                        width: width * 0.2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      item['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(item['description']),
                                  );
                                },
                              );
                            } else if (state is LearningError) {
                              return Center(child: Text(state.msg));
                            } else {
                              return SizedBox(
                                child: Center(
                                  child: Text("Something went wrong ! "),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: height * 0.05,
                          width: width * 0.8,

                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255,31,98,33,),
                            ),
                            child: Text(
                              "Subscribe",
                              style: TextStyle(
                                fontSize: height * 0.03,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
