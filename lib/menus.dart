import 'package:flutter/material.dart';

class Menu_Route extends StatefulWidget {
  @override
  _MenuRouteState createState() => _MenuRouteState();
}

class _MenuRouteState extends State<Menu_Route> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String _simpleValue1 = 'Menu item value one';
  final String _simpleValue2 = 'Menu item value two';
  final String _simpleValue3 = 'Menu item value three';
  String _simpleValue="Menu item value one";

  final String _checkedValue1 = 'One';
  final String _checkedValue2 = 'Two';
  final String _checkedValue3 = 'Three';
  final String _checkedValue4 = 'Four';
  List<String> _checkedValues ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: ListView(
            padding: kMaterialListPadding,
            children: <Widget>[
              //*******************************Context Menu********************************
              // Pressing the PopupMenuButton on the right of this item shows
              // a simple menu with one disabled item. Typically the contents
              // of this "contextual menu" would reflect the app's state.
              ListTile(
                title: const Text('context menu button'),
                trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: showMenuSelection,
                  itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      value: _simpleValue1,
                      child: const Text('Item one'),
                    ),

                    PopupMenuItem<String>(
                      value: _simpleValue2,
                      child: const Text('Item two'),
                    ),
                    const PopupMenuItem<String>(
                      enabled: false,
                      child: Text('A disabled menu item'),
                    ),
                  ],
                ),
              ),


              //*******************************Sectioned Menu********************************
              // Pressing the PopupMenuButton on the right of this item shows
              // a menu whose items have text labels and icons and a divider
              // That separates the first three items from the last one.
              ListTile(
                title: const Text('sectioned menu'),
                trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: showMenuSelection,
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Edit',
                      child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                      ),
                    ),

                    const PopupMenuItem<String>(
                      value: 'Delete',
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete'),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'Add',
                      child: ListTile(
                        leading: Icon(Icons.add),
                        title: Text('Add'),
                      ),
                    ),

                    const PopupMenuItem<String>(
                      value: 'View',
                      child: ListTile(
                        leading: Icon(Icons.visibility),
                        title: Text('View'),
                      ),
                    ),

                  ],
                ),
              ),




              //*******************************Item With simple Menu********************************
              // This entire list item is a PopupMenuButton. Tapping anywhere shows
              // a menu whose current value is highlighted and aligned over the
              // list item's center line.
              PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                initialValue: _simpleValue,
                onSelected: showMenuSelection,
                child: ListTile(
                  title: const Text('An item with a simple menu'),
                  subtitle: Text(_simpleValue),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: _simpleValue1,
                    child: Text(_simpleValue1),
                  ),
                  PopupMenuItem<String>(
                    value: _simpleValue2,
                    child: Text(_simpleValue2),
                  ),
                  PopupMenuItem<String>(
                    value: _simpleValue3,
                    child: Text(_simpleValue3),
                  ),
                ],
              ),



              //*******************************Item with checked Menu********************************
              // Pressing the PopupMenuButton on the right of this item shows a menu
              // whose items have checked icons that reflect this app's state.
              ListTile(
                title: const Text('An item with a checklist menu'),
                trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: showCheckedMenuSelections,
                  itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue1,
                      checked: isChecked(_checkedValue1),
                      child: Text(_checkedValue1),
                    ),
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue2,
                      enabled: false,
                      checked: isChecked(_checkedValue2),
                      child: Text(_checkedValue2),
                    ),
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue3,
                      checked: isChecked(_checkedValue3),
                      child: Text(_checkedValue3),
                    ),
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue4,
                      checked: isChecked(_checkedValue4),
                      child: Text(_checkedValue4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

    );
    // body:_ackAlert ,
  }
  @override
  void initState() {
    super.initState();
    _simpleValue = _simpleValue2;
    _checkedValues = <String>[_checkedValue3];
  }

  void showMenuSelection(String value) {
    if (<String>[_simpleValue1, _simpleValue2, _simpleValue3].contains(value))
      _simpleValue = value;
    showInSnackBar('You selected: $value');
  }

  void showCheckedMenuSelections(String value) {
    if (_checkedValues.contains(value))
      _checkedValues.remove(value);
    else
      _checkedValues.add(value);

    showInSnackBar('Checked $_checkedValues');
  }

  bool isChecked(String value) => _checkedValues.contains(value);

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

}
