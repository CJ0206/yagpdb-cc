# Suggestions Channel

This is custom code for [YAGPDB](https://yagpdb.xyz/) which will take a users suggestion, turn it into custom embed, and add voting buttions within a defined [Discord](https://discord.com/) channel. We'll also look at deleting anything else posted to the suggestions channel when setting up the bot.

## Setting up the bot

Go to the cutom commnads tab in your [YAGPDB](https://yagpdb.xyz/) dashboard, I suggest creating a group called something like `Suggestions` to keep things in nice groups.
- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Command (mention/cmd prefix)` and decide on your trigger, in our example we will use `suggest`
- Copy the code from the [Suggestions](https://github.com/CJ0206/yagpdb/blob/main/Suggestions/Suggetions.lua) file and paste it into `Response`
- Set `Channel/User role restrictions` to `Only run in the following channels` and select your suggestions channel
- Save

If you would like to automatically delete anything which isn't a suggestion from the channel:
- Go to `Automoderator V2` tab in your [YAGPDB](https://yagpdb.xyz/) dashboard
- Under `Create a new ruleset` name it `Suggestions` and click `Create`
- Navigate to the new `Suggestions` tab, under `Create a new rule` type `Suggestions` and click `Create`
- Set `Type` to `Message matches regex` and type `.*` in `Regex`
- Set `Conditions` to `Active is channels` and select your suggestions channel
- Also add `Ignore roles` and select the bots role, and anyone else you want to be able to post things other than suggestions
- Set `Effects` to `Delete Message` and save

## Customising the code
The first thing we must do is replace the channelID with the channelID of your suggestions channel on line 2:
```
{{$channel :=731156498390057040}}
```

You can also change the suggestions submitted successfully message on line 5:
```
Suggestion submitted.
```

If someone makes a mistake you can remind them how to submit a suggestion on line 18:
```
Correct usage: -suggest <suggestion>
```

If you would like to use differnt emojis just change the emojiID's (`upvote:524907425531428864` and `downvote:524907425032175638`, make sure to keep them between the `""`), or add more option on line 15:
;
```
{{addMessageReactions $channel $id "upvote:524907425531428864" "downvote:524907425032175638" }}
```

We can edit the time (`5` = 5 seconds) the submitted successfully/reminder notification appears for on line 22:
```
{{deleteResponse 5}}
```

The last configerable part of this code is not really necessary if the bot has been set up to delete everything whis is not a suggestion from the channel, unless someone you have whitelisted submits a suggestion. Similar to line 22 deleting the bots response, we can edit the time (`5` = 5 seconds) the invocation (user posting their suggestion) will stay in the channel on line 23:
```
{{deleteResponse 5}}
```

## How to use the bot

Just type `[prefix]suggest [suggestion]` if your suggestions channel and the bot will turn it into an embed wwith voting buttons.

## Attribution

Origional code by **Michdi#1602**, as posted on the [YAGPDB](https://docs.yagpdb.xyz/reference/custom-command-examples#suggestion-command) website.
