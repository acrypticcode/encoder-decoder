# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/studio_5/studio_5.cache/wt [current_project]
set_property parent.project_path C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/studio_5/studio_5.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/studio_5/studio_5.srcs/sources_1/new/decoder.vhd
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/studio_5/studio_5.srcs/constrs_1/new/studio5constraints.xdc
set_property used_in_implementation false [get_files C:/Users/flandc/OneDrive/MyFiles/@RPI/CoCO/Vivado_Projects/studio_5/studio_5.srcs/constrs_1/new/studio5constraints.xdc]


synth_design -top decoder -part xc7a35tcpg236-1


write_checkpoint -force -noxdef decoder.dcp

catch { report_utilization -file decoder_utilization_synth.rpt -pb decoder_utilization_synth.pb }
