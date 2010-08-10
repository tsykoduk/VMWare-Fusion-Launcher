def lister()
  
  system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts "VM Images Running\n"
  
  vms = IO.popen(@launcher.to_s + " list")
  
  puts "\n\n\n"
  
  puts vms.readlines
  puts "\n++++++++++++++++++++++++++\n Enter to continue"
  
  blargh = gets

end
