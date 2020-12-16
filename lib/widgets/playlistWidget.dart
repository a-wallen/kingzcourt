import 'package:flutter/material.dart';
import 'package:kingzcourt/widgets/bottomSheetWidget.dart';

class PlaylistWidget extends StatefulWidget {
  @override
  _PlaylistWidgetState createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  final List<String> itemsTest =
      List<String>.generate(20, (i) => 'Test Player $i');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsTest.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('${itemsTest[index]}'),
            leading: Icon(Icons.account_circle_outlined),
            trailing: IconButton(
                icon: Icon(Icons.keyboard_control),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheetWidget(),
                  );
                }),
          ),
        );
      },
    );
  }
}
