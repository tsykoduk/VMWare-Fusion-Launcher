def starter(head)
  
  #Display menu
  system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts "VM Image\n"

  @vm_list.each { |vm|
    puts @vm_list.index(vm).to_s + ".  " + File.basename(vm, ".vmwarevm")
  }

  puts "Q:  Quit"
  puts "\nChoose one by number: "
  choice = gets
  
  if choice == "Q" || "q"
    return false
  end
  
  #Launch chosen VM
  target = @vm_list[choice.to_i]

  # First we need to find the .vmx file to launch (it might not be the same as the vm name!!)
  vmx = Dir.glob(target+"/*.vmx").to_s
  vmx = vmx.gsub(" ", "\\ ").gsub("[","").gsub("]","").gsub("\"","")
  launcher = @launcher + " -T start "

  if head == true
    gui = " "
  else
    gui = " nogui"
  end
  
  full_cmd = launcher.to_s + " " + vmx.to_s + gui
  
  if IO.popen(full_cmd.to_s)
    puts "Launched " + target
  else
    puts "Not launched - something went wrong - here is a dump of the enviroment: "
    puts "Launch Command: " + launcher
    puts "VMX File: " + vmx
    puts "Full Target: " + target
    puts "Your Choice: " + choice
  end
  
  
  puts "\n++++++++++++++++++++++++++\n Enter to continue"
  blargh = gets

end