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
            title: Row(
              children: [
                Expanded(child: Text('${itemsTest[index]}')),
                Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        height: 15,
                      ),
                      Text(
                        //TODO
                        'OH',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'pos',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      )
                    ]),
                Container(
                  width: 15,
                ),
                Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      height: 15,
                    ),
                    Text('0', style: TextStyle(fontSize: 12)),
                    Text(
                      'wait',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                )
              ],
            )
            //Text('${itemsTest[index]}')
            ,
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
