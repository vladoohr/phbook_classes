#!usr/bin/ruby -w

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

class Phonebook

	@@available_actions = Array["create", "delete", "search", "list", "quit", "help"]
	def start
		command = ARGV[0]
		if ( command )
			resolve(command)
		else
			welcome
			dispatch
		end
	end
	def welcome
		num_contacts = File.readlines("#{File.dirname(__FILE__)}/../phonebook.txt").size
		puts "Welcome to PhoneBook Application!\nYou have #{num_contacts} contacts in your phonobook"
	end

	def prompt
		puts "Please choose action: create, delete, search, list, quit, help?"
		print "phb>"
		value = gets.chomp
		return value
	end

	def dispatch
		action = prompt
		resolve(action)
	end

	def resolve(action)
		unless ( @@available_actions.include?(action) )
			puts action + " is not a regular action!"
			prompt
		end 
		create_obj = action.slice(0,1).capitalize + action.slice(1..-1).to_s
		require "#{action}"
		obj = Object.const_get("#{create_obj}").new
		obj.method(action).call
		self.dispatch
	end

end

phbook = Phonebook.new
phbook.start