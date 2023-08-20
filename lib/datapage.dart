import 'package:day_34_with_flutter/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'model.dart';

class DataPage extends StatefulWidget {
  final ClothesData data;
  const DataPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  int counter = 0;
  double rate = 5.0;
  void IncrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  int selectedSize = 1;
  List<String> size = ["S", "M", "L", "XL"];

  int selectedColor = 1;
  List<Color> color = [
    Colors.grey,
    Colors.black,
    Color(0xff292526),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.data.cover.toString(),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(86, 158, 158, 158),
                                offset: Offset(0, 2),
                                spreadRadius: 1,
                                blurRadius: 5),
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: Color(0xff292526),
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.data.isliked = widget.data.isliked == false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(86, 158, 158, 158),
                                offset: Offset(0, 2),
                                spreadRadius: 1,
                                blurRadius: 5),
                          ],
                        ),
                        child: Icon(
                          widget.data.isliked == false
                              ? FontAwesomeIcons.heart
                              : FontAwesomeIcons.solidHeart,
                          color: Color(0xff292526),
                          size: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      widget.data.name.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      _buildCounterButton(Icons.remove_outlined,
                          decrementCounter, counter == 0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(counter.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      _buildCounterButton(
                          Icons.add_outlined, IncrementCounter, counter == 9),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    itemSize: 23,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color.fromARGB(178, 255, 193, 7),
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    rate.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    " (" + widget.data.reviews.toString() + " reviews)",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Text(
                        "Its simple and elegant shape makes it perfect for\nthose of you who like you who want minimalist\nclothes ",
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: .2,
                          height: 1.5,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 50,
                        child: Text(
                          "Read More. . .",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .2,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                height: 3,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Size",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: size.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedSize = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: selectedSize == index
                                      ? Colors.black
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color.fromARGB(91, 158, 158, 158),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                    right: 10, left: index == 0 ? 5 : 0),
                                child: Text(
                                  size[index],
                                  style: TextStyle(
                                      color: selectedSize == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Size",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: color.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: color[index],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color.fromARGB(91, 158, 158, 158),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                    right: 10, left: index == 0 ? 5 : 0),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Payment(),
            ),
          );
        },
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
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Add to Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: VerticalDivider(
                  thickness: 2,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.data.value.toString(),
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

InkWell _buildCounterButton(IconData icon, VoidCallback onTab,
    [bool active = true]) {
  return InkWell(
    onTap: active ? null : onTab,
    child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.fromARGB(83, 158, 158, 158),
        ),
      ),
      child: Icon(
        icon,
        color: active ? Colors.grey : Colors.black,
      ),
    ),
  );
}
