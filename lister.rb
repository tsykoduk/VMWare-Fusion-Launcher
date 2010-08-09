def lister()
  vms = system(@launcher.to_s + " list")

vms.to_s.each_line { |v|
    puts File.basename(v) 
    }

end
