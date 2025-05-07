import 'package:flutter/widgets.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SearchTextField(),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: Center(
              child: Text(
                'No results yet. Start typing...',
              ),
            ),
          )
        ],
      ),
    );
  }
}
