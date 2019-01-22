class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    i = ""

    while i != "exit"

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      i = gets.chomp

      case i
      when "list songs"
        list_songs
      end

      def list_songs
        Song.all.sort do |a, b|
          a.name <=> b.name
        end.each.with_index(1) do |song, index|
          puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end

      def list_artists
          Artist.all.sort do |a, b|
            a.name <=> b.name
          end.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist.name}"
          end
      end

      def list_genres
        Genre.all.sort do |a, b|
          a.name <=> b.name
        end.each.with_index(1) do |genre, index|
          puts "#{index}. #{genre.name}"
        end
      end

      def list_songs_by_artist(name)

      end


    end

  end

end
