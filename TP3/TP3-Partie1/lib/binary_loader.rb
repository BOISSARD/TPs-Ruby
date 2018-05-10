# encoding: UTF-8

class BinaryLoader

	def initialize (fi)
		@file = fi
	end
	
	attr_reader :file
	
	def lire_fichier
		puts "Lecture du fichier : \"#{file}\"."
		creatures = []
		File.open(file,'rb') do |f|
			f.read(127)
			while !(raw_creature = f.read(57)).nil? && raw_creature.size == 57
				raw_name, race, hp, gold = raw_creature.unpack('A50CsL')
				name, tribe = raw_name.force_encoding(Encoding::UTF_8).split("/")
				creatures << Creature.new(name:name, tribe:tribe, race:race, hp:hp, gold:gold)
			end
		end
		creatures
	end
	
	
end
