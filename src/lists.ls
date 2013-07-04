{take,tail} = require \prelude-ls
{floor,random} = Math

# in-groups-of: Number -> [x] -> [[x]]
export in-groups-of = (n,xs)-->
	| xs.length < n => []
	| otherwise     => [take n, xs] ++ in-groups-of n, (tail xs)

# pairs: [x] -> [[x]]
export pairs = in-groups-of 2

# rand-elm: [String] -> String
export rand-elm = (list)->
	list[floor list.length*random!]