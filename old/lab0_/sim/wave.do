onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mux2x1_tb/r_A
add wave -noupdate /mux2x1_tb/r_B
add wave -noupdate /mux2x1_tb/r_SEL
add wave -noupdate /mux2x1_tb/w_OUT
add wave -noupdate -expand /mux2x1_tb/TIME_COUNT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {21300 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 96
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
WaveRestoreZoom {0 ns} {105 us}
