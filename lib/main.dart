import 'package:flutter/material.dart';
import 'package:ui_project_in_learning_approach/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigation(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> categories = [
    'Food',
    'Electronics',
    'Groceries',
    'Clothes',
    'Cosmetics',
    'SmartPhone',
    'Laptop'
  ];

  List products = [
    {
      'product_name': 'Apple Watch',
      'image': 'https://i.postimg.cc/mrqGS20h/images.jpg',
      'price': '\$ 88.45',
      'description': 'Series 6 Red'
    },
    {
      'product_name': 'Cosmetics',
      'image': 'https://i.postimg.cc/HsH1zNP0/images.jpg',
      'price': '\$ 38.45',
      'description': 'All the new collections',
    },
    {
      'product_name': 'Iphone-13',
      'image': 'https://i.postimg.cc/vB9CL7rS/3408-34138.jpg',
      'price': '\$ 1200',
      'description': 'Only white & Black colour available',
    },
    {
      'product_name': 'Macbook air 13"',
      'image': 'https://i.postimg.cc/kGqYQ0XB/macbook-air-2018.jpg',
      'price': '\$ 1000',
      'description': '3 colors available',
    },
    {
      'product_name': 'Gaming Mouse',
      'image': 'https://i.postimg.cc/nzt3xym0/razer-basilisk-v3-pro-500x500.png',
      'price': '\$ 80',
      'description': '2 years warranty',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Mehraj",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "Lets get something",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        width: 250,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.deepOrange,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '40% off during covid 19',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.food_bank,
                                  size: 70,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categories[index],
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7

                        ),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 60,
                                child: Image.network(
                                  products[index]['image'],
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,

                                ),
                              ),
                            ),
                            Text(
                              products[index]['product_name'],
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.deepOrange),
                            ),
                            Text(
                              products[index]['price'],
                              style:
                                  const TextStyle(fontSize: 15, color: Colors.green),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                products[index]['description'],
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black87),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
