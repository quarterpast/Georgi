require! "buster-minimal"
buster = new buster-minimal
{expect,assert,refute} = buster.assertions
{words} = require "prelude-ls"

{plant,sprout} = require "./lib"

Object::to-string = -> JSON.stringify this # what could possibly go wrong

buster.add-case "Markov" {
	"plants trees": ->
		expect plant [\a \b] .to-equal a:b:1
		expect plant [\a \c] .to-equal a:c:1
		expect plant [\a \b \a \b] .to-equal {a:{b:2}, b:{a:1}}
	"breaks at full stops": ->
		expect plant <[hello world. hello there]> .to-equal hello:{'world.':1,there:1}
}

buster.run!