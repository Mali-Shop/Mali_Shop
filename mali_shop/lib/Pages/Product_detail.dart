import 'package:flutter/material.dart';
import 'package:mali_shop/main.dart';
import 'package:mali_shop/support_widget/widget_support.dart';
import 'package:provider/provider.dart';

class Product_detail extends StatelessWidget {
  final Map<String, dynamic> product;
  const Product_detail({super.key, required this.product});

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating.round()) {
        stars.add(const Icon(Icons.star, color: Colors.amber));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber));
      }
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Mali Shopping"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Text(
                                product['Name'],
                                style: AppWidget.SmallBold(),
                                overflow: TextOverflow.visible,
                                maxLines: 7,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            product['rating'].toString(),
                            style: AppWidget.Category(),
                          ),
                          _buildRatingStars(product['rating']),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black87,
                    width: 0.2,
                  )),
              child: Image.asset(
                product['image'],
                fit: BoxFit.contain,
                height: 450.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartModel.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                      content: Text(
                      "${product['Name']} added to cart")
                      )
                      );
                    },
                    child: Container(
                      width: 500.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Center(
                        child: Text(
                          "Add To Cart",
                          style: AppWidget.BigBold(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 500.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: AppWidget.BigBold(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
