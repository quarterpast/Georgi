{head,last,reject,fold,Obj,sum,values,replicate,unfoldr} = require \prelude-ls
require! {
	"./functions".compose
	"./lists".pairs
	"./weights".weighted-random
}

# branches: Map String (Map String Number) -> [[String]] -> Map String (Map String Number)
export branches = (tree,pair)->
	new-tree = {} import tree
	if head pair of tree
		if last pair of tree[head pair]
			new-tree[head pair][last pair] = tree[head pair][last pair] + 1
		else
			new-tree[head pair][last pair] = 1
	else
		new-tree[head pair] = (last pair):1
	return new-tree

# plant: [String] -> Map String (Map String Number)
export plant = compose do
	pairs
	reject ((is '.') . last . head) # the ends of sentences
	fold branches,{}

# sprout: Map String (Map String Number) -> [String]
export sprout = (tree)->
	tree
	|> Obj.map (sum . values)
	|> weighted-random
	|> unfoldr ->
		if weighted-random tree[it]
			replicate 2 that # twice so it's the next item in the output and also the seed for the next unfoldr
		else null # the end of a chain