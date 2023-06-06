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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveSizer(builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(title: const Text("Main screen"),),
          body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 1.h,
                  vertical: 1.h,
                ),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
                  itemBuilder: (context, index) =>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: data[index].imagePath,
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
                            data[index].name,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            data[index].socialMedia,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                ),
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
}

/*
Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://leadership.ng/wp-content/uploads/2023/03/davido.png",
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
                            Padding(
                              padding: EdgeInsets.only(
                                top: 2.h,
                                bottom: 1.h,
                              ),
                              child: Text(
                                "test",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF).withOpacity(0.8),
                                ),
                              ),
                            ),
                            Text(
                              "test",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFFFFFFFF).withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
 */

/*

Colors.grey,

        SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 1.h,
                  vertical: 1.h,
                ),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: GridTile (
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: data[index].imagePath,
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
                                data[index].name,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF).withOpacity(0.8),
                                ),
                              ),
                              Text(
                                data[index].socialMedia,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFFFFFFFF).withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      ),
                )
            ),
 */
