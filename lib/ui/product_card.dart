import 'package:flutter/material.dart';
import 'package:furniture_app/const.dart';
import 'package:furniture_app/model/furniture.dart';
import 'package:furniture_app/ui/detail_product.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final Furnitures chair;

  ProductCard(this.chair);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 3)
          ]),
      child: Row(
        children: [
          Hero(
            tag: chair.name,
            child: Container(
              height: 150,
              width: 120,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("images/${chair.image}"),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chair.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                Text("by ${chair.brand}",
                    style: TextStyle(fontSize: 14, color: primaryColor)),
                SizedBox(
                  height: 10,
                ),
                Text(chair.desc,
                    style: TextStyle(fontSize: 16, color: primaryColor),
                    maxLines: 3),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp', decimalDigits: 0)
                          .format(chair.price),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailProduct(chair)));
                      },
                      minWidth: 10,
                      shape: StadiumBorder(),
                      color: primaryColor,
                      child: Text(
                        "Buy",
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
