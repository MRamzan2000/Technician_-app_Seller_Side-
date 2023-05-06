import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_seller_side/Account/Accounts.dart';
import 'package:technician_seller_side/Messages/Messages.dart';
import 'package:technician_seller_side/Wallet/wallet.dart';
import 'package:technician_seller_side/Withdraw/Withdraw__.dart';
import '../Home Screens/Active_Orders.dart';

class Bottom_bar extends StatefulWidget {
  const Bottom_bar({Key? key}) : super(key: key);

  @override
  State<Bottom_bar> createState() => _Bottom_barState();
}

class _Bottom_barState extends State<Bottom_bar> {
  static List<Widget> _widgetOptions = <Widget>[
    Active_Orders(),
    Messages(),
    wallet(),
    Account(),
    Text(
      'Index 1: Home',
      // style: optionStyle,
    ),
    Text(
      'Index 2: Chat',
      // style: optionStyle,
    ),
    Text(
      'Index 3: Wallet',
      // style: optionStyle,
    ),
    Text(
      'Index 4: Account',
      // style: optionStyle,
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable back button
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.black,
          child: BottomNavigationBar(
            // selectedItemColor: Colors.red,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/HOme.svg"),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Bottom Chat.svg"),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Bottom wallet.svg"),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Bottom Profile.svg"),
                label: 'Account',
              ),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
