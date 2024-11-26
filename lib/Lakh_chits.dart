// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Selected_chit_month.dart';

class LakhChits extends StatefulWidget {
  final List<dynamic> monthList;
  final String month;
  final int amount_val;

  LakhChits({
    Key? key,
    required this.amount_val,
    required this.monthList,
    required this.month,
  }) : super(key: key);

  @override
  _LakhChitsState createState() => _LakhChitsState();
}

class _LakhChitsState extends State<LakhChits> {
  late List<bool> requestStatus;
  late List<bool> requestapproval;
  bool _isOverlayVisible = false;
  void _toggleOverlay() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    // requestStatus = List<bool>.filled(widget.monthList.length, false);
  }

  Future<void> selectedFunction(String month, String amount, String val) async {
    try {
      final response = await http.post(
        Uri.parse('https://chitsoft.in/wapp/api/mobile3/pay_lak_chit_api.php'),
        body: {
          "cid": "11",
          "type": "12",
          "month": "24",
          "due_month": "March",
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('Available Chits')) {
          Map<String, dynamic> availableChits = data['Available Chits'];
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SelectedChitMonth(
                amount: availableChits['Amount'] ?? 0,
                contributionamount: availableChits['Contribution Amount'] ?? 0,
                due: availableChits['Due'] ?? 0,
                due_amount: availableChits['Due Amount'] ?? 0,
                end_Date: availableChits['End Date'] ?? 'Unknown',
                month: availableChits['Month'] ?? 'Unknown',
                start_Date: availableChits['Start Date'] ?? 'Unknown',
                total_Months: availableChits['Months'] ?? 0,
                lakhamount: availableChits['Total Amount'] ?? 0,
                auctionwin: 2,
              ),
            ),
          );
        } else {
          print('Available Chits key is missing in the response.');
        }
      } else {
        print('Failed to get data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("",
          // '${widget.amount_val} Lakh CHITS',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 27,
            height: 37 / 27,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
        actions: const [
          Icon(
            Icons.notifications_sharp,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: widget.monthList.length,
              itemBuilder: (context, index) {
                final monthData = widget.monthList[index];
                if (monthData is Map<String, dynamic>) {
                  return collectionOfChit(
                      size,
                      monthData['month'] ?? 'Unknown Month',
                      monthData['Investor Count']?.toString() ?? '0', () {
                    setState(() {
                      requestStatus[index] = true;
                      // requestapproval[index] = true;
                    });
                    if (requestStatus[index]) {
                      selectedFunction(
                        monthData['month'] ?? '',
                        widget.amount_val.toString(),
                        widget.month,
                      );
                    }
                  }, requestStatus[index], false);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            if (_isOverlayVisible)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 244, 244),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _toggleOverlay,
                                child: const Icon(
                                  Icons.close_rounded,
                                  size: 35,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 245, 244, 244),
                                borderRadius: BorderRadius.circular(25)),
                          )
                        ],
                      ),
                    )),
              ),
          ],
        ),
      ),
    );
  }

  Widget collectionOfChit(Size size, String monthName, String investors,
      Function() function, bool request, bool requestapproval) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height / 8,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$monthName Chit',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.065,
                    height: 33 / 22,
                    color: const Color(0Xff0D0140),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Monthly : ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.045,
                        height: 22 / 15,
                        color: const Color(0Xff0D0140),
                      ),
                    ),
                    Text(
                      investors,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: size.width * 0.05,
                        height: 31 / 21,
                        color: const Color(0Xff0039DB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isOverlayVisible = !_isOverlayVisible;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2,
                          color: Color.fromARGB(255, 128, 122, 122),
                        ),
                      ],
                    ),
                    child: Center(
                        child: Icon(
                      Icons.edit_document,
                      color: Colors.purple.shade700,
                      size: 24,
                    )),
                  ),
                ),
                request
                    ? Icon(
                        Icons.timelapse_rounded,
                        color: requestapproval
                            ? Colors.green
                            : Colors.purple.shade700,
                        size: 20,
                      )
                    : GestureDetector(
                        onTap: function,
                        child: Container(
                          height: size.height * 0.04,
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade700,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Request',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.045,
                                height: 22 / 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
