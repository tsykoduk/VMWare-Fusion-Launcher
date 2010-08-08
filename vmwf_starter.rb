#!/usr/bin/env ruby 

#-wKU

#Lets get needed stuff loaded
require 'etc'

## VMWare Launcher

#get menu items

@user = Etc.getlogin
@homepath = "/Users/" + @user + "/Documents/Virtual\\ Machines.localized/"
@vm_list = Dir.glob(@homepath + "*")

#Display menu

puts "VM Image\n"

@vm_list.each { |vm|
  puts @vm_list.index(vm).to_s + ".  " + File.basename(vm, ".vmwarevm")
}

puts "\nChoose one by number: "
@choice = gets

#Launch chosen VM

# First we need to find the .vmx file to launch (it might not be the same as the vm name!!)
@target = @vm_list[@choice.to_i]

@vmx = Dir.glob(@target+"/*.vmx").to_s
@vmx = @vmx.gsub(" ", "\\ ").gsub("[","").gsub("]","").gsub("\"","")
@launcher = "/Library/Application\\ Support/VMware\\ Fusion/vmrun -T fusion start "

if system(@launcher.to_s + " " + @vmx.to_s + " nogui")
  puts "Launched"
else
  puts "Not launched - something went wrong - here is a dump of the enviroment: "
  puts "Launch Command: " + @launcher
  puts "VMX File: " + @vmx
  puts "Full Target: " + @target
  puts "Your Choice: " + @choice
end

#+ " "
#	/Library/Application\ Support/VMware\ Fusion/vmrun -T fusion start /Users/$USERNAME/Documents/Virtual\ Machines.localized/$image.vmwarevm/$image.vmx nogui