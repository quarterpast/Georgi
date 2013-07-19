{map,concat-map,empty,reject,filter,drop,lines,words,unwords} = require \prelude-ls

require! {
	fs
	"./functions".compose
	"./trees".sprout
	"./trees".plant
}

if process.argv.length > 2
	read-words = compose do
		map (.to-lower-case!) . (fs.read-file-sync _, \utf8)
		concat-map words
		concat-map lines
		reject empty
		filter (== /[a-z]/i)

	tree = process.argv
	|> drop 2
	|> read-words
	|> plant

	[1 to Math.floor Math.random!*10]
	|> concat-map -> sprout tree
	|> unwords
	|> console.log
else console.log "Usage: #{process.argv.1} ...files"