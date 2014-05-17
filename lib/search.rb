#!/usr/bin/ruby -w

class Search
	def search
		found_strings = Array.new
		print "Type name, phone or email>"
		search_string = gets.chomp

		File.open("#{File.dirname(__FILE__)}/../phonebook.txt", "r") do |aFile|
			aFile.each {|line| found_strings.push(line) if (line =~ %r{#{search_string}})}
		end
		
		puts "#{found_strings.length} contacts found!"
		found_strings.each {|line| puts line }
	end
end
