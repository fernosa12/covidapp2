import 'package:covidapp/model/data_covid%20(1).dart';
import 'package:covidapp/widget/detail_provinsi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProvinsiItem extends StatelessWidget {
  ProvinsiItem({Key? key, required this.dataprovinsi}) : super(key: key);
  DataCovid dataprovinsi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProvinsi(provinsi: dataprovinsi),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF000000))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dataprovinsi.key!),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Jumlah Kasus',
            ),
            Text(dataprovinsi.jumlahKasus.toString(),
                style: const TextStyle(color: Color(0xFFB00020)))
          ],
        ),
      ),
    );
  }
}
