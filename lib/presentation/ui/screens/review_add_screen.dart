import 'package:flutter/material.dart';

class ReviewAddScreen extends StatelessWidget {
  const ReviewAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: const Text(
          "Create Review",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 32.0,),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "First Name",
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
            const SizedBox(height: 16.0,),
            TextFormField(
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Last Name",
                  hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
            const SizedBox(height: 16.0,),
            TextFormField(
              maxLines: 8,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "First Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  )
              ),
            ),
            const SizedBox(height: 16.0,),
           SizedBox(
               width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
