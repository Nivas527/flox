import 'package:flutter/material.dart';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close_rounded,
            size: 35,
            color: Colors.white,
          ),
        ),
          ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            ),
        ),
      ),
      decoration: BoxDecoration(
        ),
      ),
          ),
          children: [
      children: [
          child: Padding(
            child: Text(
            ),
          ),
        ),
            child: Text(
            ),
          ),
        ),
          child: Padding(
            child: Text(
            ),
          ),
        ),
            child: Text(
            ),
          ),
        ),
      ],
      children: [
          ),
        ),
          ),
        ),
          ),
        ),
          child: Padding(
            child: Text(
            ),
          ),
        ),
      ],
    );
  }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$month months chit',
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              Text(
                'Chit Amount :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.currency_rupee_outlined,
                size: 28,
                color: Colors.white,
              ),
              Text(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                    'Start date',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                  ),
                  Text(
                    startdate,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                    'End date',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                  ),
                  Text(
                    enddate,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                'Total Investors :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                totalinvestors,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                'Brokerage :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                brokerage,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
