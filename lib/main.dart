import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF00529C),
      ),
      home: const BrimoLoginScreen(),
    );
  }
}

class BrimoLoginScreen extends StatelessWidget {
  const BrimoLoginScreen({super.key});

void _showFastMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: const BoxDecoration(
            color: Color(0xFF00529C),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
              const Text(
                'Fast Menu',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    _buildMenuItem(Icons.qr_code_scanner, 'QRIS'),
                    _buildMenuItem(Icons.wallet, 'E-Wallet'),
                    _buildMenuItem(Icons.credit_card, 'BRIZZI'),
                    _buildMenuItem(Icons.vibration, 'Pulsa/Data'),
                    _buildMenuItem(Icons.account_balance_wallet, 'Setor Tunai'),
                    _buildMenuItem(Icons.assignment, 'Catatan\nKeuangan'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF00529C), size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 11),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00529C),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60), 
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset('assets/logo_brimo.png', 
                      height: 50,
                      errorBuilder: (context, error, stackTrace) => 
                      const Text("BRImo", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20),
                      Image.asset('assets/ilustrasi.png', 
                      height: 320,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 150, color: Colors.white54),
                      ),
                    ],
                  ),
                ),  
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline, color: Colors.grey), 
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey), 
                      suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Lupa Username/Password?', 
                        style: TextStyle(color: Color(0xFF00529C), fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00529C),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Login', 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Atau masuk menggunakan',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Icon( Icons.fingerprint, size: 70, color: Color(0xFF00529C)),
                ],
              ),
            ),

            GestureDetector(
              onTap: () => _showFastMenu(context),
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity ! < 0) _showFastMenu(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                decoration: const BoxDecoration(
                  color: Color(0xFF00529C),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.keyboard_arrow_up, color: Colors.white),
                    const SizedBox(height: 5),
                    const Text(
                      'Fast Menu',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ) 
          ],
        ),
      ),
    );
  }
}
