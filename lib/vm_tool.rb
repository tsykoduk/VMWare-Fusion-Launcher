def vm_tool(head,action)
  #call out the diffrent functions

  vm = vm_menu()
  vmx = vm_target(vm)
  vm_action(head,action,vmx)
end

def vm_menu()
  # Builds a menu of all of the VM's in the default directory.
  # Returns the user's choosen VM
#  system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts "VM Image\n"

  @vm_list.each { |vm|
    puts @vm_list.index(vm).to_s + ".  " + File.basename(vm, ".vmwarevm")
  }

  puts "Q:  Quit"
  puts "\nChoose one by number: "
  choice = gets.chomp
  
  if choice == "Q" or choice == "q"
    return false
  else
    # Return chosen VM
    return @vm_list[choice.to_i]
  end
end

def vm_target(vm)
  # Takes a vm choice (usally from the vm_menu function) and builds out a path to the correct *.vmx 
  # First we need to find the .vmx file to launch (it might not be the same as the vm name!!)
  vmx = Dir.glob(vm+"/*.vmx").to_s
  vmx = vmx.gsub(" ", "\\ ").gsub("[","").gsub("]","").gsub("\"","")
  return vmx
end

def vm_action(head,action,vmx)
  # starts, stops, reboots a VM
  launcher = @launcher + " " + action + " "

  if head == true
    mgui = " "
  else
    mgui = " nogui"
  end
 
  if system(launcher.to_s + vmx.to_s + mgui.to_s)
    case action 
    when "start"
      puts "Launched"
    when "stop"
      puts "Stopped"
    when "restart"
      puts "restarted"
    when "snap"
      puts "snapshotted"
    end
  else
    puts "#{action} not completed - something went wrong - here is a dump of the enviroment: "
    puts "Launch Command: " + launcher.to_s + " " + vmx.to_s + mgui.to_s
    puts "VMX File: " + vmx
    puts "Full Target: " + target
    puts "Your Choice: " + choice
  end  
  
  puts "\n++++++++++++++++++++++++++\n Enter to continue"
  blargh = gets

end

def vm_lister()
  # makes a list of the vm's in the default vm directory
#  system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts "VM Images Running\n"
  
  vms = IO.popen(@launcher.to_s + " list")
  
  puts "\n\n\n"
  
  puts vms.readlines
  puts "\n++++++++++++++++++++++++++\n Enter to continue"
  
  blargh = gets

end