import 'dart:convert';
import 'package:flox/Chits/purchase_chits.dart';
import 'package:flox/Strategical_chit_page.dart';
import 'package:flox/Strategical_data_page.dart';
import 'package:flox/Strategical_investment_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StrategicalPage extends StatelessWidget {
  final List<String> chitNames;
  final List<int> targetAmounts;

  const StrategicalPage({
    Key? key,
    required this.chitNames,
    required this.targetAmounts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> getfunction(String month, String amount) async {
      // print('Month: $month');
      // print('Amount: $amount');

      try {
        final response = await http.post(
          Uri.parse('https://chitsoft.in/wapp/api/mobile3/purches_chit_15.php'),
          body: {
            "cid": "11",
            "type": "55",
            "month": month,
            "amount": amount,
          },
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          print('Response Data: $data');
          if (data['error'] == false &&
              data.containsKey('available_chits') &&
              data['available_chits'] is List) {
            List<dynamic> availableChits = data['available_chits'];

            for (var chit in availableChits) {
              if (chit is Map<String, dynamic>) {
                String month = chit['Month'] ?? 'Unknown';
                String months = chit['Months'] ?? 'Unknown';
                int amount = chit['Amount'] ?? 0;
                int lakh = chit['Lakh'] ?? 0;
                int totalinvestor = chit['Totainvestor'] ?? 0;
                String startDate = chit['Start_Date'] ?? 'N/A';
                String endDate = chit['End_Date'] ?? 'N/A';
                int brokage = chit['Brokage'] ?? 0;
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SelectedChit(
                //       amount: amount.toString(),
                //       brokage: brokage.toString(),
                //       endDate: endDate,
                //       months: months,
                //       startDate: startDate,
                //       totalinvestor: totalinvestor.toString(),
                //       lakh: lakh,
                //     ),
                //   ),
                // );
                print('Month: $month');
                print('Months: $months');
                print('Amount: $amount');
                print('Start Date: $startDate');
                print('End Date: $endDate');
                print('End Date: $totalinvestor');
                print('Brokage: $brokage');
                print('lakh: $lakh');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StrategicalChitPage(
                          amount: 50,
                          contributionamount: 250,
                          due: 5,
                          due_amount: 1250,
                          end_Date: "04/09/2024",
                          lakhamount: 50000,
                          month: "March",
                          start_Date: "04/05/2024",
                          total_Months: 24,
                        )));
              }
            }
          } else {
            print('Error in response or no available chits.');
          }
        } else {
          print('Failed to get data. Status code: ${response.statusCode}');
        }
      } catch (err) {
        print('Error: $err');
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Strategical Investment',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: size.width * 0.06,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        // actions: const [
        //   Icon(
        //     Icons.notifications_sharp,
        //     color: Colors.white,
        //     size: 30,
        //   ),
        //   SizedBox(width: 10),
        // ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            investmenttypes(size, 'F-PRIME 001', () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const StrategicalInvestmentPage(
                          amount: 50000,
                          start_Date: "04/05/20024",
                          end_Date: "04/09/2024",
                          Tenure_period: 6,
                          fixed_return: 21,
                          lakhamount: 100000,
                          withdraw_amount: 1456,
                        )),
              );
            }),
            investmenttypes(size, 'F-PRIME 002', () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const StrategicalInvestmentPage(
                          amount: 50000,
                          start_Date: "04/05/20024",
                          end_Date: "04/09/2024",
                          Tenure_period: 6,
                          fixed_return: 21,
                          lakhamount: 100000,
                          withdraw_amount: 1456,
                        )),
              );
            }),
            investmenttypes(size, 'F-PRIME ', () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const StrategicalInvestmentPage(
                          amount: 50000,
                          start_Date: "04/05/20024",
                          end_Date: "04/09/2024",
                          Tenure_period: 6,
                          fixed_return: 21,
                          lakhamount: 100000,
                          withdraw_amount: 1456,
                        )),
              );
            }),
          ],
        ),
      ),
    );
  }

  Padding investmenttypes(Size size, String name, VoidCallback function) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: function,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.06,
                    height: 33 / 22,
                    color: const Color(0Xff0D0140).withAlpha(200),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
