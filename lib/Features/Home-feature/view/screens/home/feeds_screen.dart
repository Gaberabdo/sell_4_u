import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          Widget page;
          switch (settings.name) {
            case '/HomeFeeds':
              page = HomeFeeds();
              break;
            case '/HomeFeedsDetails':
              page = HomeFeedsDetails();
              break;
            default:
              page = HomeFeeds();
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}

class HomeFeeds extends StatelessWidget {
  const HomeFeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('HomeFeeds'),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/HomeFeedsDetails');
          },
          child: Text('Go to Subpage 1'),
        ),
      ],
    );
  }
}

class HomeFeedsDetails extends StatelessWidget {
  const HomeFeedsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('HomeFeedsDetails'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/HomeFeeds');
            },
            child: Text('Go to  1'),
          ),
        ],
      ),
    );
  }
}
