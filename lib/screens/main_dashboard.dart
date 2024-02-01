import 'package:flutter/material.dart';
import 'package:intern_assignment/models/offer_model.dart';
import 'package:intern_assignment/screens/task_details.dart';
import 'package:intern_assignment/screens/task_provider.dart';

import 'package:intern_assignment/variables/dummy_tasks.dart';
import 'package:provider/provider.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final List<String> filters = const [
    'All Tasks',
    'Gifts',
    'Upcoming',
    'MyOffers'
  ];

  List<OfferModel> om = [];

  getOffers() {
    for (var data in TASKS) {
      OfferModel temp = OfferModel.fromJson(data);
      om.add(temp);
    }
  }

  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];

    getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          highlightColor: Colors.amber,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hey Shubham',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        actions: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Consumer<YourDataProvider>(
                      builder: (context, dataProvider, _) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.monetization_on,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              color: const Color.fromARGB(255, 76, 160, 228),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 4),
                      child: Consumer<YourDataProvider>(
                        builder: (context, dataProvider, _) {
                          return Text(
                            '₹ ${dataProvider.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: 600,
        height: 900,
        color: Colors.black,
        //   borderRadius: BorderRadius.circular(16),
        //   border: Border.all(
        //     color: Colors.blue,
        //     width: 2.0,
        //     style: BorderStyle.solid,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Colors.amber
                            : Colors.grey[200],
                        label: Text(filter),
                        labelStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 225, 237, 244)),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: ImageIcon(
                            AssetImage("assets/images/trending.png"),
                            //  color: Colors.red,
                            size: 20,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Text(
                          'Trending Tasks',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: om.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return TaskDetails(
                            om: om[i],
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 170.0, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    om[i].thumbnail!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  left: 0.04,
                                  bottom: 0.04,
                                  right: 0.04,
                                  child: Container(
                                    // // width: 0, // Set your desired width
                                    // height: 100, // Set your desired height
                                    color: Colors.black.withOpacity(0.7),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            om[i].brand!.title!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            om[i].ctaShort!,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Row(
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    "assets/images/lighting_icon.png"),
                                                //  color: Colors.red,
                                                size: 20,
                                                color: Colors.orangeAccent,
                                              ),
                                              Text(
                                                om[i].totalLead!,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'users',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage("assets/images/tasks.png"),
                    color: Colors.orangeAccent,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'More Tasks',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: 390,
              height: 300,
              child: ListView.builder(
                  itemCount: om.length,
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 350,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.amber, // Border color
                                width: 2.0, // Border width
                                style: BorderStyle
                                    .solid, // Border style (you can use BorderStyle.none for no border)
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  om[i].thumbnail!,
                                  width: 90,
                                  height: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 5.0),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildRichText(om[i].title!,
                                              maxWords: 4),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.blue,
                                                width: 2.0,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            width: 90,
                                            height: 40,
                                            child: TextButton(
                                              clipBehavior: Clip.antiAlias,
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (ctx) {
                                                      return TaskDetails(
                                                        om: om[i],
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                om[i].ctaLong!,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 200.0, top: 70),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '₹',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.amber,
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              om[i].payoutAmt!.toString(),
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildRichText(String text, {required int maxWords}) {
  List<String> words = text.split(' ');
  List<String> lines = [];

  for (int i = 0; i < words.length; i += maxWords) {
    int end = (i + maxWords < words.length) ? i + maxWords : words.length;
    lines.add(words.sublist(i, end).join(' '));
  }

  return RichText(
    text: TextSpan(
      children: lines.map((line) {
        return TextSpan(
          text: '$line\n',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        );
      }).toList(),
    ),
  );
}
