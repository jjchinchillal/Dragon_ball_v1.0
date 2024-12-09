import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  final String headerTitle;
  final List<Map<String, dynamic>> menuOptions;

  const CustomDrawer({
    super.key,
    required this.headerTitle,
    required this.menuOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                headerTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuOptions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    menuOptions[index]['icon'],
                  ),
                  title: Text(
                    menuOptions[index]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    context.push(menuOptions[index]['route']);
                  },
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Cerrar Sesión",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            onTap: () {
              context.go('/');
            },
          ),
        ],
      ),
    );
  }
}
