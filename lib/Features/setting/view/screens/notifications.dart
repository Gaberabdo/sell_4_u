import 'package:flutter/material.dart';
import 'package:sell_4_u/Features/setting/view/screens/inbox_list.dart';
import 'package:sell_4_u/Features/setting/view/screens/notification_list.dart';
class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_literals_to_create_immutables
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.grey),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
           //       labelColor: Colors.black,
                 // dividerColor: Colors.black,
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    Tab(
                     text: 'Notifications',
                    ),
                    Tab(
                      text: 'inBox',
                    ),

                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  NotificationList(),
                  InBoxList(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
