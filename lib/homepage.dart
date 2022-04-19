import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'apiservice/apiservice.dart';
import 'cartpage.dart';
import 'model/quotesmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<RestaurantModel>? futureQuotes;

  @override
  void initState() {
    super.initState();
    futureQuotes = fetchQuotes();
  }

  int items = 0;
  void additems() {
    setState(() {
      items++;
    });
  }

  void minusitems() {
    setState(() {
      items--;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showtextfield = false;
    //TabController _tabcontroller = TabController(length: 5, vsync: this)
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder<RestaurantModel>(
              future: futureQuotes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(children: [
                      Stack(children: [
                        Column(
                          children: [
                            Container(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: TextButton(
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Carts()));
                                    },
                                  ),
                                ),
                              ),
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "https://ebshosting.co.in" +
                                          '${snapshot.data!.shop!.banner}',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),

                            // Container(
                            //   width: double.infinity,
                            //   height: 200,
                            //   decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         "https://ebshosting.co.in" +
                            //             '${snapshot.data!.shop!.banner}'),
                            //     fit: BoxFit.cover),
                            //   ),
                            // ),
                            Container(
                              child: ListTile(
                                tileColor: Colors.lightGreen[400],
                                title: Text("${snapshot.data!.shop!.name}",
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Row(
                                  children: [
                                    for (var i = 0; i < 5; i++)
                                      if (snapshot.data!.shop?.rating == 0)
                                        Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                        ),
                                    if (snapshot.data!.shop?.rating! == 1)
                                      for (int i = 0; i < 5; i++)
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        )
                                  ],
                                ),
                                trailing: Text(
                                    '${snapshot.data!.shop!.deliveryTime}',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        )
                      ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  DefaultTabController(
                                    length: 5,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 405,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: TabBar(
                                            isScrollable: true,
                                            indicator: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                            ),
                                            tabs: [
                                              Text(
                                                "${snapshot.data!.category!.s4}",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                  "${snapshot.data!.category!.s11}",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  "${snapshot.data!.category!.s12}",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  "${snapshot.data!.category!.s18}",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  "${snapshot.data!.category!.s19}",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          constraints: BoxConstraints(
                                            maxHeight: 227,
                                            minHeight: 180,
                                          ),
                                          child: TabBarView(
                                            children: <Widget>[
                                              ListView.builder(
                                                  itemCount: snapshot
                                                      .data!.products!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      leading:

                                                          //Image(image: image),
                                                          Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                "https://ebshosting.co.in" +
                                                                    '${snapshot.data!.shop!.logo}',
                                                              ),
                                                              // image: snapshot
                                                              //             .data!
                                                              //             .products![
                                                              //                 index]
                                                              //             .image ==
                                                              //         ""
                                                              //     ? NetworkImage(
                                                              //         '${snapshot.data!.shop!.logo}')
                                                              //     : NetworkImage(
                                                              //         '${snapshot.data!.shop!.logo}'),
                                                              fit: BoxFit.cover),
                                                        ),
                                                      ),
                                                      title: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${snapshot.data!.products![index].name}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                              '${snapshot.data!.products![index].hasUnits}')
                                                        ],
                                                      ),
                                                      subtitle: Row(
                                                        children: [
                                                          Text(
                                                            '${snapshot.data!.products![index].offerprice}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .lightGreen[
                                                                    400]),
                                                          ),
                                                          Text(
                                                            '${snapshot.data!.products![index].price}',
                                                            style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color: Colors
                                                                    .grey[300]),
                                                          )
                                                        ],
                                                      ),
                                                      trailing: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              showtextfield =
                                                                  true;
                                                            });
                                                          },
                                                          child:
                                                              showtextfield ==
                                                                      true
                                                                  ? Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                      width: 70,
                                                                      height:
                                                                          30,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(right: 0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 28,
                                                                              child: IconButton(
                                                                                  onPressed: () {
                                                                                    if (items <= 0) {
                                                                                      items = 0;
                                                                                    } else {
                                                                                      minusitems();
                                                                                    }
                                                                                  },
                                                                                  icon: FaIcon(
                                                                                    FontAwesomeIcons.circleMinus,
                                                                                    size: 15,
                                                                                    color: Colors.black,
                                                                                  )),
                                                                            ),
                                                                            Text("$items"),
                                                                            SizedBox(
                                                                              width: 25,
                                                                              child: IconButton(
                                                                                  onPressed: () {
                                                                                    additems();
                                                                                  },
                                                                                  // icon: Icon(Icons.add)
                                                                                  icon: FaIcon(
                                                                                    FontAwesomeIcons.circlePlus,
                                                                                    size: 15,
                                                                                    color: Colors.black,
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      height:
                                                                          30,
                                                                      width: 90,
                                                                      color: Colors
                                                                          .blue,
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                            "add to cart"),
                                                                      ),
                                                                    )),

                                                      // trailing: Container(
                                                      //   decoration:
                                                      //       BoxDecoration(
                                                      //     border: Border.all(
                                                      //         width: 1,
                                                      //         color:
                                                      //             Colors.grey),
                                                      //   ),
                                                      //   width: 70,
                                                      //   height: 30,
                                                      //   child: Padding(
                                                      //     padding:
                                                      //         const EdgeInsets
                                                      //                 .only(
                                                      //             right: 0),
                                                      //     child: Row(
                                                      //       mainAxisAlignment:
                                                      //           MainAxisAlignment
                                                      //               .spaceEvenly,
                                                      //       children: [
                                                      //         SizedBox(
                                                      //           width: 28,
                                                      //           child:
                                                      //               IconButton(
                                                      //                   onPressed:
                                                      //                       () {
                                                      //                     if (items <=
                                                      //                         0) {
                                                      //                       items =
                                                      //                           0;
                                                      //                     } else {
                                                      //                       minusitems();
                                                      //                     }
                                                      //                   },
                                                      //                   icon:
                                                      //                       FaIcon(
                                                      //                     FontAwesomeIcons
                                                      //                         .circleMinus,
                                                      //                     size:
                                                      //                         15,
                                                      //                     color:
                                                      //                         Colors.black,
                                                      //                   )),
                                                      //         ),
                                                      //         Text("$items"),
                                                      //         SizedBox(
                                                      //           width: 25,
                                                      //           child: IconButton(
                                                      //               onPressed: () {
                                                      //                 additems();
                                                      //               },
                                                      //               // icon: Icon(Icons.add)
                                                      //               icon: FaIcon(
                                                      //                 FontAwesomeIcons
                                                      //                     .circlePlus,
                                                      //                 size: 15,
                                                      //                 color: Colors
                                                      //                     .black,
                                                      //               )),
                                                      //         ),
                                                      //       ],
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    );
                                                  }),
                                              Text("fvfvvfd"),
                                              Text("cdd"),
                                              Text("vfd"),
                                              Text("fvfvvfd"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // ListTile(
                              //   leading: Container(
                              //     decoration: BoxDecoration(
                              //         image: DecorationImage(
                              //             image: AssetImage(
                              //                 'assets/images/chicken.jpg'))),
                              //     width: 50,
                              //     height: 50,
                              //   ),
                              //   title: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         "Fresh Chicken",
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       Text("1KG")
                              //     ],
                              //   ),
                              //   subtitle: Row(
                              //     children: [
                              //       Text(
                              //         "rs 150\t\t",
                              //         style: TextStyle(
                              //             color: Colors.lightGreen[400]),
                              //       ),
                              //       Text(
                              //         "Rs180",
                              //         style: TextStyle(
                              //             decoration:
                              //                 TextDecoration.lineThrough,
                              //             color: Colors.grey[300]),
                              //       )
                              //     ],
                              //   ),
                              //   trailing: ElevatedButton(
                              //       onPressed: () {
                              // showModalBottomSheet(
                              //   context: context,
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.vertical(
                              //       top: Radius.circular(20),
                              //     ),
                              //   ),
                              //   clipBehavior:
                              //       Clip.antiAliasWithSaveLayer,
                              //   builder: (BuildContext context) {
                              //     return Container(
                              //       color: Colors.white,
                              //       height: 200,
                              //       child: Center(
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.start,
                              //           // mainAxisSize: MainAxisSize.min,
                              //           children: [
                              //             SizedBox(
                              //               height: 10,
                              //             ),
                              //             Text(
                              //               "Select Quantity",
                              //               style: TextStyle(
                              //                   fontWeight:
                              //                       FontWeight.bold),
                              //             ),
                              //             SizedBox(
                              //               height: 20,
                              //             ),
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   color: Colors.grey[300],
                              //                   borderRadius:
                              //                       BorderRadius
                              //                           .circular(5)),
                              //               width: 300,
                              //               height: 40,
                              //               child: Row(
                              //                 children: [
                              //                   Spacer(),
                              //                   Text(
                              //                     "Full | Rs300",
                              //                     style: TextStyle(
                              //                         fontWeight:
                              //                             FontWeight
                              //                                 .bold),
                              //                   ),
                              //                   SizedBox(
                              //                     width: 50,
                              //                   ),
                              //                   Container(
                              //                     decoration:
                              //                         BoxDecoration(
                              //                       color: Colors.white,
                              //                       border: Border.all(
                              //                           width: 1,
                              //                           color: Colors
                              //                               .grey),
                              //                       borderRadius:
                              //                           BorderRadius
                              //                               .circular(
                              //                                   20),
                              //                     ),
                              //                     width: 70,
                              //                     height: 30,
                              //                     child: Padding(
                              //                       padding:
                              //                           const EdgeInsets
                              //                                   .only(
                              //                               right: 0),
                              //                       child: Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .spaceEvenly,
                              //                         children: [
                              //                           SizedBox(
                              //                             width: 28,
                              //                             child:
                              //                                 IconButton(
                              //                               onPressed:
                              //                                   () {
                              //                                 if (items <=
                              //                                     0) {
                              //                                   items =
                              //                                       0;
                              //                                 } else {
                              //                                   minusitems();
                              //                                 }
                              //                                 // minusitems();
                              //                               },
                              //                               icon:
                              //                                   FaIcon(
                              //                                 FontAwesomeIcons
                              //                                     .circleMinus,
                              //                                 size: 15,
                              //                                 color: Colors
                              //                                     .black,
                              //                               ),
                              //                             ),
                              //                           ),
                              //                           Text("$items"),
                              //                           SizedBox(
                              //                             width: 25,
                              //                             child:
                              //                                 IconButton(
                              //                               onPressed:
                              //                                   () {
                              //                                 additems();
                              //                               },
                              //                               icon:
                              //                                   FaIcon(
                              //                                 FontAwesomeIcons
                              //                                     .circlePlus,
                              //                                 size: 15,
                              //                                 color: Colors
                              //                                     .black,
                              //                               ),
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 10,
                              //             ),
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   color: Colors.grey[300],
                              //                   borderRadius:
                              //                       BorderRadius
                              //                           .circular(5)),
                              //               width: 300,
                              //               height: 40,
                              //               child: Row(
                              //                 children: [
                              //                   Spacer(),
                              //                   Text(
                              //                     "Full | Rs300",
                              //                     style: TextStyle(
                              //                         fontWeight:
                              //                             FontWeight
                              //                                 .bold),
                              //                   ),
                              //                   SizedBox(
                              //                     width: 50,
                              //                   ),
                              //                   Container(
                              //                     decoration:
                              //                         BoxDecoration(
                              //                       color: Colors.white,
                              //                       border: Border.all(
                              //                           width: 1,
                              //                           color: Colors
                              //                               .grey),
                              //                       borderRadius:
                              //                           BorderRadius
                              //                               .circular(
                              //                                   20),
                              //                     ),
                              //                     width: 70,
                              //                     height: 30,
                              //                     child: Padding(
                              //                       padding:
                              //                           const EdgeInsets
                              //                                   .only(
                              //                               right: 0),
                              //                       child: Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .spaceEvenly,
                              //                         children: [
                              //                           SizedBox(
                              //                             width: 28,
                              //                             child:
                              //                                 IconButton(
                              //                               onPressed:
                              //                                   () {
                              //                                 if (items <=
                              //                                     0) {
                              //                                   items =
                              //                                       0;
                              //                                 } else {
                              //                                   minusitems();
                              //                                 }
                              //                               },
                              //                               icon:
                              //                                   FaIcon(
                              //                                 FontAwesomeIcons
                              //                                     .circleMinus,
                              //                                 size: 15,
                              //                                 color: Colors
                              //                                     .black,
                              //                               ),
                              //                             ),
                              //                           ),
                              //                           Text(
                              //                             "$items",
                              //                           ),
                              //                           SizedBox(
                              //                             width: 25,
                              //                             child:
                              //                                 IconButton(
                              //                               onPressed:
                              //                                   () {
                              //                                 additems();
                              //                               },
                              //                               icon:
                              //                                   FaIcon(
                              //                                 FontAwesomeIcons
                              //                                     .circlePlus,
                              //                                 size: 15,
                              //                                 color: Colors
                              //                                     .black,
                              //                               ),
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 10,
                              //             ),
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   color: Colors.grey[300],
                              //                   borderRadius:
                              //                       BorderRadius
                              //                           .circular(5)),
                              //               width: 300,
                              //               height: 40,
                              //               child: Row(
                              //                 children: [
                              //                   Spacer(),
                              //                   Text(
                              //                     "Full | Rs300",
                              //                     style: TextStyle(
                              //                         fontWeight:
                              //                             FontWeight
                              //                                 .bold),
                              //                   ),
                              //                   SizedBox(
                              //                     width: 50,
                              //                   ),
                              //                   Container(
                              //                     decoration:
                              //                         BoxDecoration(
                              //                       color: Colors.white,
                              //                       border: Border.all(
                              //                           width: 1,
                              //                           color: Colors
                              //                               .grey),
                              //                       borderRadius:
                              //                           BorderRadius
                              //                               .circular(
                              //                                   20),
                              //                     ),
                              //                     width: 70,
                              //                     height: 30,
                              //                     child: Padding(
                              //                       padding:
                              //                           const EdgeInsets
                              //                                   .only(
                              //                               right: 0),
                              //                       child: Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .spaceEvenly,
                              //                         children: [
                              //                           SizedBox(
                              //                             width: 28,
                              //                             child:
                              //                                 IconButton(
                              //                               onPressed:
                              //                                   () {
                              //                                 if (items <=
                              //                                     0) {
                              //                                   items =
                              //                                       0;
                              //                                 } else {
                              //                                   minusitems();
                              //                                 }
                              //                               },
                              //                               icon:
                              //                                   FaIcon(
                              //                                 FontAwesomeIcons
                              //                                     .circleMinus,
                              //                                 size: 15,
                              //                                 color: Colors
                              //                                     .black,
                              //                               ),
                              //                             ),
                              //                           ),
                              //                           Text("$items"),
                              //                           SizedBox(
                              //                             width: 25,
                              //                             child:
                              //                                 IconButton(
                              //                               onPressed:
                              //                                   () {
                              //                                 additems();
                              //                               },
                              //                               icon:
                              //                                   FaIcon(
                              //                                 FontAwesomeIcons
                              //                                     .circlePlus,
                              //                                 size: 15,
                              //                                 color: Colors
                              //                                     .black,
                              //                               ),
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // );
                              //   },
                              //       child: Text("Add to Cart"),
                              //       style: ElevatedButton.styleFrom(
                              //         elevation: 0,
                              //         primary: Colors.green[400],
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(12),
                              //         ),
                              //       )),
                              // ),
                              // ListTile(
                              //   leading:

                              //       //Image(image: image),
                              //       Container(
                              //     decoration: BoxDecoration(
                              //         image: DecorationImage(
                              //             image: AssetImage(
                              //                 'assets/images/chicken.jpg'))),
                              //     width: 50,
                              //     height: 50,
                              //   ),
                              //   title: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         "Fresh Chicken",
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       Text("1KG")
                              //     ],
                              //   ),
                              //   subtitle: Row(
                              //     children: [
                              //       Text(
                              //         "rs 150\t\t",
                              //         style: TextStyle(
                              //             color: Colors.lightGreen[400]),
                              //       ),
                              //       Text(
                              //         "Rs180",
                              //         style: TextStyle(
                              //             decoration:
                              //                 TextDecoration.lineThrough,
                              //             color: Colors.grey[300]),
                              //       )
                              //     ],
                              //   ),
                              //   trailing: Container(
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //           width: 1, color: Colors.grey),
                              //     ),
                              //     width: 70,
                              //     height: 30,
                              //     child: Padding(
                              //       padding: const EdgeInsets.only(right: 0),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceEvenly,
                              //         children: [
                              //           SizedBox(
                              //             width: 28,
                              //             child: IconButton(
                              //                 onPressed: () {
                              //                   if (items <= 0) {
                              //                     items = 0;
                              //                   } else {
                              //                     minusitems();
                              //                   }
                              //                 },
                              //                 icon: FaIcon(
                              //                   FontAwesomeIcons.circleMinus,
                              //                   size: 15,
                              //                   color: Colors.black,
                              //                 )),
                              //           ),
                              //           Text("$items"),
                              //           SizedBox(
                              //             width: 25,
                              //             child: IconButton(
                              //                 onPressed: () {
                              //                   additems();
                              //                 },
                              //                 // icon: Icon(Icons.add)
                              //                 icon: FaIcon(
                              //                   FontAwesomeIcons.circlePlus,
                              //                   size: 15,
                              //                   color: Colors.black,
                              //                 )),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  );

                  //end
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
