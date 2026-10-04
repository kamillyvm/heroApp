import 'package:flutter/material.dart' hide Hero;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../data/repository/hero_repository_impl.dart';
import '../../domain/hero.dart';
import '../widgets/hero_card.dart';
import 'agent_detail_page.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  static const int _pageSize = 20;

  static const Color _background = Color(0xFF080808);
  static const Color _pink = Color(0xFFFF0054);
  static const Color _secondaryText = Color(0xFF9E9E9E);

  late final HeroRepositoryImpl _repo;

  late final PagingController<int, Hero> _pagingController =
      PagingController<int, Hero>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _repo = context.read<HeroRepositoryImpl>();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _repo.getHeroes(
        page: pageKey,
        limit: _pageSize,
      );

      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        _pagingController.appendPage(
          newItems,
          pageKey + 1,
        );
      }
    } catch (error, stack) {
      debugPrint('FETCH PAGE ERROR: $error');
      debugPrint('STACKTRACE: $stack');
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: _background,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xFF262626),
            width: 1,
          ),
        ),
        title: const Row(
          children: [
            Icon(
              Icons.group_rounded,
              color: _pink,
              size: 22,
            ),
            SizedBox(width: 9),
            Text(
              'AGENTES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
      body: PagedListView<int, Hero>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Hero>(
          itemBuilder: (context, hero, index) {
            return HeroCard(
              hero: hero,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AgentDetailPage(hero: hero),
                ),
              ),
            );
          },
          firstPageErrorIndicatorBuilder: (context) =>
              _buildErrorWidget(),
          noItemsFoundIndicatorBuilder: (context) =>
              _buildEmptyWidget(),
          firstPageProgressIndicatorBuilder: (context) =>
              _buildLoading(),
          newPageProgressIndicatorBuilder: (context) =>
              const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(
                color: _pink,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: _pink,
            ),
            SizedBox(height: 16),
            Text(
              'Carregando agentes...',
              style: TextStyle(
                color: _secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              color: _pink,
              size: 58,
            ),
            const SizedBox(height: 16),
            const Text(
              'Não foi possível carregar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Verifique sua conexão e tente novamente',
              style: TextStyle(
                color: _secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _pagingController.refresh(),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Tentar novamente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _pink,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return const Center(
      child: Text(
        'Nenhum herói encontrado',
        style: TextStyle(
          color: _secondaryText,
        ),
      ),
    );
  }
}