onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fulladder_tb/r_A
add wave -noupdate /fulladder_tb/r_B
add wave -noupdate /fulladder_tb/r_C
add wave -noupdate /fulladder_tb/w_S
add wave -noupdate /fulladder_tb/w_C
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {77300 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {420 us}
