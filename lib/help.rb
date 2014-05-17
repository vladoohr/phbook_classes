#!/usr/bin/env ruby -wKU

class Help
	def help
		print <<"EOF";
    	ruby phbook.pl action

    	Action:
    	create - create contact
    	search - search a contact
    	delete - delete contact
    	list   - list all
    	quit   - exit this application  
    	help   - option that shows available actions
EOF
	end
end