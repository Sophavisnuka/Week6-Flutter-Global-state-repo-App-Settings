import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_mvvm/ui/states/settings_state.dart';
 
import '../../../data/repositories/songs/song_repository.dart';
import '../../../model/songs/song.dart';
import '../../states/player_state.dart';
import '../../theme/theme.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the global song repository
    SongRepository songRepository = context.read<SongRepository>();
    List<Song> songs = songRepository.fetchSongs();

    // 3 - Watch the global player state
    PlayerState playerState = context.watch<PlayerState>();
    AppSettingsState settingsState = context.watch<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => SongTile(
                song: songs[index],
                isPlaying: playerState.currentSong == songs[index],
                onTap: () {
                  playerState.start(songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    PlayerState state = context.watch<PlayerState>();
    return ListTile(
      onTap: onTap,
      title: Row(
        children: [
          Text(song.title),
          SizedBox(width: 5,),
          Text(isPlaying ? "Playing": "", style: TextStyle(fontSize: 15 , color: Colors.red),)
        ],
      ),
      trailing: isPlaying ? ElevatedButton(
        onPressed: () {
          state.stop();
        }, 
        child:Icon(
          Icons.stop_circle, size: 20, color: Colors.red,
        )
      ): Text("")
    );
  }
}
