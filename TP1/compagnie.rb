
class Compagnie

	def initialize 
		@compagnie = []
	end
	
	attr_writer :compagnie
	attr_reader :compagnie
	
	def ajout (creature)
		if compagnie.none? {|creat| creat.nom == creature.nom}
			@compagnie << creature
			creature.compagnie= self
		else
			raise "#{creature.nom} deja present !"
		end
	end
	
	def supprimer(creature)
		compagnie.delete(creature)
	end
	
	def passer_premier(creature)
		self.supprimer(creature)
		compagnie.unshift creature
	end
	
	def echanger(creature1, creature2)
		pos1 = compagnie.index compagnie.find{|c| c.nom == creature1}
		pos2 = compagnie.index compagnie.find{|c| c.nom == creature2}
		compagnie[pos1], compagnie[pos2] = compagnie[pos2], compagnie[pos1]
	end
	
	def encaisserTous(degats)
		compagnie.each {|c| c.encaisser degats}
	end
	
	def kozysar
		degats = compagnie.reduce(0){ |nbPvTotal, creature| nbPvTotal + creature.nbPv }
		encaisserTous degats*0.15
	end
	
	def encaisserMultipleAttaque(nbfois, degats)
		nbfois.times do
			compagnie.first.encaisser degats
		end
	end
	
	def exploration 
		# 1 
		compagnie.first.encaisser 10
		# 3
		self.passer_premier compagnie.detect{|c| c.nom.downcase == "zak"}
		# 4
		echanger "Grok", "Gruk"
		# 5 
		compagnie[1].encaisser 14
		#6
		compagnie.min_by{|c| c.nbPv}.soigner 5
		#7
		encaisserTous 10
		# 8
		kozysar
		# 9
		compagnie.sort! {|a,b| b.nbPv <=> a.nbPv}
		# 10
		encaisserMultipleAttaque 5, 5
		# 11
		puts "\nApres exploration :\n-------------------"
		puts compagnie
		puts "Il y a #{compagnie.size} survivant(s) !"
		puts "#{compagnie.select{|c| c.nbPv >= 3}.size} survivants ont plus de 3 PV."
	end
	
end
