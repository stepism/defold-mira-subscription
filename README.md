# MiraSubsctiption.

For more info, see subscription-sample.script.

# How to Start

Add https://github.com/stepism/defold-mira-subscribe/archive/master.zip as a dependency in your game.project file.
Fetch library using the main menu: Project -> Fetch Libraries.
Enable the module adding local subscription = require("miraSubscribe.subscribe") at the beginning of your script.



# USAGE
```
local subscription = require("miraSubscription.subscription")


function init(self)

	-- subscribe
	self.subscribe_id = subscription.subscribe(".", msg.url())
	

	-- notifycation
	subscription.notify(".", hash("setup"), {text = "hello"})


end

function final(self)
	subscription.remove(".", self.subscribe_id)
end

function on_message(self, message_id, message, sender)
	if message_id == hash("setup") then
		print(message.text)
	end
end

```

