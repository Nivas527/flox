import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavingChit extends StatefulWidget {
  const SavingChit({super.key});

  @override
  State<SavingChit> createState() => _SavingChitState();
}

class _SavingChitState extends State<SavingChit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpeg"),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
              AssetImage("assets/cross.png"),
              color: Colors.white,
              size: 24,
            ),
          ),
          title: Text(
              fontWeight: FontWeight.w700,
              color: Colors.white,
          ),
          centerTitle: true,
        ),
            children: [
      onTap: () {
      },
        child: Container(
          decoration: BoxDecoration(
          child: Padding(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ),
                ),
                  Padding(
                            decoration: BoxDecoration(
                        Padding(
                  ),
              ],
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
