import 'package:flutter/material.dart';
import 'package:syncc/model/enums/country.dart';

import '../../core/color.dart';

class ModernCountryPicker extends StatefulWidget {
  final String title;
  final Function(Country country) onChanged;

  const ModernCountryPicker({
    super.key,
    this.title = "Country",
    required this.onChanged,
  });

  @override
  State<ModernCountryPicker> createState() => _ModernCountryPickerState();
}

class _ModernCountryPickerState extends State<ModernCountryPicker> {
  late final TextEditingController searchController;
  late ValueNotifier<List<Country>> countries;
  Country? selectedCountry;

  @override
  void initState() {
    searchController = TextEditingController();
    countries = ValueNotifier(Country.values);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterList() {
    final query = searchController.value.text;
    countries.value = Country.search(query);
  }

  void _onCountrySelected(Country country) {
    setState(() {
      selectedCountry = country;
      searchController.text = country.name;
    });
    widget.onChanged(country);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: ModernColors.text,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 0.5,
          ),
        ),
        SizedBox(height: 12),

        ValueListenableBuilder<List<Country>>(
          valueListenable: countries,
          builder: (context, countryList, child) {
            return MenuAnchor(
              builder: (context, controller, child) {
                return TextField(
                  controller: searchController,
                  onTap: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      controller.isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: ModernColors.primary),
                    ),
                  ),
                );
              },
              menuChildren: [
                // Search field within the menu
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300, minWidth: 500),
                  child: ListBody(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (keyword) => filterList(),
                          decoration: InputDecoration(
                            hintText: 'Search countries...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      // Country list
                      ...countryList.map((country) {
                        return MenuItemButton(
                          onPressed: () => _onCountrySelected(country),
                          child: Text(
                            country.name,
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedCountry == country
                                  ? ModernColors.primary
                                  : ModernColors.text,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            );
          },
        ),

        SizedBox(height: 24),
      ],
    );
  }
}
