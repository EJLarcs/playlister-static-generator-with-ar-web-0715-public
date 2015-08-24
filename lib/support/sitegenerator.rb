
require 'pry'
class SiteGenerator

    attr_reader :rendered_path

    def initialize(rendered_path)
      @rendered_path = rendered_path
    end

    def build_index
      FileUtils.mkdir_p(@rendered_path) unless Dir.exists?(@rendered_path)
        #file utility library - google stackoverflow!
      template = File.read('app/views/index.html.erb')
      # binding.pry
      File.open(@rendered_path + "/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}

    end

    def build_artists_index
    FileUtils.mkdir_p("#{@rendered_path}/artists") unless Dir.exists?("#{@rendered_path}/artists")

      template = File.read('app/views/artists/index.html.erb')
      File.open(@rendered_path + "/artists/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}
    end

    def build_artist_page
    FileUtils.mkdir_p("#{@rendered_path}/artists") unless Dir.exists?("#{@rendered_path}/artists")
        template = File.read('app/views/artists/show.html.erb')
        Artist.all.each do  |artist|
          @artist = artist
          File.open(@rendered_path + "/artists/#{artist.to_slug}.html", "w+"){ |f| f.write ERB.new(template).result(binding)}
        end
    end

    def build_genres_index
      FileUtils.mkdir_p("#{@rendered_path}/genres") unless Dir.exists?("#{@rendered_path}/genres")
      template = File.read('app/views/genres/index.html.erb')
      File.open(@rendered_path + "/genres/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}
    end

    def build_genre_page
          FileUtils.mkdir_p("#{@rendered_path}/genres") unless Dir.exists?("#{@rendered_path}/genres")
      template = File.read('app/views/genres/show.html.erb')
      Genre.all.each do |genre|
        @genre=genre
        File.open(@rendered_path + "/genres/#{genre.to_slug}.html", "w+") { |f| f.write ERB.new(template).result(binding)}
      end
    end

    def build_songs_index
          FileUtils.mkdir_p("#{@rendered_path}/songs") unless Dir.exists?("#{@rendered_path}/songs")
      template = File.read('app/views/songs/index.html.erb')
      File.open(@rendered_path + "/songs/index.html", "w+") { |f| f.write ERB.new(template).result(binding)}
    end

    def build_song_page
          FileUtils.mkdir_p("#{@rendered_path}/songs") unless Dir.exists?("#{@rendered_path}/songs")
        template = File.read('app/views/songs/show.html.erb')
        Song.all.each do |song|
          @song = song
          File.open(@rendered_path + "/songs/#{song.to_slug}.html", "w+") { |f| f.write ERB.new(template).result(binding)}
        end
    end

end

#remeber to put sufficient slashes!!
#must capitalise and make singular
#remember to write ERB in your block when File.open if you choose to do this all in one stage!!!
