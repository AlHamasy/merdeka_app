import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          color: Colors.green,
        ),
        // bottom: TabBar(
        //   tabAlignment: TabAlignment.start,
        //   isScrollable: true,
        //   indicatorSize: TabBarIndicatorSize.tab,
        //   tabs: [
        //     Tab(text: "Home"),
        //     Tab(text: "Notification"),
        //     Tab(text: "News"),
        //     Tab(text: "Other"),
        //     Tab(text: "Profile"),
        //   ],
        //   controller: tabController,
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add_a_photo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Home", icon: Icon(Icons.home),),
              Tab(text: "Notification", icon: Icon(Icons.notifications),),
              Tab(text: "News"),
              Tab(text: "Other"),
              Tab(text: "Profile"),
              Tab(text: "Notification"),
            ],
            controller: tabController,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                view(),
                view(),
                view(),
                view(),
                view(),
                view(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget view(){
    return Center(
      child: Text("View"),
    );
  }

}
