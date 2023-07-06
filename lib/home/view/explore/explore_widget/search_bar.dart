import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  dynamic onTapSearchBar;
  CustomSearchBar({super.key, required this.onTapSearchBar});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      centerTitle: false,
      elevation: 0,
      leadingWidth: 0,
      title: Container(
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: GestureDetector(
          onTap: onTapSearchBar,
          child: TextField(
            cursorColor: Colors.grey.shade500,
            decoration: InputDecoration(
                hintText: "Search",
                enabled: false,
                hintStyle:
                    TextStyle(fontSize: 16.5, fontWeight: FontWeight.w500),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.grey.shade500,
                )),
            style: TextStyle(color: Colors.black, fontSize: 16.5),
          ),
        ),
      ),
    );
  }
}
