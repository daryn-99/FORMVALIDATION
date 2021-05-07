import 'package:flutter/material.dart';
import 'package:formvalidation/config/palette.dart';

class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          //Aqui iran los mensajes diarios
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _createRoomButton(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(2.0),
            height: 20.0,
            width: 20.0,
            color: Colors.red,
          );
        },
      ),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Create Daily'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(width: 3.0, color: Colors.blueGrey),
      textColor: Palette.colorBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.add_photo_alternate_rounded,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Text('Create\ndaily'),
        ],
      ),
    );
  }
}
