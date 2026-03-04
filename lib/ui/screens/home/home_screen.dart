import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_mvvm/data/repositories/songs/song_repository.dart';
import 'package:week6_mvvm/model/songs/song.dart';
import 'package:week6_mvvm/ui/states/player_state.dart';
import 'package:week6_mvvm/ui/states/settings_state.dart';
import 'package:week6_mvvm/ui/theme/theme.dart';
import 'package:week6_mvvm/ui/widgets/song_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SongRepository songRepository = context.watch<SongRepository>();
    PlayerState playerState = context.watch<PlayerState>();
    AppSettingsState settingsState = context.watch<AppSettingsState>();
    List<Song> songs = songRepository.fetchSongs();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        children: [
          Text('Your recent songs', style: AppTextStyles.label,),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongTile(
                  song: songs[index], 
                  isPlaying: playerState.currentSong == songs[index], 
                  onTap: () {
                    playerState.start(songs[index]);
                  }
                );
              },
            ),
          ),
          SizedBox(height: 15,),
          Text('You might also like', style: AppTextStyles.label,),
          SizedBox(height: 15,),
          // Expanded(
          //   child: ListView.builder(

          //   ),
          // )
        ],
      ),
    );
  }
}