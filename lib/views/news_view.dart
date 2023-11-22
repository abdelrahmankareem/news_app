import 'package:flutter/material.dart';

import 'package:news/widgets/custom_listview_builder.dart';
import 'package:news/widgets/custom_tab.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomeView";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              " World News",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            bottom: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.redAccent,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Colors.redAccent, Colors.orangeAccent]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                isScrollable: true,
                tabs: const [
                  CustomTab(
                    title: "General",
                    icon: Icons.newspaper,
                  ),
                  CustomTab(
                    title: "Sport",
                    icon: Icons.scoreboard,
                  ),
                  CustomTab(
                    title: "Buisness",
                    icon: Icons.business_sharp,
                  ),
                  CustomTab(
                    title: "Entertainment",
                    icon: Icons.beach_access,
                  ),
                  CustomTab(
                    title: "Science",
                    icon: Icons.science,
                  ),
                  CustomTab(
                    title: "Technology",
                    icon: Icons.mobile_friendly,
                  ),
                ]),
          ),
          body: const TabBarView(children: [
            CustomListView(
              category: "general",
            ),
            CustomListView(
              category: "sport",
            ),
            CustomListView(
              category: "business",
            ),
            CustomListView(
              category: "entertainment",
            ),
            CustomListView(
              category: "science",
            ),
            CustomListView(
              category: "technology",
            ),
          ])),
    );
  }
}
