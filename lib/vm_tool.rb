def vm_tool(head,action)
  
  #Display menu
  system("clear")
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
    #Launch chosen VM
    target = @vm_list[choice.to_i]
  end

  # First we need to find the .vmx file to launch (it might not be the same as the vm name!!)
  vmx = Dir.glob(target+"/*.vmx").to_s
  vmx = vmx.gsub(" ", "\\ ").gsub("[","").gsub("]","").gsub("\"","")
  launcher = @launcher + " " + action + " "

  if head == true
    mgui = " "
  else
    mgui = " nogui"
  end
  
 # full_cmd = launcher.to_s + " " + vmx.to_s + gui
 
  if system(launcher.to_s + vmx.to_s + mgui.to_s)
    case action 
    when "start"
      puts "Launched"
    when "stop"
      puts "Stopped"
    when "restart"
      puts "restarted"
    end
  else
    puts "Not launched - something went wrong - here is a dump of the enviroment: "
    puts "Launch Command: " + launcher.to_s + " " + vmx.to_s + mgui.to_s
    puts "VMX File: " + vmx
    puts "Full Target: " + target
    puts "Your Choice: " + choice
  end
  
 # if IO.popen(full_cmd.to_s)
 #   puts "Launched " + target
 # else
#    puts "Not launched - something went wrong - here is a dump of the enviroment: "
#    puts "Launch Command: " + launcher
#    puts "VMX File: " + vmx
#    puts "Full Target: " + target
#    puts "Your Choice: " + choice
#  end
  
  
  puts "\n++++++++++++++++++++++++++\n Enter to continue"
  blargh = gets

end