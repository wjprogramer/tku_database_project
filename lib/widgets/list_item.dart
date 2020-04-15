import 'package:flutter/material.dart';
import 'package:tkudatabaseproject/model/factory.dart';
import 'package:tkudatabaseproject/model/models.dart';

class ListItem extends StatefulWidget {
  final BaseModel model;

  ListItem({
    this.model,
  });

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  double itemHeight = 80.0;
  double itemVerticalPadding = 10.0;
  double itemHorizontalPadding = 10.0;
  double itemBorderRadius = 20;

  double iconContainerSize;
  double iconSize;

  Function editHandle;
  Function deleteHandle;

  Widget header() {
    return Container(
      width: iconContainerSize,
      height: iconContainerSize,
      decoration: BoxDecoration(
        color: colorOf[widget.model.runtimeType],
      ),
      child: Icon(iconOf[widget.model.runtimeType], size: iconSize, color: Colors.white,),
    );
  }

  Widget content() {
    return Expanded(
      flex: 1,
      child: SizedBox(),
    );
  }

  Widget actions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Offstage(
          offstage: editHandle == null,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: itemHeight / 3,
              width: itemHeight / 2,
              child: Icon(Icons.edit, color: Colors.green,),
            ),
          ),
        ),
        Offstage(
          offstage: deleteHandle == null,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: itemHeight / 3,
              width: itemHeight / 2,
              child: Icon(Icons.delete_forever, color: Colors.red,),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    iconContainerSize = itemHeight;
    iconSize = iconContainerSize / 2;

    return Container(
      height: itemHeight,
      margin: EdgeInsets.symmetric(horizontal: itemHorizontalPadding, vertical: itemVerticalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(itemBorderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(itemBorderRadius),
        child: Row(
          children: <Widget>[
            header(),
            content(),
            actions(),
          ],
        ),
      ),
    );
  }
}

