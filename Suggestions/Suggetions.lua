{{/*Change the channelID to your suggestions channel*/}}
{{$channel :=731156498390057040}}

{{if gt (len .Args) 1}}
	Suggestion submitted.
	
	{{ $embed := cembed
		"description"  (joinStr " " .StrippedMsg)
		"color" 9021952
		"author" (sdict "name" (joinStr "" .User.Username "#" .User.Discriminator) "url" "" "icon_url" (.User.AvatarURL "512"))
		"timestamp"  currentTime
	}}

	{{$id := (sendMessageNoEscapeRetID $channel $embed) }}
	{{addMessageReactions $channel $id "upvote:524907425531428864" "downvote:524907425032175638" }}

{{else}}
	Correct usage: -suggest <suggestion>

{{end}}

{{deleteResponse 5}}
{{deleteTrigger 5}}
