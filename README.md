# Tang-Nano-9k
Opensource Toolchain command for uploading Verilog to the Tang Nano 9k


'''
yosys -D LEDS_NR=6 -p "read_verilog test.v; synth_gowin -json test.json"
yowasp-nextpnr-gowin --json test.json \
--write pnrtest.json \
--device GW1NR-LV9QN88PC6/I5 --family GW1N-9C \
--cst tangnano9k.cst
gowin_pack -d GW1N-9C -o pack.fs pnrtest.json
openFPGALoader -b tangnano9k pack.fs
'''
