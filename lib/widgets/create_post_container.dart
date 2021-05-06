import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.ZCmvG2PxbFUJ_a82MFPoYwHaHa?pid=ImgDet&rs=1'),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: '¿Qué estás pensando?',
                    ),
                  ),
                )
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () => print('Documentos'),
                    icon: const Icon(
                      Icons.insert_drive_file_sharp,
                      color: Colors.yellow,
                    ),
                    label: Text('Doc'),
                  ),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                    onPressed: () => print('Foto'),
                    icon: const Icon(Icons.add_photo_alternate_rounded,
                        color: Colors.green),
                    label: Text('Foto'),
                  ),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                    onPressed: () => print('Videos'),
                    icon: const Icon(
                      Icons.video_collection,
                      color: Colors.orange,
                    ),
                    label: Text('Video'),
                  ),
                  const VerticalDivider(width: 8.0),
                ],
              ),
            )
          ],
        ));
  }
}
