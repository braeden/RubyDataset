
#Needs to run on linux or a machine with wget

require 'descriptive_statistics'
#gem install descriptive_statistics
#Does all the stat work
require 'csv'
#used for CSV 
require 'colorize'
#gem install colorize
#Colors some of the text

begin
	loop {
		puts "Enter: Download, Calc, Lables, Output, Zscore, Exit"
		ans = gets.chomp
		case ans.downcase
		when 'download'
			puts "Please enter the URL for a csv file"
			url=gets.chomp
			#Wget includes -O and - flag to insure the removal of shell injection attack

			`wget -O array.csv #{url} -A csv`
			#Comment out this line on windows
			#Will error without wget

			puts "Downloaded as array.csv in current directory".green
		when 'calc'

			puts "Please enter the row"
			a = gets.chomp.to_i
			a = a - 1
			#Offset by 1 to cancel row 0
			out = []
			#Define array "out"

			filename = 'array.csv'
			CSV.foreach(filename, :col_sep => ",", :return_headers => false) do |row|
	  			out << row[a].to_f
			end
			#Loop through, seperate colums by comma


			out = out.drop(1)
			#deletes label row
			out = out.map(&:to_i)
			#Converts array to int
			sum = out.reduce(:+).to_f 
			#adds all
			len = out.length
			puts "Note: If values are zero, row may be past the range"
			puts ""
			puts "Sum: " + sum.to_s
			puts "Row Length: " + len.to_s
			fin = sum/len
			puts "Average: " + fin.round(3).to_s
			med = out.median
			puts "Median: " + med.to_s
			mode = out.mode
			puts "Mode: " + mode.to_s
			rang = out.range
			puts "Range: " + rang.to_s
			min = out.min
			puts "Minimun: " + min.to_s
			max = out.max
			puts "Maximum: " + max.to_s
			ans = out.standard_deviation
			puts "Standard Deviation: " + ans.round(3).to_s
			puts ""
			#Will return 0.0 if not a valid row
		when 'lables'
			lables = File.open('array.csv', &:readline)
			#Read Line 1
			puts lables
		when 'output'
			puts "Please enter the row"
			a = gets.chomp.to_i

			a = a - 1
			#Offset by 1 to cancel row 0
			out = []
			#Define array "out"

			filename = 'array.csv'
			CSV.foreach(filename, :col_sep => ",", :return_headers => false) do |row|
	  			out << row[a].to_f
			end
			puts "Please enter a line to fetch"
			x = gets.chomp.to_i
			fin = out.fetch(x, "ERROR: Please enter a number in the valid range".yellow)
			puts fin

		when 'zscore'
			puts "Please enter the row"
			a = gets.chomp.to_i

			a = a - 1
			#Offset by 1 to cancel row 0
			out = []
			#Define array "out"

			filename = 'array.csv'
			CSV.foreach(filename, :col_sep => ",", :return_headers => false) do |row|
	  			out << row[a].to_f
			end
			out = out.drop(1)
			#deletes label row
			out = out.map(&:to_i)
			#Converts array to int
			sum = out.reduce(:+).to_f 
			#adds all
			len = out.length
			aver = sum/len
			stdd = out.standard_deviation

			fin = []
			#Define array to store z score
			out.each do |x|
				c = (x-aver.to_i)/stdd
				#Z score Formula
				fin << c.round(3)	
				#add values to array rounded to 3 points		
			end
			puts "Enter: 'Line' to see line zscore OR 'Save' to save as csv file OR 'Exit' to escape"
			ans = gets.chomp
			case ans.downcase
			when 'line'
				puts "Please enter a line to fetch"
				x = gets.chomp.to_i
				lin = fin.fetch(x, "ERROR: Please enter a number in the valid range".yellow)
				puts lin
			when 'save'
				require 'csv'
				CSV.open("zscores.csv", "w") do |csv|
				  csv << fin
				end
				puts "Saved as zscores.csv in current directory".green
				puts ""
			#Every other command will exit
			end
		when 'exit'
			puts "DONE".green
			exit
		else
			puts "ERROR: Please enter valid commands only".yellow
		end
	}
rescue
	#To catch exception
	puts ""
	puts "ERROR: Program has crashed, exception details below".red
	puts ""
	puts $!, $@
	puts ""
	puts "QUITING!".red
end
#Braeden Smith 3/24/15

