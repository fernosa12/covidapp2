import 'package:covidapp/model/data_covid%20(1).dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailProvinsi extends StatelessWidget {
  DetailProvinsi({super.key, required this.provinsi});
  DataCovid provinsi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provinsi.key!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Provinsi'),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  provinsi.key!,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                RowGrid(
                  jumlahKasus1: provinsi.jumlahKasus.toString(),
                  namaKasus1: 'Jumlah kasus',
                  color1: Colors.red,
                  jumlahKasus2: provinsi.jumlahSembuh.toString(),
                  namaKasus2: 'Jumlah sembuh',
                  color2: Colors.green,
                ),
                RowGrid(
                  jumlahKasus1: provinsi.jumlahMeninggal.toString(),
                  namaKasus1: 'Jumlah meninggal',
                  color1: Colors.orange,
                  jumlahKasus2: provinsi.jumlahDirawat.toString(),
                  namaKasus2: 'Jumlah Dirawart',
                  color2: Colors.blue,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Kelompok Umur',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Column(
                  children: provinsi.kelompokUmur!.map((data) {
                    return Card(
                      child: ListTile(
                        title: Text('${data['key']} Tahun'),
                        trailing: Text('${data['doc_count']}'),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RowGrid extends StatelessWidget {
  RowGrid(
      {Key? key,
      required this.jumlahKasus1,
      required this.jumlahKasus2,
      required this.namaKasus1,
      required this.namaKasus2,
      required this.color1,
      required this.color2})
      : super(key: key);
  String jumlahKasus1;
  String jumlahKasus2;
  String namaKasus1;
  String namaKasus2;
  Color color1;
  Color color2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Text(
                    jumlahKasus1,
                    style: TextStyle(
                        color: color1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    namaKasus1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Text(
                    jumlahKasus2,
                    style: TextStyle(
                        color: color2,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    namaKasus2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
