
class Creature

	def initialize (nom,nbPv)
		@nom = nom
		@nbPv = nbPv
	end
	
	attr_writer :nom
	attr_reader :nom

	def nbPv= (nbPv)
		@nbPv = nbPv
	end
	
	def nbPv 
		@nbPv
	end
	
	def compagnie= (comp)
		@compagnie = comp
	end
	
	def compagnie 
		@compagnie	
	end
	
	def encaisser (degats)
		@nbPv -= degats
				
		if (nbPv <= 0) && compagnie
			compagnie.supprimer(self)
			compagnie= nil
		end
	end
	
	def soigner (soin)
		@nbPv += soin
	end

	def to_s 
		"Je suis #{nom} et j'ai #{nbPv.round(3)} points de vie et je suis un #{self.class.to_s.downcase}."
	end
	
end
