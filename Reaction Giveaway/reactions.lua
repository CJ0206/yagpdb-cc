{{ $giveawayEmoji := `🎉` }}
{{ $data := sdict }}

{{ if and (eq .Reaction.Emoji.Name $giveawayEmoji) (not .User.Bot ) }}
	{{ with (dbGet 7777 "giveaway_active").Value }}{{ $data = sdict . }}{{ end }}
	{{$giveawayData := $data.Get (joinStr "" .Reaction.ChannelID .Reaction.MessageID)}}
	{{ if $giveawayData }}
		{{ $giveawayData = sdict $giveawayData }}
		{{ if .ReactionAdded }}
			{{ $giveawayData.Set "listID" (joinStr "" $giveawayData.listID  .User.ID "," ) }}
			{{ $giveawayData.Set "count" (add $giveawayData.count 1) }}
		{{ else }}
			{{ $IDregex := joinStr  ""  .User.ID `,` }}
			{{ $giveawayData.Set "listID" (reReplace $IDregex $giveawayData.listID "") }}
			{{ $giveawayData.Set "count" (add $giveawayData.count -1) }}          
		{{ end }}
  		{{ $data.Set (joinStr ""  .Reaction.ChannelID .Reaction.MessageID) $giveawayData }}
		{{ dbSet 7777 "giveaway_active" $data }}
	{{ end }}
{{ end }}
