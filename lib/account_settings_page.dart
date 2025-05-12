import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  // Placeholder for initial user data
  String _currentName = "User Name";
  String _currentEmail = "user.email@example.com";
  String _currentPhone = "+1 123-456-7890";

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _currentName);
    _emailController = TextEditingController(text: _currentEmail);
    _phoneController = TextEditingController(text: _currentPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        // If exiting edit mode without saving, revert changes
        _nameController.text = _currentName;
        _emailController.text = _currentEmail;
        _phoneController.text = _currentPhone;
      }
    });
  }

  void _saveChanges() {
    setState(() {
      _currentName = _nameController.text;
      _currentEmail = _emailController.text;
      _currentPhone = _phoneController.text;
      _isEditing = false; // Exit edit mode
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved! (Placeholder)')),
    );
    // In a real app, you would call an API to save these changes.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit_outlined),
            tooltip: _isEditing ? "Cancel" : "Edit",
            onPressed: _toggleEdit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildInfoField(
              label: "Full Name",
              controller: _nameController,
              icon: Icons.person_outline,
              isEditing: _isEditing,
            ),
            const SizedBox(height: 20),
            _buildInfoField(
              label: "Email Address",
              controller: _emailController,
              icon: Icons.email_outlined,
              isEditing: _isEditing,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            _buildInfoField(
              label: "Phone Number",
              controller: _phoneController,
              icon: Icons.phone_outlined,
              isEditing: _isEditing,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 30),
            if (_isEditing)
              ElevatedButton.icon(
                icon: const Icon(Icons.save_outlined),
                label: const Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: _saveChanges,
              ),
            const SizedBox(height: 20),
            ListTile(
                leading: Icon(Icons.lock_outline, color: Theme.of(context).primaryColor),
                title: const Text('Change Password'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Navigate to Change Password page (Not Implemented)')),
                    );
                },
            ),
            ListTile(
                leading: Icon(Icons.notifications_outlined, color: Theme.of(context).primaryColor),
                title: const Text('Notification Preferences'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                     ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Navigate to Notification Preferences (Not Implemented)')),
                    );
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool isEditing = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      enabled: isEditing,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 16, color: isEditing ? Colors.black87 : Colors.grey[700]),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
        filled: true,
        fillColor: isEditing ? Colors.white : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: isEditing ? BorderSide(color: Theme.of(context).primaryColor) : BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: isEditing ? BorderSide(color: Colors.grey.shade400) : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder( // Style for when not editing
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}