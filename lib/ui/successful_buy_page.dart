import 'package:flutter/material.dart';
import 'package:furniture_app/const.dart';
import 'main_page.dart';

class SuccesfullPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pembelian Furniture Selesai",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: primaryColor,
                      size: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Pembelian Anda sedang diproses. Terima kasih telah menggunakan aplikasi Furniture Life",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                      (route) => false);
                },
                child: Text(
                  "Kembali ke Menu Home",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
