import 'package:flutter/material.dart';
import 'package:furniture_app/model/furniture.dart';
import 'package:furniture_app/ui/product_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cartList.isEmpty ? Center(child: Text("Belum Ada Barang di Keranjang"),) : ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (context, i){
            final Furnitures cart = cartList[i];
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
                secondaryActions: [
                  IconSlideAction(
                    icon: Icons.remove_shopping_cart,
                    onTap: (){
                      cartList.remove(cart);
                      setState(() {
                      });
                    },
                  )
                ],
                child: ProductCard(cart));
          }),
    );
  }
}
