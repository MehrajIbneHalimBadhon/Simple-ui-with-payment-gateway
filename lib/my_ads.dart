import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  final List<Tab> _tabs = <Tab>[];

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
  ];

  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            currency: SSLCurrencyType.BDT,
            product_category: 'Food',
            sdkType: SSLCSdkType.TESTBOX,
            store_id: 'creni65e9a590e3764',
            store_passwd: 'creni65e9a590e3764@ssl',
            total_amount: 500.0,
            tran_id: '112233'));
    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      if (result.status!.toLowerCase() == 'failed') {
        Fluttertoast.showToast(
            msg: 'Transaction is failed.....',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      } else if (result.status!.toLowerCase() == 'closed') {
        Fluttertoast.showToast(
            msg: 'Transaction is closed by user.....',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      } else {
        Fluttertoast.showToast(
            msg:
                'Transaction is ${result.status} and amount is ${result.status}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
                labelColor: Colors.deepOrange,
                indicatorColor: Colors.grey,
                tabs: [
                  Tab(
                    icon: Icon(Icons.shopping_bag),
                    text: 'My Ads',
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                    text: 'My Favourite',
                  ),
                ]),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.9,
                                      crossAxisSpacing: 7,
                                      mainAxisSpacing: 7),
                              itemCount: 2,
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
                                            fontSize: 18,
                                            color: Colors.deepOrange),
                                      ),
                                      Text(
                                        products[index]['price'],
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.green),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          products[index]['description'],
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          products[index]['image']),
                                    ),
                                    title: Text(
                                      products[index]['product_name'],
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      products[index]['description'],
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    trailing: Text(
                                      products[index]['price'],
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.blue),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () => sslCommerzGeneralCall(),
                              child: const Text('Pay now')),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
