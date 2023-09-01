import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
      title: 'Breaking News',
      image: 'https://via.placeholder.com/150',
    ),
    NewsItem(
      title: 'Sports Update',
      image: 'https://via.placeholder.com/150',
    ),
    NewsItem(
      title: 'Technology Trends',
      image: 'https://via.placeholder.com/150',
    ),
    NewsItem(
      title: 'Business Insights',
      image: 'https://via.placeholder.com/150',
    ),
    NewsItem(
      title: 'Entertainment Buzz',
      image: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFF9933)
                    .withOpacity(0.7), // Saffron with opacity
                const Color(0xFFFFFFFF).withOpacity(0.7), // White with opacity
                const Color(0xFF128807).withOpacity(0.7), // Green with opacity
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.2, 0.5, 0.9],
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              NewsItem newsItem = newsList[index];
              return Dismissible(
                key: Key(newsItem.title),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    newsList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('News dismissed')),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('News'),
                            content: Text(newsItem.title),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 65,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(newsItem.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              newsItem.title,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NewsItem {
  final String title;
  final String image;

  NewsItem({
    required this.title,
    required this.image,
  });
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewsPage(),
  ));
}
