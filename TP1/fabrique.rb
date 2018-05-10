=begin
require_relative 'gobelin'
require_relative 'compagnie'
require_relative 'troll'
=end

class Fabrique

	def self.lireFichier(nom)
		file = File.open(nom)
		comp = Compagnie.new
		file.each_line do |line|
			donnees = line.scan /\w+/
			case donnees[0].downcase
				when "troll" then comp.ajout(Troll.new(donnees[1],donnees[2].to_i))
				when "gobelin" then comp.ajout(Gobelin.new(donnees[1],donnees[2].to_i))
			end
		end
		comp
	end

end
