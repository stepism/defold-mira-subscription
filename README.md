# mira.state.
hierarchical state machine.

For more info, see substate-sample.script.

# How to Start

Add https://github.com/stepism/defold-mira-cache/archive/master.zip as a dependency in your game.project file.
Fetch library using the main menu: Project -> Fetch Libraries.
Enable the module adding local mira_cache = require("miraCache.cache") at the beginning of your script.



# USAGE
```
local mira_cache = require("miraCache.cache")

function init(self)
	self.cache = mira_cache.new()

	-- set
	self.cache.set("atk", 10)
	self.cache.set("def", 20)
	self.cache.dump()

	local atk = self.cache.get("atk")
	print("atk " .. atk)

	-- contains
	if self.cache.contains("atk") then
		print("The key exists.")
	end
	
	-- remove
	self.cache.remove("atk")
	self.cache.dump()

	-- clear
	self.cache.clear()
	self.cache.dump()

	-- getonce
	self.cache.set("speed", 50)
	local speed = self.cache.get_once("speed")
	print("speed " .. speed)

	if self.cache.contains("speed") then
		print("The key exists.")
	else
		print("The key does not exist.")
	end

	

end

```

