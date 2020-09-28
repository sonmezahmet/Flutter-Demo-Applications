import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function _saveFilters;
  final _currentFilters;

  FiltersScreen(this._currentFilters, this._saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVeganFree = false;
  var _isVegetarianFree = false;
  var _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget._currentFilters['gluten'];
    _isVeganFree = widget._currentFilters['vegan'];
    _isVegetarianFree = widget._currentFilters['vegetarian'];
    _isLactoseFree = widget._currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _isGlutenFree,
                'vegan': _isVeganFree,
                'vegetarian': _isVegetarianFree,
                'lactose': _isLactoseFree,
              };
              widget._saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Asjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only include Gluten-free meals.',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                    //print('gluten');
                  });
                }),
                _buildSwitchListTile('Vegan-free',
                    'Only include Vegan-free meals.', _isVeganFree, (newValue) {
                  setState(() {
                    _isVeganFree = newValue;
                    //print('vegan');
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian-free',
                    'Only include Vegetarian-free meals.',
                    _isVegetarianFree, (newValue) {
                  setState(() {
                    _isVegetarianFree = newValue;
                    //print('vegetarian');
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include Lactose-free meals.',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                    //print('lactose');
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
