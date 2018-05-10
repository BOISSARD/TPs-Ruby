# encoding: UTF-8

class Application
	def initialize(dictio)
		@dictionnaries = []
		dictio.map do |i|
			begin
				dictionnaries << Dictionnary.new("#{CURRENT}/#{i}")
				puts "Le dictionnaire \"#{i}\" a été ajouté à la base."
			rescue
				puts "Le dictionnaire \"#{i.split("/").last}\" n'existe pas !"
			end
		end
		
		if dictionnaries.nil?
			raise "Il n'y a pas de dictionnaires"
		end
	end
	
	attr_reader :dictionnaries
	
	def run
		loop do
			puts "Rechercher les anagrammes d'un mot ou (:quit/:all/:letter [Letter]) :"
			break if (rentre = $stdin.gets.strip.downcase) == ":quit"
			if rentre == ":all"
				afficherDictionnaires
				next
			end
			if rentre.split(" ")[0] == ":letter" && !rentre.split(" ")[1].nil?
				afficherDictionnairesParLettre rentre.split(" ")[1].downcase
				next
			end
			afficherTableau (anagram_of rentre)
		end
	end
	
	def anagram_of(word)
		puts "Les anagrammes de #{word} sont :"
		dictionnaries.inject([]) do |accu, dictio|
			accu | (dictio.anagram_of word)
		end
	end
	
	def afficherDictionnaires
		puts "Tous les mots du dictionnaire :"
		dictionnaries.each do |dictio|
			dictio.affichage
		end
	end
	
	def afficherDictionnairesParLettre (lettre)
		puts "Tous les mots du dictionnaire commençant par #{lettre.upcase} :"
		dictionnaries.each do |dictio|
			dictio.affichageParLettre lettre
		end
	end
	
	def afficherTableau (tableau)
		puts tableau.inject(""){|accu, item| "#{accu}#{item} "}
	end
	
end
