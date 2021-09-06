struct sprite $0000
	.number:		skip 2
	.render_order:		skip 2
	.x_sub_position:	skip 2
	.x_position:		skip 2
	.y_sub_position:	skip 2
	.y_position:		skip 2
	.ground_y_position:	skip 2
	.ground_distance:	skip 2
	.interaction_type:	skip 2
	.oam_property:		skip 2
	.unknown_14:		skip 2
	.unknown_16:		skip 2
	.unknown_18:		skip 2
	.unknown_1A:		skip 2
	.unknown_1C:		skip 2
	.unknown_1E:		skip 2
	.x_speed:		skip 2
	.unknown_22:		skip 2
	.y_speed:		skip 2
	.max_x_speed:		skip 2
	.unknown_28:		skip 2
	.max_y_speed:		skip 2
	.x_force:		skip 2
	.action:		skip 1 ;\ This is a pair in most cases, but a couple sprites use 2F alone
	.unknown_2F:		skip 1 ;/
	.unknown_30:		skip 2
	.unknown_32:		skip 2
	.unknown_34:		skip 2
	.animation_id:		skip 2
	.animation_timer:	skip 2
	.animation_control:	skip 2
	.animation_address:	skip 2
	.unknown_3E:		skip 2
	.unknown_40:		skip 2
	.unknown_42:		skip 2
	.unknown_44:		skip 2
	.unknown_46:		skip 2
	.unknown_48:		skip 2
	.unknown_4A:		skip 2
	.unknown_4C:		skip 2
	.unknown_4E:		skip 2
	.parameter:		skip 2
	.unknown_52:		skip 2
	.unknown_54:		skip 2
	.unknown_56:		skip 2
	.unknown_58:		skip 2
	.unknown_5A:		skip 2
	.unknown_5C:		skip 2
	.unknown_5E:		skip 2
endstruct