# Reaction Giveaway

This is custom code for [YAGPDB](https://yagpdb.xyz/) which will let you set up a reaction giveaway in Discord [Discord](https://discord.com/).

## Setting up the bot

Go to the *cutom commnads* tab in your [YAGPDB](https://yagpdb.xyz/) dashboard, I suggest creating a group called something like `Mod Menu` to keep them in nice groups.
- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Command (mention/cmd prefix)` and decide on your trigger, in our example we will use `giveaway`
- Copy the code from the [command](https://github.com/CJ0206/yagpdb-cc/blob/main/Reaction%20Giveaway/command.lua) file and paste it into `Response`
- Save

- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Reaction` and `Added + Removed reactions`
- Copy the code from the [reactions](https://github.com/CJ0206/yagpdb-cc/blob/main/Reaction%20Giveaway/reactions.lua) file and paste it into `Response`
- Save

I suggest you also set `Whitelist roles for who can use these commands` to admins only.

## Customising the code

I do not recommend editing this code unless you know what you are doing, other than line 1 if you wish to use a different emoji, **if you wish to cutomise the code here you must ensure you update both files**:
```
{{$giveawayEmoji := `🎉`}}
```
You will also need to update the 🎉 with your new emoji on line 61:
```
{$desc = joinStr "" $desc "\n\n🌟 | **Host:** <@" $.User.ID "> \n\nReact with 🎉 to enter the giveaway!" }} {{end}}
```

## How to use the bot

To start a giveaway use `-giveaway start <Time> <Prize>`

Time can be set as follows:

Code | Time
---- | --------
s    | Seconds
m    | Minutes
h    | Hours
d    | Days
mo   | Months
y    | Years

There are some optional variables you can use to create a maximum number of participants, have more than one winner, or post the giveaway to another channel:

Variables | What they do                             | Example code                           | What the example does
--------- | ---------------------------------------- |  ------------------------------------  | -------------------------------------------------------------------------
`-p`      | Sets number of participants              | `-giveaway start 10m Nitro -p 50`      | Starts a 10 min giveaway for Nitro with a maximum of 50 participants
`-w`      | Sets the number of winners               | `-giveaway start 30s Nitro -w 2`       | Starts a 30 second giveaway for Nitro with 2 winners
`-c`      | Sets the channel to post the giveaway to | `-giveaway start 1d Nitro -c #general` | Starts a 1 day giveaway for Nitro in the #general channel

To end a giveaway early use `-giveaway end <ID>` The ID is in the footer of each giveaway.

To cancel a giveaway use `-giveaway cancel <ID>` The ID is in the footer of each giveaway.

To list all giveaways use `-giveaway list` This will list the giveaway ID, prize, and when it will end.

## Attribution

Origional code by [Satty9361](https://github.com/BlackWolfWoof/yagpdb-cc/tree/master/Moderation_Menu)


This version is posted with the MIT standard licence and is subject to change, this is mainly a step by step to keep track of my own changes and related documentation to make updates easier.
