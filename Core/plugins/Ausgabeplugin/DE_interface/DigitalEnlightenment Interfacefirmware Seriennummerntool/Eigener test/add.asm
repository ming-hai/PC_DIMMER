STRING3_DESC:	.DW		0x22					;Descriptor size in Bytes (34 Bytes) - Product Name (Unicode)
				.DW		0x03					;Descriptor type -> Constant STRING (03h)
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x30,0x00				;0
				.DW		0x38,0x00				;8
				.DW		0x31,0x00				;1
				.DW		0x31,0x00				;1
STRING3_DESC_END:

;--------------- End Descriptor Part ---------------------------------------------------


.exit
