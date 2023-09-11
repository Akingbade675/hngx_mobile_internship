import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GithubWebPage extends StatefulWidget {
  const GithubWebPage({super.key});

  @override
  State<GithubWebPage> createState() => _GithubWebPageState();
}

class _GithubWebPageState extends State<GithubWebPage> {
  int progress = 0;
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            setState(() {
              this.progress = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://github.com/akingbade675'));
  }

  // show a circular progress indicator while the page is loading.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('GitHub Profile'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: progress != 100
                ? LinearProgressIndicator(
                    value: 0.01 * progress,
                    backgroundColor: Colors.white,
                    color: Colors.deepPurple,
                  )
                : Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
          )),
      body: WebViewWidget(controller: _controller),
    );
  }

  @override
  void dispose() {
    _controller.clearLocalStorage();
    super.dispose();
  }
}
