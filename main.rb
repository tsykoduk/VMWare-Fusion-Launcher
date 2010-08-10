#!/usr/bin/env ruby 
#-wKU

#Lets get needed stuff loaded
require 'etc'
require "./starter"
require "./stopper"
require "./lister"

## VMWare Tools

#setup base enviroment

@user = Etc.getlogin
@homepath = "/Users/" + @user + "/Documents/Virtual\\ Machines.localized/"
@vm_list = Dir.glob(@homepath + "*")
@launcher = "/Library/Application\\ Support/VMware\\ Fusion/vmrun"
@ex = false

def main()
 # system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts " "
  puts "Choose your task:"
  puts "1:  Start a headless VM"
  puts "2:  Start a VM with a head"
  puts "3:  List running VM's"
  puts "4:  Stop a VM"
  puts "5:  Restart a VM"
  puts "6:  Exit"

  mychoice = gets 
  case mychoice.to_i
    when 1  
      starter(false)
    when 2 
      starter(true)
    when 3 
      lister()
    when 4 
      stopper(true)
    when 5 
      stopper(false)
    when 6 
      @ex = true
    else 
      puts "Woops, I did not understand that!! (you tried #{mychoice}, I expected a number between 1 and 6)"
  end
end


while @ex == false
  main()
end