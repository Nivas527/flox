import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final VoidCallback toggleOverlay;

  const NotificationPage({
    Key? key,
    required this.toggleOverlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: toggleOverlay, // Close overlay when tapping outside the container
        child: Container(
          color: Colors.black.withOpacity(0.5), // Dim background
          child: Center(
            child: GestureDetector(
              onTap: () {}, // Prevent closing when tapping inside the container
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: toggleOverlay, // Close overlay when tapping this icon
                        //       child: const Icon(
                        //         Icons.close_rounded,
                        //         size: 35,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Center(
                            child: const Text(
                              'No Notifications',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
