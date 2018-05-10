# encoding: UTF-8

class Creature
	
	def initialize(name: ,tribe: , race: , hp: , gold: )
		@name = name
		@tribe = tribe
		if race.class == Fixnum
			@race = convert_race race
		else
			@race = race
		end
		@hp = hp
		@gold = gold
	end
	
	attr_accessor :name
	attr_accessor :tribe
	attr_accessor :race
	attr_accessor :hp
	attr_accessor :gold
	
	def to_s
		"Je suis #{name} de #{tribe}. Je suis un #{race} et j'ai une santé de #{hp} avec #{gold} pièce#{(gold>1)?"s":""} d'or"
	end
	
	def convert_race id
		case id
			when 0 then "Troll"
			when 1 then "Humain"
			when 2 then "Elfe"
			when 3 then "Vulcain"
			when 4 then "Wookie"
			when 5 then "Gobelin"
			else "Pas encore découvert"
		end
	end
	
end
