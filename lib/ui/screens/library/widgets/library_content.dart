import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_mvvm/data/repositories/songs/song_repository.dart';
import 'package:week6_mvvm/model/songs/song.dart';
import 'package:week6_mvvm/ui/states/player_state.dart';
import 'package:week6_mvvm/ui/states/settings_state.dart';
import 'package:week6_mvvm/ui/theme/theme.dart';
import 'package:week6_mvvm/ui/widgets/song_tile.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {

    SongRepository songRepository = context.read<SongRepository>();
    List<Song> songs = songRepository.fetchSongs();

    PlayerState playerState = context.watch<PlayerState>();
    AppSettingsState settingsState = context.watch<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16,),
          Text('Library', style: AppTextStyles.heading,),
          SizedBox(height: 50,),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongTile(
                  song: songs[index],
                  isPlaying: playerState.currentSong == songs[index],
                  onTap: () {
                    playerState.start(songs[index]);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}