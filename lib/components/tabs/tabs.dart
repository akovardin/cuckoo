import 'package:cuckoo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabsSidebarItem {
  TabsSidebarItem({this.icon, this.title});

  IconData? icon;
  String? title;
}

class TabsSidebar extends StatefulWidget {
  TabsSidebar({
    required this.controller,
    required this.items,
    this.centerItemText,
    this.height: 26.0,
    this.iconSize: 12.0,
    this.backgroundColor,
    this.color,
    this.selectedColor: Colors.tealAccent,
    this.notchedShape,
    this.onTabSelected,
  }) {}

  final TabController controller;
  final List<TabsSidebarItem> items;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;

  @override
  State<StatefulWidget> createState() => TabsSidebarState();
}

class TabsSidebarState extends State<TabsSidebar> {
  int current = 0;

  updateIndex(int index) {
    setState(() {
      current = index;
    });

    widget.controller.animateTo(index);
    if (widget.onTabSelected != null) {
      widget.onTabSelected!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: updateIndex,
      );
    });

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items,
      ),
    );
  }

  Widget buildTabItem({
    required TabsSidebarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    final active = current == index;
    final decoration = active
        ? BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(6),
          )
        : null;

    return Container(
      height: widget.height,
      decoration: decoration,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        onTap: () => onPressed(index),
        child: Row(
          children: [
            if (item.icon != null) Icon(item.icon, color: PrimaryColor, size: 16),
            SizedBox(width: 4),
            Text(item.title ?? "", style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
