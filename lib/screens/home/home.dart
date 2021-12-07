import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cuckoo/components/tabs/navigator.dart';
import 'package:cuckoo/components/tabs/tabs.dart';
import 'package:cuckoo/constants.dart';
import 'package:cuckoo/models/alarm.dart';
import 'package:cuckoo/screens/home/state.dart';
import 'package:cuckoo/screens/home/tabs/alarm/alarm.dart';
import 'package:cuckoo/screens/home/tabs/alarm/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          Sidebar(
            controller: controller,
          ),
          Frame(
            controller: controller,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Frame extends ConsumerWidget {
  Frame({
    Key? key,
    required this.controller,
  }) : super(key: key);

  TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey1 = GlobalKey<NavigatorState>();
    final navigatorKey2 = GlobalKey<NavigatorState>();
    final navigatorKey3 = GlobalKey<NavigatorState>();
    final navigatorKey4 = GlobalKey<NavigatorState>();

    return Expanded(
      child: Column(
        children: [
          Container(
            height: 55,
            decoration: const BoxDecoration(
              color: DarkColor,
              border: Border(
                left: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            child: WindowTitleBarBox(
              child: MoveWindow(
                child: Container(
                  decoration: const BoxDecoration(
                    color: DarkColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      ref.watch(homeStateProvider).isAlarmButton ?
                      GestureDetector(
                        child: Icon(Icons.add, color: Colors.grey),
                        onTap: () {
                          ref.read(alarmStateProvider.notifier).add(AlarmModel(3, 0, "example", false));
                        },
                      ) : Container(),
                      SizedBox(width: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: DarkColor,
              child: TabBarView(
                controller: controller,
                children: [
                  WillPopScope(
                    onWillPop: () async {
                      // !await currentFlow.navigatorKey.currentState.maybePop();

                      return false;
                    },
                    child: TabNavigator(
                      navigatorKey: navigatorKey1,
                      child: const AlarmScreen(),
                    ),
                  ),

                  WillPopScope(
                    onWillPop: () async {
                      // !await currentFlow.navigatorKey.currentState.maybePop();

                      return false;
                    },
                    child: TabNavigator(
                      navigatorKey: navigatorKey2,
                      child: Container(
                        child: Center(
                          child: Text("2", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),

                  WillPopScope(
                    onWillPop: () async {
                      // !await currentFlow.navigatorKey.currentState.maybePop();

                      return false;
                    },
                    child: TabNavigator(
                      navigatorKey: navigatorKey3,
                      child: Container(
                        child: Center(
                          child: Text("3", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),

                  WillPopScope(
                    onWillPop: () async {
                      // !await currentFlow.navigatorKey.currentState.maybePop();

                      return false;
                    },
                    child: TabNavigator(
                      navigatorKey: navigatorKey4,
                      child: Container(
                        child: Center(
                          child: Text("4", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Sidebar extends ConsumerWidget {
  Sidebar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Container(
            height: 55,
            child: WindowTitleBarBox(
              child: MoveWindow(
                child: Container(),
              ),
            ),
          ),
          Expanded(
            child: TabsSidebar(
              onTabSelected: (index) {
                if (index == 0) {
                  ref.read(homeStateProvider.notifier).showAlarmButton();
                } else {
                  ref.read(homeStateProvider.notifier).hideAlarmButton();
                }
              },
              controller: controller,
              items: [
                TabsSidebarItem(icon: CupertinoIcons.alarm_fill,  title: 'Alarm'),
                TabsSidebarItem(icon: CupertinoIcons.globe,  title: 'World Clock'),
                TabsSidebarItem(icon: CupertinoIcons.stopwatch_fill, title: 'Stopwatch'),
                TabsSidebarItem(icon: CupertinoIcons.timer, title: 'Timer'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
