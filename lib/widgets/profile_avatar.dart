import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.0,
      backgroundColor: Colors.grey[200],
      backgroundImage: NetworkImage(
          'https://th.bing.com/th/id/OIP.ZCmvG2PxbFUJ_a82MFPoYwHaHa?pid=ImgDet&rs=1'),
    );
  }
}
