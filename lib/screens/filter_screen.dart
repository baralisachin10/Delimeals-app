import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(this.saveFilter, {super.key});

  static const routeName = '/filters';
  final Function saveFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactosefree': _lactoseFree
              };
              widget.saveFilter(selectedFilters);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            )),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchTile(
                  'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchTile(
                  'Lactose-free', 'Only add lactose-free meals.', _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchTile('Vegan', 'Only add Vegan meals.', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              _buildSwitchTile(
                  'Vegeterian', 'Only add Vegeterian meals.', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
            ],
          ),
        ),
      ]),
    );
  }
}
