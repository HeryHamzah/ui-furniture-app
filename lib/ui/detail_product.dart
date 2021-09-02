import 'package:flutter/material.dart';
import 'package:furniture_app/const.dart';
import 'package:furniture_app/model/furniture.dart';
import 'package:furniture_app/ui/successful_buy_page.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailProduct extends StatefulWidget {
  final Furnitures chair;

  DetailProduct(this.chair);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int item = 1;
  bool isFavorit = false;

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(isFavorit ? Icons.favorite : Icons.favorite_border,
                    color: primaryColor),
                onPressed: () {
                  isFavorit = !isFavorit;
                  setState(() {});
                },
              ),
              backgroundColor: bgColor,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Hero(
            tag: widget.chair.name,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1 / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/${widget.chair.image}"),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 35, right: 35, top: 35, bottom: 0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1.1 / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.chair.name,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "by ${widget.chair.brand}",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 14),
                            )
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.chair.rating.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp', decimalDigits: 0)
                              .format(widget.chair.price * item),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (item > 1) item--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                              Text(
                                item.toString(),
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      item++;
                                    });
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.chair.desc,
                      style: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Produk serupa",
                      style: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: widget.chair.similarProduct.map((e) {
                          return Container(
                            width: 80,
                            margin: EdgeInsets.only(right: 25),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(e), fit: BoxFit.cover)),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            var contain = cartList.where(
                                (element) => element.name == widget.chair.name);
                            if (contain.isEmpty) {
                              _showToast("Item ditambahkan ke keranjang Anda");
                              setState(() {
                                cartList.add(widget.chair);
                              });
                            } else {
                              _showToast(
                                  "Item telah tersedia di keranjang Anda");
                            }
                          },
                          clipBehavior: Clip.antiAlias,
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SuccesfullPage()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: secondColor,
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
