import 'package:audio_session/audio_session.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class playerScreen extends StatefulWidget {
  const playerScreen({super.key});

  @override
  State<playerScreen> createState() => _playerScreenState();
}

class _playerScreenState extends State<playerScreen> {
  final AudioPlayer _player = AudioPlayer();
  
  @override
  void initState() {
    super.initState();
    _fetchAudio();
   
  }
  Future<void> _fetchAudio() async {
    try{
      final session = await AudioSession.instance;

          await _player.setAudioSource(AudioSource.uri(Uri.parse("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")));
         
          await session.configure(const AudioSessionConfiguration.speech());
    
    _player.errorStream.listen((e) {

      print('A stream error occurred: $e');
    });

    }catch(e){
        print("Error loading audio: $e");

    }

}


  @override
  void dispose() {
    
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<Duration>(stream: _player.positionStream , builder: (context , snapshot){
              final position =snapshot.data ?? Duration.zero;
              final total = _player.duration ?? Duration.zero;

              return ProgressBar(progress: position, total: total,
              onSeek: (duration) {
                _player.seek(duration);
                
              },);

            }),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               buildPlayPauseButton(),
               buildStopButton(),


              ],
            )
            
          ],
        ),
      ),
    );
  }
  
Widget buildPlayPauseButton() {

  return StreamBuilder(
    stream: _player.playerStateStream, 
    builder: (context , snapshot){
    final PlayerState = snapshot.data;
    final playing = PlayerState?.playing ?? false;
    return IconButton(
      iconSize: 64,
      onPressed: (){
        if(playing){
          _player.pause();

        }else{
          _player.play();

        }

    }, icon: Icon(
      playing ? Icons.pause_circle : Icons.play_circle,
       ));

  });
}

 Widget  buildStopButton() {

  return IconButton(
    iconSize: 64,
    onPressed: (){
    _player.stop();

  }, icon: Icon(Icons.stop_circle));


 }
  
}