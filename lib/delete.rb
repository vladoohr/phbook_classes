#!usr/bin/ruby -w

class Delete
	def delete
		results = Array.new
		print "Type name, phone or email>"
		delete = gets.chomp

		File.open("#{File.dirname(__FILE__)}/../phonebook.txt", "r+") do |aFile|
			aFile.each {|line| results.push(line) if ( line =~ %r{#{delete}} )} 
		end

		puts "There are #{results.size} contacts"
		results.each_with_index do |result, index|
			puts "[#{index + 1}] #{result}"
		end

		print "Enter the number of entry to be deleted:"
		entry_for_delete = gets.chomp
		contact_for_delete = results.at(entry_for_delete.to_i - 1)
		lines = File.readlines("#{File.dirname(__FILE__)}/../phonebook.txt")
		lines.each do |line| 
			lines.delete(contact_for_delete)
		end
		File.open("#{File.dirname(__FILE__)}/../phonebook.txt", "w") do |aFile|
			lines.each {|line| aFile.puts line} 
		end
	end
end