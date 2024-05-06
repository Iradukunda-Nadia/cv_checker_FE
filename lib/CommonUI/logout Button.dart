import 'package:cv_checker/Authentication/LoginSignup.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuItem<String>(
      onTap: (){
        print('logout');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)
            => LoginSignup()),
                (Route<dynamic> route) => false);
      },
      value: "logout",
      child: Row(
        children: const [
          Icon(
            Icons.logout,
            color:Colors.black,
            size: 25,
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
