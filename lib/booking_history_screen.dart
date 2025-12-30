import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BookingHistoryScreen
    extends
        StatelessWidget {
  const BookingHistoryScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final box = Hive.box(
      'bookingsBox',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking History',
        ),
        backgroundColor: const Color.fromARGB(
          255,
          50,
          187,
          157,
        ),
      ),

      body: box.isEmpty
          ? const Center(
              child: Text(
                'No bookings yet',
              ),
            )
          : ListView.builder(
              itemCount: box.length,
              itemBuilder:
                  (
                    context,
                    index,
                  ) {
                    final booking = box.getAt(
                      index,
                    );

                    return Card(
                      margin: const EdgeInsets.all(
                        12,
                      ),
                      child: ListTile(
                        title: Text(
                          booking['name'],
                        ),
                        subtitle: Text(
                          'Days: ${booking['days']} | Total: Rs.${booking['total']}',
                        ),
                        trailing: const Icon(
                          Icons.car_rental,
                        ),
                      ),
                    );
                  },
            ),
    );
  }
}
