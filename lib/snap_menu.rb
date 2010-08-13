def vm_snapper()
  #start the menu
  @snap_exit = false
  
  while @snap_exit == false
    vm_snap_menu()
  end
end

def vm_snap_menu()
  #where do you want to go today?
  system("clear")
  puts "\n++++++++++++++++++++++++++\nVMWare Fusion Tools\n++++++++++++++++++++++++++\n"
  puts "\n++++++++++++++++++++++++++\n  SnapShot Tools  \n++++++++++++++++++++++++++\n"

  puts "1:  List Current Snapshots"
  puts "2:  Make a Snapshot" 
  puts "3:  Delete a Snapshot"
  puts "4:  Revert to a Snapshot"
  puts "5:  Return to main menu"
  
  choice = gets
  
  case choice.to_i
  when 1
    puts choice
    puts "starting vmsnap"
    vm_snap('list')
  when 2
        puts choice
    puts "starting vmsnap"
    vm_snap('snapshot')
  when 3
    puts "starting vmsnap"
    vm_snap('deleteSnapshot')
  when 4
    puts "starting vmsnap"
    vm_snap('revertToSnapshot')
  when 5
    @snap_exit = true
  end
end