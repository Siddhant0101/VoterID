import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String?, String?>> _notifications = [
    {
      'title': 'Breaking News',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'title': 'Important Update',
      'content': 'Praesent euismod velit nec diam tincidunt consectetur.',
    },
    {
      'title': 'New Feature Released',
      'content':
          'Curabitur feugiat lorem nec erat interdum, at blandit mi efficitur.',
    },
    {
      'title': 'New Feature Released',
      'content':
          'Curabitur feugiat lorem nec erat interdum, at blandit mi efficitur.',
    },
    {
      'title': 'Important Update',
      'content': 'Praesent euismod velit nec diam tincidunt consectetur.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFF9933).withOpacity(0.9), // Saffron with opacity
            const Color(0xFFFFFFFF).withOpacity(0.8), // White with opacity
            const Color(0xFF128807).withOpacity(0.9), // Green with opacity
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.3, 0.6, 0.9],
        ),
      ),
      child: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                _notifications.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _notifications[index]['title'] ?? '',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              _notifications[index]['content'] ?? '',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _notifications[index]['title'] ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _notifications[index]['content'] ?? '',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
