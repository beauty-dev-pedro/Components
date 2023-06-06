import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'influencer_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<BottomNavigationBarItem> bottomNavigationItems =
  <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.person),
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.menu),
      icon: Icon(Icons.menu_outlined),
      label: 'Menu',
    ),
  ];
  List<Influencer> listInfluence = data;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveSizer(builder: (context, orientation, screenType) {
        return Scaffold(
          body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 1.h,
                  vertical: 1.h,
                ),
                child: Column(children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Influencer',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: searchInfluencer,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: listInfluence.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
                      itemBuilder: (context, index) =>
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: listInfluence[index].imagePath,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      width: 20.h,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFFDDB05F),
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: imageProvider,
                                        ),
                                      ),
                                    ),
                                progressIndicatorBuilder: (context, url,
                                    downloadProgress) =>
                                const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                              Text(
                                listInfluence[index].name,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                listInfluence[index].socialMedia,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                ],)
              )
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: bottomNavigationItems,
            onTap: (index) {
              print("Navigate to $index");
            },
          ),
        );
      }
      ),
    );
  }
  void searchInfluencer(String query) {
    final suggestions = data.where((element) {
      final influencer = element.name.toLowerCase();
      final input = query.toLowerCase();

      return influencer.contains(input);
    }).toList();

    setState(() {
      listInfluence = suggestions;
    });
  }
}
