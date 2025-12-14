import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayer(),
    );
  }
}


class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double currentValue =30;
  double totalDuration =210;

  String formatTime(double seconds){
    int min = seconds ~/ 60;
    int sec = ( seconds ~/ 60).toInt();
    return "$min:${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xFF0B40FF),
          size: 24,
        ),
        title: const Text(
          "Playlist",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.menu_outlined,
            color: Color(0xFF0B40FF),
            size: 24,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Album Image
            Container(
              height: 322,
              width: 322,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
                image: const DecorationImage(
                  image: AssetImage("assets/images/sanity_mq.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Song Title",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Saniya MQ · Album Zamana",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B40FF),
              ),
            ),

            const SizedBox(height: 10),

            // Slider
            SizedBox(
              width: 340,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 1,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 4,
                  ),
                ),
                child: Slider(
                  value: currentValue,
                  min: 0,
                  max: totalDuration,
                  activeColor: const Color(0xFF0B40FF),
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                ),
              ),
            ),


            // Time row
            SizedBox(
           width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(currentValue),
                      style: const TextStyle(fontSize: 10)),
                  Text(formatTime(totalDuration),
                      style: const TextStyle(fontSize: 10)),
                ],
              ),
            ),



            // Control buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous,
                      color: Color(0xFF0B40FF), size: 40),
                ),
                  SizedBox(width: 70,),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_rounded,
                      color: Color(0xFF0B40FF), size: 40),
                ),
                SizedBox(width: 70,),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next,
                      color: Color(0xFF0B40FF), size: 40),
                ),
              ],
            ),

            // Shuffle / Repeat
            SizedBox(
              width: 290,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  IconButton(
                    onPressed: () {},
                    icon:  Icon(Icons.shuffle,
                       size: 16),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon:  Icon(Icons.repeat,
                        size: 16),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
