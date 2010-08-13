def vm_snap(action)
  puts action
  puts "starting vm_menu"
  vm = vm_menu()
  puts vm
  puts "starting vm_target"
  vmx = vm_target(vm)
  if action == "list"
    vm_snap_list(vmx)
  else
    vm_snapshot(vmx,action)
  end
end


def vm_snap_list(vmx)
#  system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts "Snaps for #{vmx}\n"
  
  vms = IO.popen(@launcher.to_s + " listSnapshots " + vmx.to_s)
  
  puts "\n\n\n"
  
  puts vms.readlines
  puts "\n++++++++++++++++++++++++++\n Enter to continue"
  
  blargh = gets
end

def vm_snapshot(vmx,action)
  # starts, stops, reboots a VM
  launcher = @launcher + " " + action + " "
  puts "We need a snapshot name: "
  name = gets
if spinner(system(launcher.to_s + vmx.to_s + " " + name.to_s))
    case action 
    when "snapshot"
      puts "Snapshoted"
    when "deleteSnapshot"
      puts "Snap removed"
    when "revertToSnapshot"
      puts "Reverted to snap"
    end
  else
    puts "#{action} not completed - something went wrong - here is a dump of the enviroment: "
    puts "Launch Command: " + launcher.to_s + " " + vmx.to_s + name.to_s
    puts "VMX File: " + vmx
    puts "Full Target: " + target
    puts "Your Choice: " + name
  end  
  
  puts "\n++++++++++++++++++++++++++\n Enter to continue"
  blargh = gets


end