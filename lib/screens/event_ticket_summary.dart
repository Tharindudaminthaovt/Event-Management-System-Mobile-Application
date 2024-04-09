import 'package:flutter/material.dart';
import 'package:test_app/pages/event_ticket_confirmation.dart';
import 'package:test_app/pages/event_ticket_selection.dart';

class EventTicketSummary extends StatefulWidget {
  final double selectedOption;
  const EventTicketSummary({super.key, required this.selectedOption});

  @override
  State<EventTicketSummary> createState() => _EventTicketSummaryState();
}

class _EventTicketSummaryState extends State<EventTicketSummary> {
  int _count = 0;
  double _totalPrice = 0.00;
  late double selectedOption;
  double bookingFee = 100;
  double withbookingfee = 0;

  void _incrementCount() {
    setState(() {
      _count++;
      _updateTotalPrice();
      _withBookingFee();
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
        _updateTotalPrice();
        _withBookingFee();
      }
    });
  }

  void _updateTotalPrice() {
    setState(() {
      _totalPrice = (_count * selectedOption);
    });
  }

  void _withBookingFee() {
    setState(() {
      withbookingfee = bookingFee + _totalPrice;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EvenetTicketSelection()));
          },
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              'lib/images/Ellipse 19.png',
              height: 30,
              width: 30,
            ),
            margin: EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ),
        title: Text(
          'Ticket Summary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Container(
              height: 165,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff4B38AC)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Event name',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          'Date:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 36.0),
                        Text(
                          'Wed, 10, June',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Time:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 33.0),
                        Text(
                          '5pm onwards',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Location:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Colombo',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 206,
                        ),
                        Text(
                          '$selectedOption x $_count',
                          style: TextStyle(
                              color: Color(0xff4B38AC),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40,
                width: 350,
                color: Colors.white,
                child: Row(
                  children: [
                    Text(
                      'Ticket Count',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 95,
                    ),
                    IconButton(
                        onPressed: _decrementCount,
                        icon: Icon(Icons.remove_circle_outline)),
                    Text('$_count'),
                    IconButton(
                        onPressed: _incrementCount,
                        icon: Icon(Icons.add_circle_outline)),
                  ],
                )),
            SizedBox(
              height: 345,
            ),
            Container(
              height: 40,
              width: 350,
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Text(
                    'Rs.$_totalPrice',
                    style: TextStyle(
                        color: Color(0xff4B38AC),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFC8E94)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EvenetTicketConfirmation(
                              total: withbookingfee,
                            )));
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
