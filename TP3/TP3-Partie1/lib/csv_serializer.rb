# encoding: UTF-8

class CSVSerializer

	def initialize (fi)
		@file = fi
	end
	
	attr_reader :file
	
	def ecrire_fichier creatures
		File.open(file,"w") do |f|
			creatures.each do |c|
				f.puts "#{c.name}, #{c.tribe}, #{c.race}, #{c.hp}, #{c.gold}"
			end
		end
	end

end
