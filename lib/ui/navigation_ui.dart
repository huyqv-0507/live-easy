import 'package:flutter/material.dart';
import 'package:liveeasy_huynl/blocs/utilities_bloc/nav_bloc.dart';
import 'package:liveeasy_huynl/handlers/colors_handler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'screens/home_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/recent_screen.dart';

class NavigationUI extends StatefulWidget {
  @override
  _NavigationUIState createState() => _NavigationUIState();
}

class _NavigationUIState extends State<NavigationUI> {
  int selectedNav = 0;
  final List titleItems = <String>['Home', 'Recent', 'Notification', 'Profile'];
  final List navbars = <Widget>[
    HomeScreen(),
    RecentScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        stream: navBloc.navItemStream,
        builder: (context, snapshot) {
          return Scaffold(
              body: navbars.elementAt(snapshot.data),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: kThemePrimaryColor,
                  onPressed: null,
                  child: Center(child: Icon(Icons.post_add))),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              bottomNavigationBar: BottomAppBar(
                child: BottomNavigationBar(
                    onTap: navBloc.navItemSink.add,
                    currentIndex: snapshot.data,
                    elevation: 5.0,
                    selectedItemColor: kSelectedNavItemColor,
                    unselectedItemColor: kUnSelectedNavItemColor,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(MdiIcons.homeOutline),
                          label: '${titleItems.elementAt(snapshot.data)}'),
                      BottomNavigationBarItem(
                          icon: Icon(MdiIcons.history),
                          label: '${titleItems.elementAt(snapshot.data)}'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.notifications_outlined),
                          label: '${titleItems.elementAt(snapshot.data)}'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle_outlined),
                          label: '${titleItems.elementAt(snapshot.data)}'),
                    ]),
              ));
        });
  }
}
