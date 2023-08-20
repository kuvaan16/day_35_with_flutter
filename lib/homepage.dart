import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:day_34_with_flutter/datapage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

import 'model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> items = [
    "All Items",
    "Dress",
    "Hat",
    "Watche",
  ];
  final List<IconData> icons = [
    Icons.grid_view_outlined,
    FontAwesomeIcons.personDress,
    FontAwesomeIcons.hatCowboy,
    Icons.watch_outlined
  ];
  List<List<ClothesData>> data = [
    allData,
    clothesData,
    hatData,
    watcheData,
  ];
  int current = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Welcome 👋",
                          style: GoogleFonts.encodeSans(
                            color: Color(0xFF1b2028),
                            fontSize: 15,
                            letterSpacing: .3,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Albert Stevano",
                          style: GoogleFonts.encodeSans(
                              color: Color(0xFF1b2028),
                              fontSize: 17,
                              letterSpacing: .3,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "img/profile.jpg",
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(64, 158, 158, 158),
                        ),
                      ),
                      width: 170,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIconColor: Color(0xff878787),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintStyle: GoogleFonts.encodeSans(
                            fontSize: 13,
                            color: Color(0xff878787),
                            letterSpacing: .3,
                          ),
                          hintText: "Search clothes...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Color(0xff292526),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        FontAwesomeIcons.sliders,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 350),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(right: 25),
                              decoration: BoxDecoration(
                                color: current == index
                                    ? Color(0xff292526)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(64, 158, 158, 158),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    icons[index],
                                    size: 20,
                                    color: current == index
                                        ? Colors.white
                                        : Color(0xff292526),
                                  ),
                                  SizedBox(
                                    width: index == 2 ? 12 : 5,
                                  ),
                                  Text(
                                    items[index],
                                    style: GoogleFonts.encodeSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: current == index
                                          ? Colors.white
                                          : Color(0xff292526),
                                      letterSpacing: .3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MasonryGridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 23,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: data[current].length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataPage(data: data[current][index]),));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  data[current][index].cover.toString(),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      data[current][index].isliked =
                                          data[current][index].isliked == false;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: Color(0xff292526),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      data[current][index].isliked == false
                                          ? FontAwesomeIcons.heart
                                          : FontAwesomeIcons.solidHeart,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data[current][index].name.toString(),
                            style: GoogleFonts.encodeSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff292526),
                              letterSpacing: .3,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data[current][index].desc.toString(),
                            style: GoogleFonts.encodeSans(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffa4aaad),
                              letterSpacing: .3,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[current][index].value.toString(),
                                style: GoogleFonts.encodeSans(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff292526),
                                  letterSpacing: .3,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 255, 209, 59),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data[current][index].rait.toString() + ".0",
                                    style: GoogleFonts.encodeSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff292526),
                                      letterSpacing: .3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          height: 60,
          child: CustomNavigationBar(
            elevation: 10,
            isFloating: true,
            borderRadius: Radius.circular(40),
            selectedColor: Colors.white,
            unSelectedColor: Colors.grey,
            backgroundColor: Color(0xff292526),
            strokeColor: Colors.transparent,
            scaleFactor: .1,
            iconSize: 28,
            items: [
              CustomNavigationBarItem(
                icon: Icon(
                  _currentIndex != 0
                      ? Icons.home_outlined
                      : Icons.home,
                ),
              ),
              CustomNavigationBarItem(
                icon: Icon(
                  _currentIndex != 1
                      ? Icons.shopping_bag_outlined
                      : Icons.shopping_bag_rounded,
                ),
              ),
              CustomNavigationBarItem(
                
                icon: Icon(
                  _currentIndex != 2
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.solidHeart,
                      size: 26,
                ),
              ),
              CustomNavigationBarItem(
                icon: Icon(
                  _currentIndex == 3 ? Icons.person : Icons.person_outlined,
                ),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (p0) {
              setState(() {
                _currentIndex = p0;
              });
            },
          ),
        ),
      ),
    );
  }
}
