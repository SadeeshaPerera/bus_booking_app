import 'package:flutter/material.dart';
import 'bus_tracking_feature/filter_options.dart';
import 'search_results_card.dart'; // Import the BusTicketCard widget

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEBFC),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: AppBar(
              backgroundColor: Colors.blue[900],
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
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
                          icon: const Icon(Icons.share, color: Colors.white),
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
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),
          // Add the new text below the AppBar
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Today, 12th July 2021',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          const FilterOptions(), // Add the FilterOptions widget here
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BusTicketCard(
                    departureTime: 'defr',
                    arrivalTime: 'df',
                    duration: 'dsf',
                    startLocation: 'dsf',
                    endLocation: 'sdf',
                    tripType: 'df',
                    price: 'casd',
                    seatsLeft: '4',
                  ), // Add the BusTicketCard widget here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
