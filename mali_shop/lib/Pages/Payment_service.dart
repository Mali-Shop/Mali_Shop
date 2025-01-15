import 'package:flutter/material.dart';
import 'package:mali_shop/Pages/My_Cart.dart';
import 'package:mali_shop/main.dart';
import 'package:mali_shop/support_widget/widget_support.dart';
import 'package:go_router/go_router.dart ';
import 'package:provider/provider.dart';

class Payment_Service extends StatefulWidget {
  
  const Payment_Service({super.key});

  @override
  State<Payment_Service> createState() => _Payment_ServiceState();
}

class _Payment_ServiceState extends State<Payment_Service> {
  @override
  Widget build(BuildContext context) {
    final _number = TextEditingController();
    final promo = TextEditingController();
    final textstate = Provider.of<Oliver>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 14.0,
          ),
          onPressed: () {
            context.go('/my_cart');
            // Navigate back to cart page
          },
        ),
        title: Text(
          'Payment Service',
          style: AppWidget.SmallBold(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Payment Method ',
                  style: AppWidget.SmallBold(),
                ),
                // Text
                Text(
                  textstate.text,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
                  onPressed: () {
                    context.go('/payment');
                    // Navigate to payment method selection page
                  },
                )
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Phone  ",
                  style: AppWidget.SmallBold(),
                ),
                Container(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: _number,
                    decoration: InputDecoration(
                      hoverColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "+237",
                      hintText: "Enter Number",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 7.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Promo   ',
                  style: AppWidget.SmallBold(),
                ),
                Container(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: promo,
                    decoration: InputDecoration(
                      hoverColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Promo Code",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ITEMS",
                      style: AppWidget.SmallBold(),
                    ),
                    Text(
                      "DESCRIPTION",
                      style: AppWidget.SmallBold(),
                    ),
                    Text(
                      "PRICE",
                      style: AppWidget.SmallBold(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("SubTotal"),
                    Text("Shipping total"),
                    Text("Taxes"),
                    Text("Total"),
                  ],
                ),
                Column(
                  children: [
                    Text("\$10.00"),
                    Text("\$5.00"),
                    Text("\$2.50"),
                    Text("\$17.50")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Text(
                "Pay",
                style: AppWidget.pay(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
