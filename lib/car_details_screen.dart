import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CarDetailsScreen
    extends
        StatefulWidget {
  final Map<
    String,
    dynamic
  >
  car;

  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  State<
    CarDetailsScreen
  >
  createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState
    extends
        State<
          CarDetailsScreen
        > {
  int days = 1;

  @override
  Widget build(
    BuildContext context,
  ) {
    int totalPrice =
        widget.car['price'] *
        days;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.car['name'],
        ),
        backgroundColor: const Color.fromARGB(
          255,
          50,
          187,
          157,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.car['image'],
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(
              height: 16,
            ),

            Text(
              widget.car['name'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Rs. ${widget.car['price']} per day',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // 🔹 Select Days
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Days',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.remove,
                      ),
                      onPressed: () {
                        if (days >
                            1) {
                          setState(
                            () => days--,
                          );
                        }
                      },
                    ),

                    Text(
                      days.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    IconButton(
                      icon: const Icon(
                        Icons.add,
                      ),
                      onPressed: () {
                        setState(
                          () => days++,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // 🔹 Total Price
            Text(
              'Total Price: Rs. $totalPrice',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            // 🔹 Book Now
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    50,
                    187,
                    157,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                ),
                onPressed: bookCar,
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Booking Function
  void bookCar() {
    final box = Hive.box(
      'bookingsBox',
    );

    box.add(
      {
        'name': widget.car['name'],
        'pricePerDay': widget.car['price'],
        'days': days,
        'total':
            widget.car['price'] *
            days,
        'date': DateTime.now().toString(),
      },
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      const SnackBar(
        content: Text(
          'Car Booked Successfully',
        ),
      ),
    );
  }
}
