import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<int> count = [
    1,
    3,
    1,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromARGB(80, 158, 158, 158),
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Color(0xff292526),
                        size: 20,
                      ),
                    ),
                  ),
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromARGB(80, 158, 158, 158),
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.barsStaggered,
                        color: Color(0xff292526),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: payments.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  payments[index].cover.toString(),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    payments[index].name.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    payments[index].desc.toString(),
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 13,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    payments[index].value.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 85,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(FontAwesomeIcons.ellipsis),
                                  Container(
                                    width: 85,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xff292526),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: count[index] == 0
                                              ? () {}
                                              : () {
                                                  setState(() {
                                                    count[index]--;
                                                  });
                                                },
                                          child: Icon(
                                            FontAwesomeIcons.minus,
                                            color: count[index] == 0
                                                ? Colors.grey
                                                : Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        count[index] < 10
                                            ? Text(
                                                "0" + count[index].toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                count[index].toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              count[index]++;
                                            });
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.plus,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        index == payments.length - 1
                            ? Divider(
                                thickness: 0,
                                height: 0,
                                color: Colors.white,
                              )
                            : Divider(
                                thickness: 1,
                                color: Color.fromARGB(55, 158, 158, 158),
                                height: 35,
                              )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Shopping information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("img/visa.jpg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("**** **** **** 2143"),
                      ],
                    ),
                    Icon(
                      Icons.expand_more_outlined,
                      size: 28,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total (" +
                      (count[0] + count[1] + count[2]).toString() +
                      " items)"),
                  Text(
                    "\$" +
                        (count[0] * 212.99 +
                                count[1] * 50.99 +
                                count[2] * 116.99)
                            .toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shopping Fee"),
                  Text(
                    "\$0.00",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Color.fromARGB(55, 158, 158, 158),
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sub Total"),
                  Text(
                    "\$" +
                        (count[0] * 212.99 +
                                count[1] * 50.99 +
                                count[2] * 116.99)
                            .toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 95,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color(0xff292526),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pay",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
