import 'package:flutter/material.dart';
import 'package:furniture_app/const.dart';
import 'package:furniture_app/model/furniture.dart';
import 'package:furniture_app/ui/cart.dart';
import 'package:furniture_app/ui/categories.dart';
import 'package:furniture_app/ui/login.dart';
import 'package:furniture_app/ui/product_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool filterSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20),
          child: _currentIndex == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Furniture Life",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              IconButton(
                                icon: Icon(Icons.logout),
                                color: primaryColor,
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (route) => false);
                                },
                              )
                            ],
                          ),
                          Text(
                            "Pilihan terbaik untuk rumahmu!",
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: primaryColor,
                                  ),
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              filterSelected = !filterSelected;
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: filterSelected
                                      ? primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.filter_list,
                                color: filterSelected
                                    ? Colors.white
                                    : primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Categories()),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemCount: chairList.length,
                            itemBuilder: (context, i) {
                              final Furnitures chair = chairList[i];
                              return ProductCard(chair);
                            }),
                      ),
                    )
                  ],
                )
              : CartList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}
