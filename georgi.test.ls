require! "buster-minimal"
buster = new buster-minimal
{expect,assert,refute} = buster.assertions
{words} = require "prelude-ls"

{plant,sprout} = require "./lib"

buster.add-case "Markov" {
	"plants trees": ->
		expect plant [\a \b] .to-match a:b:1
		expect plant [\a \c] .to-match a:c:1
		expect plant [\a \b \a \b] .to-match {a:{b:2}, b:{a:1}}
	"breaks at full stops"
		expect plant <[hello world. hello there]> .to-match hello:{world:1,there:1}
}

buster.run!