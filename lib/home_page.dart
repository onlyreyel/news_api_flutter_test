import 'package:flutter/material.dart';
import 'package:news_api_flutter_test/const/google_fonts.dart';
import 'package:news_api_flutter_test/model/news_model.dart';
import 'package:news_api_flutter_test/service/news_api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 1;

  @override
  // List<Articles> newsList = [];
  @override
  // void didChangeDependencies() async {
  //   newsList = await NewsApiService().fetchNewsData();
  //   setState(() {});
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "News App",
          style: myStyle(25, Colors.black, FontWeight.w400),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All News",
                  style: myStyle(25, Colors.black),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //currentindex += currentindex;
                            });
                          },
                          child: Text("Previews")),
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentindex = index;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: 35,
                                  color: currentindex == index
                                      ? Colors.blue
                                      : Colors.white,
                                  child: Text("${index + 1}"),
                                ),
                              );
                            }),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //currentindex += currentindex;
                            });
                          },
                          child: Text("Next")),
                    ],
                  ),
                ),
                FutureBuilder<List<Articles>>(
                    future: NewsApiService().fetchNewsData(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState==ConnectionState.waiting){return Center(child: CircularProgressIndicator(),);

                      }
                      else if(snapshot.hasError){
                        return Container(child: Text("Something is wrong"),);
                      }
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 170,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Image.network(
                                            "${snapshot.data![index].urlToImage}",
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                        flex: 250,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              Text(
                                                "${snapshot.data![index].title}",
                                                style: myStyle(16, Colors.black,
                                                    FontWeight.w500),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                      child: Icon(Icons.link))
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//child: Text("${newsList[index].source!.name}
