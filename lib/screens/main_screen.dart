import 'package:flutter/material.dart';
import 'package:me_money/screens/market_screen.dart';
import 'package:me_money/screens/news_screen.dart';
import 'package:me_money/screens/account_screen.dart';
import 'package:me_money/screens/coin_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List pages = [CoinScreen(), MarketScreen(), NewsScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
