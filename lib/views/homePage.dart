import 'package:flutter/material.dart';
import 'brewingPage.dart';
import 'beansPage.dart';
import 'grindsPage.dart';

class TabItem {
  IconData icon;
  String title;
  TabItem(this.icon, this.title);
  @override
  String toString() {
    return title;
  }
}

List<TabItem> _tabItems = [
  TabItem(Icons.colorize, "Brewing"),
  TabItem(Icons.stars,"Beans"),
  TabItem(Icons.grid_on,"Grinds"),
  TabItem(Icons.settings,"Settings")
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentTab = 1;

  void _selectTab(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black12,
        currentIndex: _currentTab,
        onTap: _selectTab,
        items: [
          for(TabItem item in _tabItems)
          BottomNavigationBarItem(
            icon: Icon(item.icon),
            title: Text(item.title),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch(_currentTab) {
      case 0:
        return BrewingPage();
      case 1:
        return BeansPage();
      case 2:
        return GrindsPage();
      default:
        return Text("ERR");
    }
  }
}
