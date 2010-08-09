def starter(head)
  
  #Display menu

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

  # First we need to find the .vmx file to launch (it might not be the same as the vm name!!)
  target = @vm_list[choice.to_i]

  vmx = Dir.glob(target+"/*.vmx").to_s
  vmx = vmx.gsub(" ", "\\ ").gsub("[","").gsub("]","").gsub("\"","")
  launcher = @launcher + " -T fusion start "

  if head == true
    gui = " "
  else
    gui = " nogui"
  end
  
  if system(launcher.to_s + " " + vmx.to_s + gui)
    puts "Launched"
  else
    puts "Not launched - something went wrong - here is a dump of the enviroment: "
    puts "Launch Command: " + launcher
    puts "VMX File: " + vmx
    puts "Full Target: " + target
    puts "Your Choice: " + choice
  end

end