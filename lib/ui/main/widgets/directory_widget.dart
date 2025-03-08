import 'package:flutter/material.dart';

class DirectoryDrawerWidget extends StatelessWidget {
  const DirectoryDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 5 / 6,
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Сохраненные пароли'),),
          ListTile(
            title: const Text('Hello'),
            onTap: () => {},

          ),
        ],
      ),
    );
  }
}