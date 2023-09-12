import 'package:flutter/material.dart';
import 'package:personal_details_app/web_view_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _sizeAnimation = Tween<double>(
      begin: 0,
      end: 64,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));
    _translateAnimation = Tween<double>(
      begin: 350,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _translateAnimation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: _controller.value,
                  child: CircleAvatar(
                    radius: _sizeAnimation.value,
                    backgroundColor: Colors.grey,
                    backgroundImage: const NetworkImage(
                      'https://ca.slack-edge.com/T05FFAA91JP-U05RCV5GDAS-3260ad3f6061-512',
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Transform.translate(
                  offset: Offset(0, _translateAnimation.value),
                  child: const Text(
                    'SLACK NAME',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, _translateAnimation.value),
                  child: const FittedBox(
                    child: Text(
                      'Akingbade Abdulbasit',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Transform.translate(
                  offset: Offset(0, _translateAnimation.value),
                  child: const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Transform.translate(
                  offset: Offset(0, _translateAnimation.value),
                  child: InkWell(
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
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
