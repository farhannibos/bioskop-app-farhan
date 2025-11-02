import 'package:flutter/material.dart';
import 'layer/login_leyar.dart';
import 'layanan/lokasil_layanan.dart';

void main() {
  // Test lokasi service
  testLokasi();
  runApp(const MyApp());
}

void testLokasi() async {
  LokasiLayanan service = LokasiLayanan();
  print('Mendapatkan lokasi...');
  
  String lokasi = await service.dapatkanLokasiSekarang();
  print('LOKASI: $lokasi');
  
  // Test detail lokasi
  // LokasiLayanan doesn't define `dapatkanDetailLokasi()`; use a safe fallback.
  var detail = 'Detail lokasi tidak tersedia';
  print('DETAIL: $detail');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bioskop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginLeyar(),
      debugShowCheckedModeBanner: false,
    );
  }
}