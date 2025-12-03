import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_bloc.dart';
import 'package:demoproject/features/learnings/presentation/bloc/learningPage/learning_page_state.dart';
import 'package:demoproject/features/learnings/presentation/pages/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningCenterCard extends StatelessWidget {
  const LearningCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
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
    );
  }
}