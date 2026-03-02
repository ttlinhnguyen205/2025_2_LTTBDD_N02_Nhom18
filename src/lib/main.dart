import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManHinh1(),
    ),
  );
}

class ManHinh1 extends StatelessWidget {
  const ManHinh1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// ẢNH NỀN FULL
          SizedBox.expand(
            child: Image.asset(
              'imgs/login.jpg',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),

                  /// TITLE
                  Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Amazing",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      " Destinations ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "We believe traveling around the world shouldn't be hard.",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),

                  Spacer(),

                  /// NÚT ĐĂNG NHẬP
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          255,
                          115,
                          0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ManHinhLogin();
                            },
                          ),
                        );
                      },
                      child: Text(
                        " Đăng nhập ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  /// NÚT ĐĂNG KÝ
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: const Color.fromARGB(
                            255,
                            255,
                            153,
                            0,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ManHinhDangKy();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(
                          color: const Color.fromARGB(
                            255,
                            255,
                            111,
                            0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ==================
/// TRANG LOGIN
/// ==================
class ManHinhLogin extends StatelessWidget {
  const ManHinhLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trang Đăng Nhập")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Quay lại"),
        ),
      ),
    );
  }
}

/// ==================
/// TRANG ĐĂNG KÝ
/// ==================
class ManHinhDangKy extends StatelessWidget {
  const ManHinhDangKy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trang Đăng Ký")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Quay lại"),
        ),
      ),
    );
  }
}
