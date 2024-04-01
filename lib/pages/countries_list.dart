import 'package:covid19_tracker/pages/details_screen.dart';
import 'package:covid19_tracker/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: 'Search with country name',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
          Expanded(
              child: FutureBuilder<List<dynamic>>(
            future: statesServices.fetchCountriesListApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              color: Colors.green[100],
                            ),
                            title: Container(
                              height: 10,
                              width: 89,
                              color: Colors.green[100],
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 89,
                              color: Colors.green[100],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String countryName = snapshot.data![index]['country'];
                    if (searchController.text.isEmpty) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]['countryInfo']['flag'],
                                        totalCases: snapshot.data![index]['cases'],
                                        totalDeaths: snapshot.data![index]['deaths'],
                                        totalRecovered: snapshot.data![index]['recovered'],
                                        active: snapshot.data![index]['active'],
                                        critical: snapshot.data![index]['critical'],
                                        todayRecovered: snapshot.data![index]['todayRecovered'],
                                        test: snapshot.data![index]['tests'],
                                      )));
                            },
                            child: ListTile(
                              leading: Image(
                                image: NetworkImage(snapshot.data![index]
                                ['countryInfo']['flag']),
                                height: 50,
                                width: 50,
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                            ),
                          )
                        ],
                      );
                    } else if (countryName
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            name: snapshot.data![index]['country'],
                                            image: snapshot.data![index]['countryInfo']['flag'],
                                            totalCases: snapshot.data![index]['cases'],
                                            totalDeaths: snapshot.data![index]['deaths'],
                                            totalRecovered: snapshot.data![index]['recovered'],
                                            active: snapshot.data![index]['active'],
                                            critical: snapshot.data![index]['critical'],
                                            todayRecovered: snapshot.data![index]['todayRecovered'],
                                            test: snapshot.data![index]['tests'],
                                          )));
                            },
                            child: ListTile(
                              leading: Image(
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag']),
                                height: 50,
                                width: 50,
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
