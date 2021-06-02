import 'package:flutter/material.dart';

class EpisodeButton extends Padding{
  EpisodeButton({
    Color color = Colors.black,
    required VoidCallback onPressed,
    required episodeNumber,
  })
      :super(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      child: SizedBox(
        child: Text("EP " + episodeNumber.toString(),
          style: TextStyle(
            color: Color(0xFFDEDEDE),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF434343),
      ),
    ),
  );
}
