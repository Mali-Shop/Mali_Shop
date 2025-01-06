import 'package:flutter/material.dart';
import 'package:mali_shop/Pages/Cart.dart';
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
    final textstate = Provider.of<Oliver>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                  'Payment',
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
            Row(
              children: [
                Text(
                  "Enter Your Number: ",
                  style: AppWidget.SmallBold(),
                ),
                
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Promo            ',
                  style: AppWidget.SmallBold(),
                ),
                Text(
                  'Promo code   ',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  width: 5.0,
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.0,
                    ),
                    onPressed: () {})
              ],
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
