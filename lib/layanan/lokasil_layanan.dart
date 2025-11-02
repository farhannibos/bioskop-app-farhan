import 'package:geolocator/geolocator.dart';

class LokasiLayanan {
  Future<String> dapatkanLokasiSekarang() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return 'Aktifkan GPS untuk lokasi';
      }

      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return 'Izin lokasi ditolak';
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        return 'Izin lokasi ditolak permanen';
      }

      Position position = await Geolocator.getCurrentPosition();

      // Simulasi nama kota berdasarkan zona koordinat
      String namaKota = _dapatkanNamaKota(position.latitude, position.longitude);
      
      return 'Lokasi: $namaKota';
      
    } catch (e) {
      return 'Mencari lokasi...';
    }
  }

  String _dapatkanNamaKota(double latitude, double longitude) {
    // Logic sederhana menentukan kota berdasarkan koordinat Indonesia
    if (latitude > -6.0 && latitude < -5.0 && longitude > 106.0 && longitude < 107.0) {
      return 'Jakarta';
    } else if (latitude > -7.0 && latitude < -6.0 && longitude > 107.0 && longitude < 108.0) {
      return 'Bandung';
    } else if (latitude > -2.0 && latitude < 6.0 && longitude > 95.0 && longitude < 141.0) {
      return 'Sumatera Utara';
    } else if (latitude > -8.0 && latitude < -5.0 && longitude > 115.0 && longitude < 120.0) {
      return 'Bali';
    } else if (latitude > -7.0 && latitude < 1.0 && longitude > 110.0 && longitude < 120.0) {
      return 'Jawa Tengah';
    } else if (latitude > 0.0 && latitude < 5.0 && longitude > 95.0 && longitude < 105.0) {
      return 'Aceh';
    } else {
      // Jika tidak masuk zona manapun, tampilkan provinsi berdasarkan latitude
      if (latitude > 0) return 'Indonesia Utara';
      else if (latitude < -8) return 'Indonesia Timur';
      else return 'Indonesia Tengah';
    }
  }
}