ghdl -a t6l-lawas-tomagos.vhdl
ghdl -e boggis_bunce_bean_buzzer
ghdl -r boggis_bunce_bean_buzzer
ghdl -a t6l-lawas-tomagos-tb.vhdl
ghdl -e tb_boggis_bunce_bean_buzzer
ghdl -r tb_boggis_bunce_bean_buzzer --vcd=tb_bbb_b.vcd
gtkwave tb_bbb_b.vcd