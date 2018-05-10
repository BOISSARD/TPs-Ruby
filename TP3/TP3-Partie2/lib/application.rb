# encoding: UTF-8

class Application

	def initialize ip
		@ip = ip
	end
	
	attr_reader :ip

	def run
		puts "Ping vers #{ip} ..."
		valTime = []
		IO.popen("ping -c 5 #{ip}") do |tube|
			tube.each_line do |line|
				puts line
				strTime = line.split("time=")[1]
				if !strTime.nil?
					valTime << strTime.split[0].to_f
				end
			end
		end
		puts valTime.to_s
		moyenne = (moyenne_tableau valTime).round 3
		puts "Moyenne de temps de communication avec #{ip} : #{moyenne} ms"
		File.open("recap.txt","a") do |file|
			file.puts "#{Time.now.ctime},#{ip},#{moyenne}"
		end
	end

	def moyenne_tableau tableau
		tableau.inject{|accu, val| accu + val}/tableau.size
	end
		
end
