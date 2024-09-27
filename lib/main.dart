import 'package:flutter/material.dart';

void main() {
  runApp(DealsDrayApp());
}

class DealsDrayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealsDray',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/otp': (context) => OtpVerificationScreen(),
        '/register': (context) => RegistrationScreen(),
      },
    );
  }
}

// SplashScreen code
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 150), // Replace with your logo asset
            SizedBox(height: 20),
            Text(
              'DealsDray',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}

// HomeScreen code (with product cards)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DealsDray'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue[100],
                child: ListTile(
                  title: Text('KYC Pending'),
                  subtitle: Text(
                      'You need to provide the required documents for your account activation.'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Click Here'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4, // Number of exclusive products
                itemBuilder: (context, index) {
                  return ProductCard(); // Create a widget for each product
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ProductCard for home screen
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Image.network('https://via.placeholder.com/150'), // Replace with your product image URL
          Text('Product Name'),
          Text('32% Off'),
        ],
      ),
    );
  }
}

// LoginScreen code
class LoginScreen extends StatelessWidget {
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DealsDray Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Glad to see you!", style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text("Please provide your phone number"),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/otp');
              },
              child: Text('Send Code'),
            ),
          ],
        ),
      ),
    );
  }
}

// OtpVerificationScreen code
class OtpVerificationScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("OTP Verification"),
            SizedBox(height: 8),
            Text("We have sent a unique OTP number to your mobile"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: otpController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("01:57"),
                TextButton(
                  onPressed: () {},
                  child: Text('Send Again'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

// RegistrationScreen code
class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Let's Begin!"),
            SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Your Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Create Password'),
              obscureText: true,
            ),
            TextField(
              controller: referralController,
              decoration: InputDecoration(labelText: 'Referral Code (Optional)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}