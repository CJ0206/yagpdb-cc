{{/*This enables the whitelist of channels where it should run, change the channelID to your own channel or change to false to disable*/}}
{{$whitelist := true}}
{{$channels := cslice 878314132401709116}}

{{if not $whitelist}}{{$channels = cslice .Channel.ID}}{{end}}
{{if and (dbGet 0 "stickymessage") (dbGet .Channel.ID "smcooldown"|not) (in $channels .Channel.ID)}}
	{{$db := (dbGet 0 "stickymessage").Value}}
	{{$message := cembed "footer" (sdict "text" (print "Sticky message by " $db.author) "icon_url" "https://cdn.discordapp.com/emojis/587253903121448980.png") "color" $db.color "description" $db.message "image" (sdict "url" (or $db.img ""))}}

	{{if $db := dbGet .Channel.ID "smchannel"}}
		{{deleteMessage nil (toInt $db.Value) 0}}
	{{end}}
	{{$id := sendMessageRetID nil $message}}
	{{dbSet .Channel.ID "smchannel" (str $id)}}
	{{dbSetExpire .Channel.ID "smcooldown" true (toInt (toDuration $db.cooldown).Seconds)}}
{{end}}
