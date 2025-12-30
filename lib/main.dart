import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'car_details_screen.dart';
import 'booking_history_screen.dart';

void
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(
    'bookingsBox',
  );
  await Hive.openBox(
    'usersBox',
  );
  runApp(
    const Inventory(),
  );
}

class Inventory
    extends
        StatelessWidget {
  const Inventory({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'CRS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome':
            (
              context,
            ) => const InventoryWelcomeScreen(),
        '/signup':
            (
              context,
            ) => InventorySignUpScreen(),
        '/signin':
            (
              context,
            ) => InventorySignInScreen(),
      },
    );
  }
}

@override
Widget
build(
  BuildContext context,
) {
  return Scaffold(
    backgroundColor: Colors.white,
  );
}

// ✅ WELCOME SCREEN

class InventoryWelcomeScreen
    extends
        StatelessWidget {
  const InventoryWelcomeScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Rental System',
        ),
        backgroundColor: const Color.fromARGB(
          255,
          50,
          187,
          157,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        0.25,
                      ),
                      blurRadius: 12,
                      offset: const Offset(
                        0,
                        6,
                      ),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: Stack(
                    children: [
                      // ✅ IMAGE
                      Image.asset(
                        'assets/images/bugati.jfif',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      // ✅ DARK GRADIENT AT BOTTOM
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(
                                  0.7,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // ✅ TEXT INSIDE IMAGE (BOTTOM)
                      const Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Text(
                          'Rent a Car',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            // ✅ BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  48,
                  222,
                  228,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              ),
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                '/signin',
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InventorySignUpScreen
    extends
        StatefulWidget {
  const InventorySignUpScreen({
    super.key,
  });

  @override
  State<
    InventorySignUpScreen
  >
  createState() => InventorySignUpScreenState();
}

class InventorySignUpScreenState
    extends
        State<
          InventorySignUpScreen
        > {
  bool _obscureText = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white, // plain white background
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/welcome',
            );
          },
        ),
        backgroundColor: const Color.fromARGB(
          255,
          39,
          189,
          216,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(
          24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),

              // Name
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),

              // Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),

              // Password
              TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(
                        () => _obscureText = !_obscureText,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  final box = Hive.box(
                    'usersBox',
                  );

                  box.put(
                    emailController.text,
                    {
                      'name': nameController.text,
                      'password': passwordController.text,
                    },
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Account Created Successfully',
                      ),
                    ),
                  );

                  Navigator.pushReplacementNamed(
                    context,
                    '/signin',
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Already Have an Account?',
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/signin',
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InventorySignInScreen
    extends
        StatefulWidget {
  const InventorySignInScreen({
    super.key,
  });

  @override
  State<
    InventorySignInScreen
  >
  createState() => InventorySignInScreenState();
}

class InventorySignInScreenState
    extends
        State<
          InventorySignInScreen
        > {
  bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/welcome',
            );
          },
        ),
        title: Text(
          'Sign In',
        ),
        backgroundColor: const Color.fromARGB(
          255,
          129,
          156,
          231,
        ),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(
          24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),

              // Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),

              // Password
              TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(
                        () => _obscureText = !_obscureText,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Sign In button
              ElevatedButton(
                onPressed: () {
                  final box = Hive.box(
                    'usersBox',
                  );

                  final user = box.get(
                    emailController.text,
                  );

                  if (user !=
                          null &&
                      user['password'] ==
                          passwordController.text) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Login Successful',
                        ),
                      ),
                    );
                    // ✅ Navigate to Main Screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (
                              _,
                            ) => CarListScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Invalid Email or Password',
                        ),
                      ),
                    );
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    129,
                    156,
                    231,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New here?',
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/signup',
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarListScreen
    extends
        StatelessWidget {
  CarListScreen({
    super.key,
  });

  // 🔹 Hardcoded car data
  final List<
    Map<
      String,
      dynamic
    >
  >
  cars = [
    {
      'name': 'Toyotta Corolla',
      'price': 1500,
      'image': 'assets/images/corolla.jfif',
    },
    {
      'name': 'Suzuki Cultus',
      'price': 300,
      'image': 'assets/images/cultus.jfif',
    },
    {
      'name': 'Honda City',
      'price': 700,
      'image': 'assets/images/hondacity.jfif',
    },
    {
      'name': 'Honda Civic',
      'price': 900,
      'image': 'assets/images/hondacivic.jfif',
    },
    {
      'name': 'Suzuki Mehran',
      'price': 300,
      'image': 'assets/images/mehran.jfif',
    },
    {
      'name': 'Honda Reborn',
      'price': 600,
      'image': 'assets/images/reborn.jfif',
    },
    {
      'name': 'Toyotta Surf',
      'price': 1200,
      'image': 'assets/images/surf.jfif',
    },
    {
      'name': 'Toyotta V8',
      'price': 2000,
      'image': 'assets/images/v8landcruiser.jfif',
    },
    {
      'name': 'Toyotta Vigo',
      'price': 1700,
      'image': 'assets/images/vigo.jfif',
    },
    {
      'name': 'Toyotta Yaris',
      'price': 500,
      'image': 'assets/images/yaris.jfif',
    },
  ];

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Cars',
        ),
        backgroundColor: const Color.fromARGB(
          255,
          50,
          187,
          157,
        ),
        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(
              Icons.history,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (
                        _,
                      ) => BookingHistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(
          16,
        ),
        itemCount: cars.length,
        itemBuilder:
            (
              context,
              index,
            ) {
              final car = cars[index];

              return Card(
                elevation: 5,
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Car Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(
                          12,
                        ),
                      ),
                      child: Image.asset(
                        car['image'],
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(
                        12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔹 Car Name
                          Text(
                            car['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          // 🔹 Price
                          Text(
                            'Rs.${car['price']} per day',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          // 🔹 Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  50,
                                  187,
                                  157,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (
                                          context,
                                        ) => CarDetailsScreen(
                                          car: car,
                                        ),
                                  ),
                                );
                              },

                              child: const Text(
                                'View Details',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
      ),
    );
  }
}
