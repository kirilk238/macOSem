import 'package:flutter/material.dart';

class CustomerCarePage extends StatelessWidget {
  const CustomerCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Care')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Contact Us',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text('support@moissanitejewelry.com'),
              subtitle: Text('Email for support'),
            ),
            const ListTile(
              leading: Icon(Icons.phone_outlined),
              title: Text('+1 (800) 555-JEWEL'),
              subtitle: Text('Call us (Mon-Fri, 9am-5pm EST)'),
            ),
            const Divider(height: 30, thickness: 1),
            Text(
              'Frequently Asked Questions (FAQ)',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFaqItem(
              context,
              question: 'What is Moissanite?',
              answer:
                  'Moissanite is a naturally occurring silicon carbide and its various crystalline polymorphs. It has the chemical formula SiC and is a rare mineral, discovered by the French chemist Henri Moissan in 1893. Moissanite is used as a diamond simulant in jewelry due to its hardness, optical properties, and lower price point.',
            ),
            _buildFaqItem(
              context,
              question: 'How do I care for my Moissanite jewelry?',
              answer:
                  'Moissanite can be cleaned with mild soap and water, using a soft toothbrush. You can also use commercial jewelry cleaners. It is very durable and resistant to scratching.',
            ),
            _buildFaqItem(
              context,
              question: 'What is your return policy?',
              answer:
                  'We offer a 30-day return policy for unworn items in their original packaging. Please visit our website or contact support for more details on initiating a return.',
            ),
            const Divider(height: 30, thickness: 1),
            Text(
              'Shipping Information',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.local_shipping_outlined),
              title: Text('Standard Shipping: 5-7 business days'),
            ),
            const ListTile(
              leading: Icon(Icons.airplanemode_active_outlined),
              title: Text('Express Shipping: 2-3 business days'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    return ExpansionTile(
      iconColor: Theme.of(context).primaryColor,
      collapsedIconColor: Colors.grey[700],
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(answer, style: TextStyle(color: Colors.grey[700])),
        ),
      ],
    );
  }
}
