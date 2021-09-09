
# Sticky Message
This is custom code for [YAGPDB](https://yagpdb.xyz/) which will keep a custom embed at the bottom of a defined [Discord](https://discord.com/) channel, rather than users not checking pinned messages or an announcement channel you can ensure they see your most important messages by getting a bot to post it at the bottom of your channel no matter how many people post something after your announcement, it will remove its previous embed when it posts a new one.

## Setting up the bot

Go to the *cutom commnads* tab in your [YAGPDB](https://yagpdb.xyz/) dashboard, I suggest creating a group called something like `Sticky Messages` to keep them in nice groups.
- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Command (mention/cmd prefix)` and decide on your trigger, in our example we will use `sm`
- Copy the code from the [command](https://github.com/CJ0206/yagpdb/blob/main/Sticky%20Message/command) file and paste it into `Response`
- Save

- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Regex`
- Copy the code from the [regex](https://github.com/CJ0206/yagpdb/blob/main/Sticky%20Message/regex) file and paste it into `Response`
- Save

## Customising the code
### [command](https://github.com/CJ0206/yagpdb/blob/main/Sticky%20Message/command)
If we look at the command file first, we can specify who can run the command using line 3:
```
{{$perms := "Administrator"}}
```
The different server permissions are listed within the command file within the comments (the bits between `{{*/` and `*/}}`) this can be further limited in the dashboard, but doing it this way alows the bot to respond.

You can change the message the bot responds with if a user does not have permission to use the command in line 36: 
```
{{sendMessage nil (cembed "title" "Missing permissions" "description" (print "<:x:> You are missing the permission `" $perms "` to use this command!") "color" 0xDD2E44)}}
```
In our example the embed will have a title `Missing permissions` with a message `❌ You are missing the permission Administrator to use this command!` if you are not authosised to run the command.

We can specify how log it will be before the bot moved the message to the bottom of the channel in ine 7:

```
{{$cooldown := "30m"}}
```
Here our command will only run every 30 minutes, this means the message will not be moved with every comment which is posted which would be annoying as heck if you were having a conversation with someone in the channel this command is running in.

Here are some other messages you may consider personalising:
Line 25 lets the user know the sticky message has successfully been saved:
```
{{sendMessage nil "The sticky message was enabled and saved!"}}
```

Line 33 lets the user know the sticky message has been turned off:
```
{{sendMessage nil "Sticky messages are now disabled and deleted again."}}
```

### [regex](https://github.com/CJ0206/yagpdb/blob/main/Sticky%20Message/regex)
The regex allows us to decide which channels the command will run in, if this is not defined it will run in every channel the bot has permission to post in. Line 2 allows you to turn the whitelist on or off depending on if you want it to run in every channel or not:
```
{{$whitelist := true}}
```

Line 3 is where we will put our whitelisted channelID's (where we want the bot to post these messages), you can seporate the channels if you want it to run in more than one by simply putting a space between each ID:
```
{{$channels := cslice 878314132401709116}}
```

The  last place we can look at editing is the actual embed the bot posts. This is defined in line 8 and where my version mainly differs frim the origional as I've set the envokers information to be contained within the footer rather than the author field, I found the author field to be too invasive compared to the message when I origionally set up this command. Be careful when playing with this one and make sure you refer to [custom embed documentation for YAGPDB](https://docs.yagpdb.xyz/others/custom-embeds).

```
{{$message := cembed "footer" (sdict "text" (print "Sticky message by " $db.author) "icon_url" "https://cdn.discordapp.com/emojis/587253903121448980.png") "color" $db.color "description" $db.message "image" (sdict "url" (or $db.img ""))}}

```

## How to use the bot
This code works by an authorised person posting `[prefix]sm [message]` or `[prefix]sm [message] [cooldown between posts]`, the first option will post the sticky message in predefined channels after the default period of time, the second allows the user to define the period between posts rather than using the default time.

You can turn off the sticky notification by posting `[prefix]sm`


## Attribution
Origional code by [BlackWolfWoof](https://github.com/jo3-l/yagpdb-cc-wolf/tree/master/Sticky_Message/v2)

```
Copyright (c): Black Wolf, 2021
License: MIT
Repository: https://github.com/BlackWolfWoof/yagpdb-cc/
```

This version is posted with the same MIT standard licence and is subject to change, this is mainly a step by step to keep track of my own changes and related documentation to make updates easier.
