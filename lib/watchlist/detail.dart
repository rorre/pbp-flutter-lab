import 'package:counter_7/model/watchlist.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

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
              child: widget.watchData.fields.releaseDate.toString(),
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
            FieldRow(
              title: "Review: ",
              child: widget.watchData.fields.review,
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
