import 'package:counter_7/model/watchlist.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class FieldRow extends StatelessWidget {
  const FieldRow({super.key, required this.title, required this.child});

  final String title;
  final String child;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: child),
        ],
      ),
    );
  }
}

class WatchDetailPage extends StatefulWidget {
  const WatchDetailPage({super.key, required this.watchData});

  final WatchList watchData;

  @override
  State<WatchDetailPage> createState() => _WatchDetailPageState();
}

class _WatchDetailPageState extends State<WatchDetailPage> {
  @override
  Widget build(BuildContext context) {
    final releaseDate = widget.watchData.fields.releaseDate;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const LabDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.watchData.fields.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            FieldRow(
              title: "Release Date: ",
              child:
                  "${months[releaseDate.month]} ${releaseDate.day}, ${releaseDate.year}",
            ),
            const SizedBox(height: 16.0),
            FieldRow(
              title: "Rating: ",
              child: '${widget.watchData.fields.rating}/5.0',
            ),
            const SizedBox(height: 16.0),
            FieldRow(
              title: "Status: ",
              child:
                  widget.watchData.fields.watched ? "Watched" : "Not Watched",
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Review:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.watchData.fields.review,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Back"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
