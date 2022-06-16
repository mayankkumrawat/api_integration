import 'dart:math';

import 'package:api_integration/controller/homepage_controller.dart';
import 'package:api_integration/services/remote_services.dart';
import 'package:api_integration/view/read_more.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageController = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();

    //fetch data from api
    // getData();
  }

  // void getData() async {
  //   datums = await RemoteService().getData();
  //   if (datums != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Visibility(
          visible: homePageController.isLoaded.value,
          child: ListView.builder(
            itemCount: homePageController.datums.value.length,
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // width: 60,
                            alignment: AlignmentDirectional.center,
                            height: 200,
                            child: Image.network(homePageController
                                .datums.value[index].imageUrl!),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[300],
                            ),
                          ),
                          Text(
                            homePageController.datums.value[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            homePageController.datums.value[index].content,
                            maxLines: 4,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReadMore(
                                      index, homePageController.datums.value),
                                ),
                              );
                            },
                            child: Text(
                              'Read More',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          replacement: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
