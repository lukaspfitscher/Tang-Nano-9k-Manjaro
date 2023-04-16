# Tang-Nano-9k
Opensource Toolchain commands for uploading Verilog to the Tang Nano 9k
Tested on Manjaro OS




```
yosys -D LEDS_NR=6 -p "read_verilog test.v; synth_gowin -json test.json"
yowasp-nextpnr-gowin --json test.json \
--write pnrtest.json \
--device GW1NR-LV9QN88PC6/I5 --family GW1N-9C \
--cst tangnano9k.cst
gowin_pack -d GW1N-9C -o pack.fs pnrtest.json
openFPGALoader -b tangnano9k pack.fs
```


```
pip install yowasp-nextpnr-gowin
```

```
pip install Apycula
```

```
sudo pacman -S yosys
```

```
sudo pacman -S openfpgaloader
```
