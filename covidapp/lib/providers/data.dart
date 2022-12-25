import 'dart:convert';

import 'package:covidapp/model/data_covid%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier {
  List<DataCovid> dataProvinsi = [];
  Future<void> fetchData() async {
    String url = 'https://data.covid19.go.id/public/api/prov.json';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List extractData = (jsonDecode(response.body))['list_data'];
      for (var data in extractData) {
        dataProvinsi.add(DataCovid(
            key: data['key'],
            docCount: data['doc_count'].toString(),
            jumlahKasus: data['jumlah_kasus'],
            jumlahSembuh: data['jumlah_sembuh'],
            jumlahMeninggal: data['jumlah_meninggal'],
            jumlahDirawat: data['jumlah_dirawat'],
            jenisKelamin: data['jenis_kelamin'] as List,
            kelompokUmur: data['kelompok_umur'] as List,
            lokasi: data['lokasi'],
            penambahan: data['penambahan']));
      }
    }
  }
}
