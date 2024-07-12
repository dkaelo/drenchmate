import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';
import 'widgets/user_listing_page.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    void _showCreateUserDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CreateUserDialog();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Username', style: Theme.of(context).textTheme.headlineSmall),
                subtitle: Text(userController.username ?? 'N/A', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Role', style: Theme.of(context).textTheme.headlineSmall),
                subtitle: Text(userController.role ?? 'N/A', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Display Name', style: Theme.of(context).textTheme.headlineSmall),
                subtitle: Text(userController.displayName ?? 'N/A', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _showCreateUserDialog,
              icon: const Icon(Icons.add),
              label: const Text('Create User'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserListPage()),
                );
              },
              icon: const Icon(Icons.view_list),
              label: const Text('View All Users'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateUserDialog extends StatefulWidget {
  const CreateUserDialog({super.key});

  @override
  _CreateUserDialogState createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends State<CreateUserDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  String _role = 'worker';
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return AlertDialog(
      title: const Text('Create User'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _displayNameController,
              decoration: const InputDecoration(labelText: 'Display Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a display name';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: _role,
              decoration: const InputDecoration(labelText: 'Role'),
              items: ['worker', 'manager', 'farm_owner']
                  .map((role) => DropdownMenuItem<String>(
                        value: role,
                        child: Text(role),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  _role = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(_errorMessage, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final success = await userController.createUser(
                _emailController.text,
                _displayNameController.text,
                _role,
              );
              if (success) {
                setState(() {
                  _emailController.clear();
                  _displayNameController.clear();
                  _errorMessage = 'User created successfully';
                });
                Navigator.of(context).pop();
              } else {
                setState(() {
                  _errorMessage = 'Failed to create user';
                });
              }
            }
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
