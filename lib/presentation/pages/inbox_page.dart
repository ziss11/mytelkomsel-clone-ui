import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Inbox Page",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
