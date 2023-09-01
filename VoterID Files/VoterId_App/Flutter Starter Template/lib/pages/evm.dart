import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(EvmPage());
}

class EvmPage extends StatelessWidget {
  final List<VideoCard> videoCards = [
    VideoCard(
      title: 'Know your EVM',
      imageUrl: 'assets/images/evm.jpg',
      videoId: 'FzDlrOE0Pvk',
    ),
    VideoCard(
      title: 'How to cast your vote using EVM and VVPAT',
      imageUrl: 'assets/images/evm_vvpat.jpg',
      videoId: 'OM_SHBkQv5o',
    ),
    VideoCard(
      title: 'EVM Connections And Mock Poll',
      imageUrl: 'assets/images/mockpoll.jpg',
      videoId: '9CG5Z-DRO-Y',
    ),
    VideoCard(
      title: 'Setting up EVM in Polling Station',
      imageUrl: 'assets/images/evmplay.jpg',
      videoId: '1NKfRws',
    ),
    // Add more video cards as needed
  ];

  EvmPage({super.key});

  get context => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EVM Page',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Handles the back button press
              },
            ),
            title: Text('EVM Page'), // Add a title for the app bar
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFFF9933)
                      .withOpacity(0.7), // Saffron with opacity
                  const Color(0xFFFFFFFF)
                      .withOpacity(0.7), // White with opacity
                  const Color(0xFF128807)
                      .withOpacity(0.7), // Green with opacity
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.3, 0.4, 0.9],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListView.builder(
                itemCount: videoCards.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _launchUrl(videoCards[index].videoId);
                    },
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 150,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Image.asset(
                                videoCards[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videoCards[index].title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        _playYouTubeVideo(
                                          context,
                                          videoCards[index].videoId,
                                        );
                                      },
                                      child: const Text('Watch Video'),
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
                },
              ),
            ),
          ),
        ));
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('HTTP Request Failed'),
            content: const Text('Failed to load the webpage.'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _playYouTubeVideo(BuildContext context, String videoId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}

class VideoCard {
  final String title;
  final String imageUrl;
  final String videoId;

  VideoCard({
    required this.title,
    required this.imageUrl,
    required this.videoId,
  });
}
