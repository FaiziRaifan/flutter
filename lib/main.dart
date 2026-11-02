import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailMenuPage(),
    );
  }
}
 

class DetailMenuPage extends StatefulWidget {
  const DetailMenuPage({super.key});
 
  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}
 
class _DetailMenuPageState extends State<DetailMenuPage> {
  // Langkah 2: deklarasi state
  bool isFavorite = false;
  int jumlahPesanan = 1;
  String catatanPesanan = '';
 
  
  final int hargaSatuan = 25000;
 
  Widget _itemInfo(IconData ikon, Color warna, String teks) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(ikon, color: warna, size: 18),
        const SizedBox(width: 4),
        Text(teks, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Menu'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        actions: [
          
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.redAccent : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://picsum.photos/600/400',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kopi Susu Gula Aren',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp 25.000',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
 
                  
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _itemInfo(Icons.star, Colors.amber, '4.9'),
                        _itemInfo(Icons.schedule, Colors.brown, '10 menit'),
                        _itemInfo(Icons.local_fire_department,
                            Colors.deepOrange, '150 kal'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
 
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Atur Porsi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              // tidak boleh kurang dari 1
                              if (jumlahPesanan > 1) {
                                setState(() {
                                  jumlahPesanan--;
                                });
                              }
                            },
                          ),
                          Text(
                            '$jumlahPesanan',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                jumlahPesanan++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
 
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Perpaduan espresso, susu segar, dan gula aren asli. '
                    'Rasanya manis legit dengan aroma karamel. '
                    'Paling enak diminum dingin di siang hari.',
                  ),
                  const SizedBox(height: 16),
 
                  
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        catatanPesanan = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Catatan untuk Barista (Opsional)',
                      prefixIcon: Icon(Icons.edit_note),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (catatanPesanan.isNotEmpty)
                    Text(
                      'Catatan: "$catatanPesanan"',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(height: 16),
 
                  
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        'Pesan Sekarang (Rp ${hargaSatuan * jumlahPesanan})',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
