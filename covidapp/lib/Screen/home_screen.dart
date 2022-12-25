import 'package:covidapp/providers/data.dart';
import 'package:covidapp/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    Data dataCovid = Provider.of<Data>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Covid App'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: dataCovid.fetchData(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 5 / 3),
                    itemCount: dataCovid.dataProvinsi.length,
                    itemBuilder: (context, index) {
                      final data = dataCovid.dataProvinsi[index];
                      return ProvinsiItem(dataprovinsi: data);
                    },
                  ),
                );
              }
            })));
  }
}
