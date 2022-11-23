import 'package:counter_7/page/fetchwatchlist.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  @override
  State<MyWatchListPage> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchListPage> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),

      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "No watchlist available",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );

            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        padding: const EdgeInsets.all(10.0),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: listMyWatchListTotal[i].fields.watched
                                  ? Colors.green
                                  : Colors.red,
                              blurRadius: 5.0)
                        ]),
        
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWatchListDetail(
                                      myWatchList: listMyWatchListTotal[i])),
                            );
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                  value: listMyWatchListTotal[i].fields.watched,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      listMyWatchListTotal[i].fields.watched =
                                          value!;
                                    });
                                  }),

                              Text(
                                "${snapshot.data![i].fields.title}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}


class MyWatchListDetail extends StatelessWidget {
  const MyWatchListDetail({super.key, required this.myWatchList});

  final MyWatchListModel myWatchList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: buildDrawer(context),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Column(
            children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      myWatchList.fields.title,
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ]),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Release Date: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                          myWatchList.fields.releaseDate
                              .toString()
                              .substring(0.bitLength),
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Rating: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(myWatchList.fields.rating.toString(),
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Status: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                          myWatchList.fields.watched
                              ? "watched ✔️"
                              : "not watched ❌",
                          style: const TextStyle(fontSize: 16)), 
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Review: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(children: [
                    Flexible(
                      child: Text(myWatchList.fields.review.toString(),
                          style: TextStyle(fontSize: 16)),
                    )
                  ])
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(60), 
                ),
              )
            ],
          ),
        ]),
      )),
    );
  }
}