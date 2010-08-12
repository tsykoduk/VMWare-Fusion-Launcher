#!/usr/bin/env ruby 
#-wKU

#Lets get needed stuff loaded
require 'etc'
require "./lib/vm_tool"
require "./lib/snap_menu"

## VMWare Tools

#setup base enviroment

@user = Etc.getlogin
@homepath = "/Users/" + @user + "/Documents/Virtual\\ Machines.localized/"
@vm_list = Dir.glob(@homepath + "*")
@launcher = "/Library/Application\\ Support/VMware\\ Fusion/vmrun"
@ex = false


def main()
  system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts " "
  puts "Choose your task:"
  puts "1:  Start a headless VM"
  puts "2:  Start a VM with a head"
  puts "3:  List running VM's"
  puts "4:  Stop a VM"
  puts "5:  Restart a VM"
  puts "6:  Snapshot a VM"
  puts "7:  Exit"

  mychoice = gets 
  case mychoice.to_i
    when 1  
      vm_tool(false,"start")
    when 2 
      vm_tool(true,"start")
    when 3 
      vm_lister()
    when 4 
      vm_tool(true,"stop")
    when 5 
      vm_tool(true,"reset")
    when 6
      vm_snapper()
    when 7
      @ex = true
    else 
      puts "Woops, I did not understand that!! (you tried #{mychoice}, I expected a number between 1 and 7)"
  end
end


while @ex == false
  main()
end