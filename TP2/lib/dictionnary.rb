# encoding: UTF-8

class Dictionnary

	def initialize(path)
		@path = path
		
		lireFichier
	end
	
	def lireFichier
		tab = File.readlines(path)
		
		tab.each do |mot| 
		end
		
		@reference = Hash.new
		tab.each do |item|
			word = item.strip
			key = trieLettreString word
			unless reference.has_key? key
				reference[key] = []
			end
			reference[key] << word
		end
	end
	
	def trieLettreString(mot)
		accentsA = ['à','â']
		accentsE = ['é','è','ê']
		if accentsA.any? {|accent| mot.include? accent}
			retour = mot.gsub(/[àâ]/,'a')
		elsif accentsE.any? {|accent| mot.include? accent}
			retour = mot.gsub(/[èéê]/,'e')
		else
			retour = mot
		end
		retour.chars.sort.join
	end
	
	def anagram_of(word)
		key = trieLettreString word
		if reference.has_key? key
			collecTo_s reference[key]
		else []
		end
	end
	
	def affichage
		reference.each do |index, item|
			puts "#{index} => #{collecTo_s item}"
		end
	end
	
	def affichageParLettre (lettre)
		puts lettre
		reference.each do |index, item|
			if item.any? {|a| a[0] == lettre}
				puts "#{index} => #{collecTo_s item}"
			end
		end
	end
	
	def collecTo_s (collection)
		collection.inject([]) {|accu, i| accu << i }
	end
	
	private
	attr_reader :path
	attr_reader :reference
	
end
