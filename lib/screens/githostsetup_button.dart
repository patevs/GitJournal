import 'package:flutter/material.dart';
import 'package:journal/analytics.dart';

class GitHostSetupButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final String iconUrl;

  GitHostSetupButton({
    @required this.text,
    @required this.onPressed,
    this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (iconUrl == null) {
      return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button,
          ),
          color: Theme.of(context).primaryColor,
          onPressed: this._onPressedWithAnalytics,
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: RaisedButton.icon(
          label: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button,
          ),
          icon: Image.asset(iconUrl, width: 32, height: 32),
          color: Theme.of(context).primaryColor,
          onPressed: this._onPressedWithAnalytics,
        ),
      );
    }
  }

  void _onPressedWithAnalytics() {
    print("githostsetup_button_click " + text);
    getAnalytics().logEvent(
      name: "githostsetup_button_click",
      parameters: <String, dynamic>{
        'text': text,
        'icon_url': iconUrl == null ? "" : iconUrl,
      },
    );
    onPressed();
  }
}
