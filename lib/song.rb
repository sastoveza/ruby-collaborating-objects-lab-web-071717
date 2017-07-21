class Song
	attr_accessor :name, :artist

	def initialize(name)
		@name = name 
		@artist = artist
	end

	def artist_name(name)
		@artist = Artist.find_or_create_by_name(name)
		@artist.add_song(self)
	end



	def self.new_by_filename(file)
		song = file.split(" - ")[1]
		artist = file.split(" - ")[0]
		new_song = self.new(song)
		new_song.artist = Artist.find_or_create_by_name(artist)
		new_song.artist.add_song(new_song)
		new_song
	end
end