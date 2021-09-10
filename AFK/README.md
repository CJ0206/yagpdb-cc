# AFK System

This is custom code for [YAGPDB](https://yagpdb.xyz/) which will let users know you are away from [Discord](https://discord.com/) if they ping you. Users will need to set a reason they are away, and can set a duration so the bot can let people know when to expect you back. You don't have to feel guilty about leaving a conversation to deal with other things any more!

## Setting up the bot

Go to the *cutom commnads* tab in your [YAGPDB](https://yagpdb.xyz/) dashboard, I suggest creating a group called something like `AFK` to keep things in nice groups.
- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Regex`, and set `Trigger` to `.*`
- Copy the code from the [command](https://github.com/CJ0206/yagpdb-cc/blob/main/AFK/command.lua) file and paste it into `Response`
- Save

Go to *Notifications & Feeds*, then *General* tab in your [YAGPDB](https://yagpdb.xyz/) dashboard, turn *User Leave Message* on if it's not already.
- Copy the code from the [leave](https://github.com/CJ0206/yagpdb-cc/blob/main/AFK/leave.lua) file and paste it into `Message`, if you already have a leave message then paste it at the top of your current message. If you do not wish for a message to be sent when someone leaves just add `{{ sendMessage nil }}`
- Save

The second part clears the database of any user who leaves and has an AFK set.

## Customising the code

I do not recommend editing this code unless you know what you are doing, other than line 1. Personally I want the bot to remove the AFK when someone types in the server, I set this to true in servers I manage.
```
{{ $removeAfkOnMessage := false }}
```

## How to use the bot

Just type `[prefix]afk [reason] -d [how long you'll be away]`. If you don't know how long you'll be away you can just use `[prefix]afk [reason]`. 

## Attribution

Origional code by [DaviiD1337](https://github.com/DaviiD1337/yagpdb_custom_commands/tree/master/afk)

```
Copyright (c): DaviiD1337, 2021
License: MIT
Repository: https://github.com/DaviiD1337/yagpdb_custom_commands
```

This version is posted with the same MIT standard licence and is subject to change, this is mainly a step by step to keep track of my own changes and related documentation to make updates easier.
