# Ruby Dataset

The program inteprets a CSV file to perform Calculations

This program is part of a introduction to ruby class.

It is designed with the intention of being used on Linux as it needs wget.

It can be changed with Ruby URI.

# Functions of the program:

Download

Calculate

	Sum

	Row Length

	Average

	Mean

	Meadian

	Mode

	Range

	Maximum

	Minimum

	Standard Deviation

	Z-score output to CSV

Lables

Output

	Column

	Value from column and row

Exit

# Assignment Details

Objective: Create a program that allows the user to input a csv file that contains a large data set. Mathematically analyze this data set to determine the mean, and standard deviation. Output a new csv file which shows the original data along with every data point’s z-score (or z-value) as an additional column.  
 

Selection of a Data Set: The data set must lend itself to statistical calculations like mean and standard deviation. These statistics must be relevant and important for that data set. For example you would not benefit by knowing the standard deviation for a data set containing the number of farm tractors in the State of Iowa between the years of 1955 and 2010. If you were a tractor company you would be more interested in the overall trend of tractor sales over time rather than the standard deviation of the data set. But data that gives the monthly average temperatures in various cities across the world over a 50 year period could benefit from such an analysis, if you were an environmental scientist trying to determine if 5 recent hot years are statistically significant in light of the last 50 years. In fact, weather is often a good source of relevant data. So is educational test data, which is probably one that you are most familiar with. Basically, data sets that involve the comparison of many values to each other (like standardized test scores) lend themselves nicely to standard deviation calculations. But data sets that look to illustrate trends over time are less likely to benefit from this. Stock market data is another example of something that you might choose to work with. Please, try to find something that is mildly interesting to you since you will be looking at it for quite a while. 
 

Procedure: There are several distinct steps involved with solving this problem. Here they are in no particular order:
Selecting and obtaining a data set
Understanding the nature of csv files
Reading a csv file into a Ruby script and getting it into a data container (array)
Learning how to calculate the mean and standard deviation in general
Learning what z-scores are
Implementing your standard deviation algorithm in Ruby (by manipulating the data contained in the array)
Outputting the results in a meaningful way, including a generation of a new csv file containing z-scores
 

TIPS FOR CLEANING DATA SETS

Because you will find that many of your imported data sets are "dirty" (have return and newline characters at the end of strings etc.) you will need to spend time writing code to clean your data and get it in a usable form. Here is an example of that process with code that you can use. Remember, when faced with a challenge like this, a good place to get information on how you can manipulate strings and arrays is the Ruby Documentation site which gives all available methods for String and Array classes. 

	s = ["5465,6784\n\r","5135,3584\n\r", "4465,2284\n\r"]
	#we need to clean this data set
	
	s = s.collect { |x| x.chomp.chomp }
	s = s.collect { |x| x.split(",") }
	
	#note the nesting of iterators below to do something to each element within each array within the big array
	s = s.collect do |inner_array|
	    inner_array.collect do |x|
	        x.to_f
	    end
	end

	puts s.inspect
Bonus Options: 
Generalize your program to work for any csv file. You would have to ask the user for the name of the file and the column that contains the data they want to analyze.
Allow the user to enter a url instead of a file path. (hint: open-uri)
Perform additional statistical operations on your data (medium, mode, etc...).
