import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';
import 'package:github_issue_manager/model/github_user_model.dart';
import 'package:github_issue_manager/model/issue_model.dart';
import 'package:github_issue_manager/view/molecules/search_bar.dart';
import 'package:github_issue_manager/view/organisms/issue_list.dart';
import 'package:github_issue_manager/view/pages/issue_tab/issue_detail_page.dart';

/// Screen: 検索画面
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索'),
      ),
      body: Column(
        children: [
          // 検索バー
          AppSearchBar(
            controller: _searchController,
            hintText: 'Issueを検索',
            onChanged: (value) {},
            onSubmitted: () {},
            onClear: () {},
          ),

          // 検索結果
          Expanded(
            // TODO ダミーデータを仮で表示
            child: _buildSearchResults(
              [
                IssueModel(
                    id: 123,
                    number: 11,
                    title: 'dummy issue',
                    body: 'This is dummy data.',
                    state: 'open',
                    user: const GitHubUserModel(id: 123, userName: 'aa', avatarUrl: '', htmlUrl: ''),
                    labels: [const LabelModel(id: 123, name: 'Label A', color: 'a78986')],
                    assignee: const GitHubUserModel(id: 123, userName: 'aa', avatarUrl: '', htmlUrl: ''),
                    createdAt: DateTime(2017, 9, 7, 17, 30),
                    updatedAt: DateTime(2026, 9, 7, 17, 30),
                    htmlUrl: '')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<IssueModel> results) {
    return Column(
      children: [
        // 結果件数
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: UIColorConst.background,
          child: Row(
            children: [
              Text(
                '${results.length}件の結果',
                style: UITextConst.bodySmall.copyWith(
                  color: UIColorConst.textSecondary,
                ),
              ),
            ],
          ),
        ),

        // Issue一覧
        Expanded(
          child: IssueList(
            issues: results,
            isLoading: false,
            onIssueTap: (issue) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => IssueDetailPage(issue: issue),
                ),
              );
            },
            onRefresh: () {},
          ),
        ),
      ],
    );
  }
}
