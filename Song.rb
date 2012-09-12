#!/usr/bin/ruby
class Song
	@@plays=0
	attr_reader :name, :artist, :duration, :plays
	attr_writer :name, :artist, :duration
	def initialize(name,artist,duration)
		@name=name;
		@artist=artist;
		@duration=duration;
		@plays=0
	end
	
	def duration_in_minutes
		@duration/60.0
	end

	def play
		@plays+=1
		@@plays+=1
		"This song #{@plays} plays, Total plays: #{@@plays}"
	end

	def duration_in_minutes=(new_duration)
		@duration=(new_duration*60).to_i
	end

	def to_s
		"Song: #{@name} by #{@artist}, Duration: #{@duration}"
	end
end

class RockSong < Song
	attr_reader :amperage
	attr_writer :amperage
	def initialize(name,artist,duration,amperage)
		super(name,artist,duration)
		@amperage=amperage
	end

	def to_s
		super + ", Amperage: #{@amperage}"
	end
end

class SongList
	MAX_TIME=4*60

	def SongList.is_too_long(song)
		return song.duration>MAX_TIME
	end
end

class MyLogger
	private_class_method :new 
	@@logger=nil
	def MyLogger.create
		@@logger=new unless @@logger
		@@logger
	end
end

song = Song.new("Ruby","Cake", 240)
puts song
rockSong = RockSong.new("Make a Sound", "Autopilot Off", 348,11)
puts rockSong
puts "Old Duration: #{rockSong.duration}"
puts "Changing Duration to 244"
rockSong.duration = 244
puts "New Duration: #{rockSong.duration}"
puts "Duration in minutes: #{rockSong.duration_in_minutes}"
puts "Changing Duration in minutes: 4.22"
rockSong.duration_in_minutes=3.5
puts "New Duration: #{rockSong.duration}"

if SongList.is_too_long(rockSong)
	puts "#{rockSong.name} is too long"
else
	puts "Let's play #{rockSong.name}!"
end
