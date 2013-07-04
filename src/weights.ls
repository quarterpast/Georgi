{concat,replicate} = require \prelude-ls
{rand-elm} = require "./lists"

# counts-to-list: Map String Number -> [String]
export counts-to-list = (stats)->
	concat [replicate count,val for val,count of stats]

# weighted-random: Map String Number -> String
export weighted-random = rand-elm . counts-to-list