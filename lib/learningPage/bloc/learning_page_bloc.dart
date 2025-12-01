import 'package:bloc/bloc.dart';
import 'package:demoproject/learningPage/bloc/learning_page_event.dart';
import 'package:demoproject/learningPage/bloc/learning_page_state.dart';




class LearningPageBloc extends Bloc<LearningPageEvent, LearningPageState> {
  LearningPageBloc() : super(LearningLoaded([],false)) {
    on<LoadItemsEvent>((event, emit)  {
      List<Map<String, dynamic>> dummyList = [
      {
        "image": "assets/images/farm1.jpeg",
        "title": "27 May 2025 • 5:30 PM",
        "description":
            "Excellent harvest grapoes have a rich flavour and aroma.",
        "video":
            "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
      },
      {
        "image": "assets/images/farm2.jpeg",
        "title": "27 May 2025 • 5:30 PM",
        "description":
            "Excellent harvest grapoes have a rich flavour and aroma.",
        "video":
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      },
      {
        "image": "assets/images/farm3.jpeg",
        "title": "27 May 2025 • 5:30 PM",
        "description":
            "Excellent harvest grapoes have a rich flavour and aroma.",
        "video": "https://samplelib.com/lib/preview/mp4/sample-10s.mp4",
      },
      {
        "image": "assets/images/farm4.jpeg",
        "title": "27 May 2025 • 5:30 PM",
        "description":
            "Excellent harvest grapoes have a rich flavour and aroma.",
        "video":
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      },
      {
        "image": "assets/images/farm4.jpeg",
        "title": "27 May 2025 • 5:30 PM",
        "description":
            "Excellent harvest grapoes have a rich flavour and aroma.",
        "video":
            "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
      },
      {
        "image": "assets/images/farm4.jpeg",
        "title": "27 May 2025 • 5:30 PM",
        "description":
            "Excellent harvest grapoes have a rich flavour and aroma.",
        "video":
            "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
      },
      {
        "image": "assets/images/farm4.jpeg",
        "title": "27 May 2025 • 5:30 PM",
        "description":
            "Excellent harvest grapoes have a rich flavour and aroma.",
        "video":
            "https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
      },
    ];

    emit(LearningLoaded(dummyList, false));

      
    });

    
  }
}

