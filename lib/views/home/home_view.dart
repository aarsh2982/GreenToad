import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greentoad_app/views/home/calendar_insights.dart';
import 'package:greentoad_app/views/home/greentoad_menu.dart';
import 'package:greentoad_app/views/home/taskboards_insights.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: const GreenToadMenu(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              // navigating users to notifications view
              context.push("/notifications");
            },
            icon: const Badge(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            CalendarInsights(),
            SizedBox(height: 20.0),
            TaskBoards(),
          ],
        ),
      ),
    );
  }
}
