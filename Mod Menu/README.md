# Mod Menu

This is custom code for [YAGPDB](https://yagpdb.xyz/) which will give moderators a handy menu to kick, ban, or mute users in [Discord](https://discord.com/). Rather than remembering various bot commands, roles, or clicking various menus moderators can just type `-mod <@user>` and the bot will reply with an embed to carry out the necessary task.

Once you are done with the pannel make sure to click "❌" to close out the operation, this will remove the invoaction and embed.

## Setting up the bot

Go to the *cutom commnads* tab in your [YAGPDB](https://yagpdb.xyz/) dashboard, I suggest creating a group called something like `Mod Menu` to keep them in nice groups.
- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Command (mention/cmd prefix)` and decide on your trigger, in our example we will use `mod`
- Copy the code from the [command](https://github.com/CJ0206/yagpdb-cc/blob/main/Mod%20Menu/command.luaa) file and paste it into `Response`
- Save

- Click `Create a new Custom Command`
- Select `Trigger Type` and choose `Reaction` and `Added + Removed reactions`
- Copy the code from the [reactions](https://github.com/CJ0206/yagpdb-cc/blob/main/Mod%20Menu/reactions.lua) file and paste it into `Response`
- Save

## Customising the code

**If you wish to cutomise any of the code here you must ensure you update both files**, for example, I have updated the ban and mute emoji which was chaned in several places in both documents. If you update an emoji it's probably best to use the find (`ctrl`+`F`) function and replace every instance of that emoji in both documents, please note the sub menus are only in the [reactions](https://github.com/CJ0206/yagpdb-cc/blob/main/Mod%20Menu/reactions.lua) document.

If you wish to change the time limits people are muted/banned for then I suggest searching the [reactions](https://github.com/CJ0206/yagpdb-cc/blob/main/Mod%20Menu/reactions.lua) document for the corresponding emoji updating the text.

## How to use the bot

Just type `[prefix]mod [@user]` to moderate `[@user]`.

## Attribution

Origional code by [BlackWolfWoof](https://github.com/BlackWolfWoof/yagpdb-cc/tree/master/Moderation_Menu)

```
Copyright (c): Black Wolf, 2021
License: MIT
Repository: https://github.com/BlackWolfWoof/yagpdb-cc/
```

This version is posted with the same MIT standard licence and is subject to change, this is mainly a step by step to keep track of my own changes and related documentation to make updates easier.
