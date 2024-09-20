import 'package:flutter/material.dart';
import 'bus_tracking_feature/filter_options.dart';
import 'search_results_card.dart'; // Import the BusTicketCard widget

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEBFC),
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 235, 19, 19),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  child: AppBar(
                    backgroundColor: Colors.blue[900],
                    iconTheme: const IconThemeData(
                      color: Colors.white, // Change this to your desired color
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  'Colombo Fort',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              const Expanded(
                                child: Text(
                                  'Galanigama',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.share,
                                    color: Colors.white),
                                onPressed: () {
                                  // Handle share button press
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: const Center(
                            child: Text(
                              'Additional Text Here',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    centerTitle: true,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '22th March, Thu | 1 Passenger',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 24.0),
            child: FilterOptions(),
          ), // Add the FilterOptions widget here
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: BusTicketCard(
                      departureTime: '5:31 AM',
                      arrivalTime: '7:23 AM',
                      duration: '1h 52m',
                      startLocation: 'Colombo Fort',
                      endLocation: 'Galanigama',
                      tripType: 'One way',
                      price: 'LKR 250',
                      seatsLeft: '2',
                      busNo: 'NA-1345',
                      airConditionType: 'AC',
                      busArrivalTime: '7:00 AM',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: BusTicketCard(
                      departureTime: '6:00 AM',
                      arrivalTime: '8:00 AM',
                      duration: '2h 0m',
                      startLocation: 'Colombo Fort',
                      endLocation: 'Galle',
                      tripType: 'One way',
                      price: 'LKR 300',
                      seatsLeft: '5',
                      busNo: 'NA-5678',
                      airConditionType: 'Non-AC',
                      busArrivalTime: '8:00 AM',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: BusTicketCard(
                      departureTime: '7:15 AM',
                      arrivalTime: '9:30 AM',
                      duration: '2h 15m',
                      startLocation: 'Colombo Fort',
                      endLocation: 'Matara',
                      tripType: 'One way',
                      price: 'LKR 350',
                      seatsLeft: '3',
                      busNo: 'NA-7890',
                      airConditionType: 'AC',
                      busArrivalTime: '9:30 AM',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: BusTicketCard(
                      departureTime: '8:00 AM',
                      arrivalTime: '10:30 AM',
                      duration: '2h 30m',
                      startLocation: 'Colombo Fort',
                      endLocation: 'Kandy',
                      tripType: 'One way',
                      price: 'LKR 400',
                      seatsLeft: '4',
                      busNo: 'NA-1234',
                      airConditionType: 'AC',
                      busArrivalTime: '10:30 AM',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: BusTicketCard(
                      departureTime: '9:00 AM',
                      arrivalTime: '11:45 AM',
                      duration: '2h 45m',
                      startLocation: 'Colombo Fort',
                      endLocation: 'Kurunegala',
                      tripType: 'One way',
                      price: 'LKR 450',
                      seatsLeft: '6',
                      busNo: 'NA-5679',
                      airConditionType: 'Non-AC',
                      busArrivalTime: '11:45 AM',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
