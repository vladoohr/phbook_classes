#!usr/bin/ruby -w

class List
	def list
		puts "Contacts:"
		IO.foreach("#{File.dirname(__FILE__)}/../phonebook.txt"){|line| puts line}
		puts
	end
end