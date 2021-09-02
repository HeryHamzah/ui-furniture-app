import 'package:flutter/material.dart';
import 'package:furniture_app/const.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Semua",
    "Kursi",
    "Meja",
    "Lampu",
    "Lantai",
    "Dinding"
  ];
  int selectedCategory = 1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              selectedCategory = i;
              setState(() {});
            },
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: selectedCategory == i
                        ? primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  categories[i],
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color:
                          selectedCategory == i ? Colors.white : primaryColor),
                ))),
          );
        });
  }
}
