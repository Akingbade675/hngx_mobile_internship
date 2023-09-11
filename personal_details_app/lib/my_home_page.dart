import 'package:flutter/material.dart';
import 'package:personal_details_app/web_view_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(
            color: Colors.grey,
            height: 2,
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white60,
            backgroundImage: NetworkImage(
              'https://ca.slack-edge.com/T05FFAA91JP-U05RCV5GDAS-3260ad3f6061-512',
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'SLACK NAME',
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const FittedBox(
            child: Text(
              'Akingbade Abdulbasit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Flutter Developer',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 28),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const GithubWebPage();
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.deepPurpleAccent,
                  ],
                  stops: [0.3, 0.9],
                ),
              ),
              child: const Text(
                'Open GitHub',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
