import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mali_shop/Pages/Payment_service.dart';
import 'package:mali_shop/support_widget/widget_support.dart';
import 'package:provider/provider.dart';
import 'package:mali_shop/main.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool pay_with_card = true;
  bool pay_with_number = false;
  Color Color1 = Colors.red;
  Color Color2 = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/pay');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
        ),
        shape: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.3)),
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color1)),
                    onPressed: () {
                      setState(() {
                        pay_with_card = true;
                        pay_with_number = false;
                        Color1 = Colors.red;
                        Color2 = Colors.black;
                      });
                    },
                    child: Text(
                      "Pay with Card",
                      style: AppWidget.pay(),
                    )),
                SizedBox(
                  width: 7.0,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color2)),
                    onPressed: () {
                      setState(() {
                        pay_with_card = false;
                        pay_with_number = true;
                        Color2 = Colors.red;
                        Color1 = Colors.black;
                      });
                    },
                    child: Text(
                      "Pay with my number",
                      style: AppWidget.pay(),
                    ))
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            pay_with_card
                ? Container(
                    child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Image.asset('assets/master_card.png'),
                          height: 250,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black, width: 0.3)),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/pay');
                        },
                        child: Container(
                          child: Image.asset('assets/master_card.png'),
                          height: 250,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black, width: 0.3)),
                        ),
                      ),
                    ],
                  ))
                : Container(),
            pay_with_number
                ? Container(
                    child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/pay');
                          Provider.of<Oliver>(context, listen: false)
                              .SetText("MTN Momo");
                        },
                        child: Container(
                          child: Image.asset(
                            'assets/momo.png',
                          ),
                          height: 250,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.yellow[700],
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black, width: 0.3)),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/pay');
                          Provider.of<Oliver>(context, listen: false)
                              .SetText("Orange Money");
                        },
                        child: Container(
                          child: Image.asset('assets/orange.png'),
                          height: 250,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black, width: 0.3)),
                        ),
                      ),
                    ],
                  ))
                : Container()
          ],
        ),
      ),
    );
  }
}
