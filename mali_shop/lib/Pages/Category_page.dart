import 'package:flutter/material.dart';
import 'package:mali_shop/Pages/My_Cart.dart';
import 'package:mali_shop/Pages/Product_detail.dart';
import 'package:mali_shop/support_widget/widget_support.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class Category_Page extends StatefulWidget {
  const Category_Page({super.key});

  @override
  State<Category_Page> createState() => _Category_PageState();
}

class _Category_PageState extends State<Category_Page> {
  final List<Map<String, dynamic>> items = [
    {
      'Name': "PocBuds Bluetooth Headphones Wireless Earbuds 80hrs",
      'Price': 25.99,
      'image': "assets/head1.png",
      'rating': 4.8,
    },
    {
      'Name': "Wireless Earbuds 75hrs Bluetooth 5.3 Headphone Sport",
      'Price': 35.99,
      'image': "assets/head2.png",
      'rating': 4.9,
    },
    {
      'Name':
          "2 Packs USB C Headphones for iPhone 16/15 Earbuds with Microphone",
      'Price': 12.98,
      'image': "assets/head6.png",
      'rating': 3.0,
    },
    {
      'Name':
          "Wireless Earbuds Bluetooth Headphones 48hrs Play Back Sport Earphones",
      'Price': 37.99,
      'image': "assets/head4.png",
      'rating': 4.5,
    },
    {
      'Name':
          "LUDOS Ultra Wired Earbuds in-Ear Headphones, 5 Years Warranty, Earphones with Mic",
      'Price': 18.97,
      'image': "assets/head5.png",
      'rating': 3.9,
    },
    {
      'Name': "PocBuds Bluetooth Headphones Wireless Earbuds 80hrs",
      'Price': 25.99,
      'image': "assets/head1.png",
      'rating': 4.8,
    },
    {
      'Name': "Wireless Earbuds 75hrs Bluetooth 5.3 Headphone Sport",
      'Price': 35.99,
      'image': "assets/head2.png",
      'rating': 4.9,
    },
    {
      'Name':
          "2 Packs USB C Headphones for iPhone 16/15 Earbuds with Microphone",
      'Price': 12.98,
      'image': "assets/head6.png",
      'rating': 3.0,
    },
    {
      'Name':
          "Wireless Earbuds Bluetooth Headphones 48hrs Play Back Sport Earphones",
      'Price': 37.99,
      'image': "assets/head4.png",
      'rating': 4.5,
    },
    {
      'Name':
          "LUDOS Ultra Wired Earbuds in-Ear Headphones, 5 Years Warranty, Earphones with Mic",
      'Price': 18.97,
      'image': "assets/head5.png",
      'rating': 3.9,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mali Shopping"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => My_Cart()));
            },
            icon: Icon(Icons.shopping_bag_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "HeadPhones",
                          style: AppWidget.BigBold(),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "Products",
                  style: AppWidget.SmallBold(),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: (items.length / 4).ceil(),
                  itemBuilder: (context, rowIndex) {
                    final startIndex = rowIndex * 4;
                    final endIndex = (rowIndex * 4 + 4) > items.length
                        ? items.length
                        : rowIndex * 4 + 4;
                    final rowItems = items.sublist(startIndex, endIndex);

                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: rowItems
                              .map((item) => SizedBox(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Product_detail(product: item),
                                            ));
                                      },
                                      child: _ProductItem(
                                          name: item['Name'],
                                          price: item['Price'],
                                          image: item['image'],
                                          rating: item['rating'],
                                          
                                          ),
                                        
                                    ),
                                  ))
                              .toList()),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
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
  
  final String name;
  final double price;
  final String image;
  final double rating;
  const _ProductItem(
      {Key? key,
      
      required this.name,
      required this.price,
      required this.image,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
        width: 180.0,
        height: 220.0,
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                height: 150.0,
                width: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.7),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 100),
                      child: Text(
                        name,
                        style: AppWidget.SmallBold(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text("\$ ${price}", style: AppWidget.SmallBold())
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildRatingStars(rating),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          rating.toString(),
                          style: AppWidget.pay(),
                        )
                      ],
                    ),
                    
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
