import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> setFilters;
  FiltersScreen(this.setFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.setFilters['gluten'];
    _lactoseFree = widget.setFilters['lactose'];
    _vegan = widget.setFilters['vegan'];
    _vegetarian = widget.setFilters['vegetarian'];
    super.initState();
  }

  Widget _buildListTile(String title, String discription, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      onChanged: updateValue,
      title: Text(title),
      value: currentValue,
      subtitle: Text(discription),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            _buildListTile(
                'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildListTile('Lactose-free', 'Only include lactose-free meals.',
                _lactoseFree, (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildListTile('Vegan', 'Only include vegan meals.', _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildListTile(
                'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
