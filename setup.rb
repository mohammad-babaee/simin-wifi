puts '''

 ▗▄▄▖▗▄▄▄▖▗▖  ▗▖▗▄▄▄▖▗▖  ▗▖    ▗▖ ▗▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖         ▗▄▖ ▗▖ ▗▖▗▄▄▄▖▗▄▖      ▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖ ▗▖▗▄▄▖ 
▐▌     █  ▐▛▚▞▜▌  █  ▐▛▚▖▐▌    ▐▌ ▐▌  █  ▐▌     █          ▐▌ ▐▌▐▌ ▐▌  █ ▐▌ ▐▌    ▐▌   ▐▌     █  ▐▌ ▐▌▐▌ ▐▌
 ▝▀▚▖  █  ▐▌  ▐▌  █  ▐▌ ▝▜▌    ▐▌ ▐▌  █  ▐▛▀▀▘  █          ▐▛▀▜▌▐▌ ▐▌  █ ▐▌ ▐▌     ▝▀▚▖▐▛▀▀▘  █  ▐▌ ▐▌▐▛▀▘ 
▗▄▄▞▘▗▄█▄▖▐▌  ▐▌▗▄█▄▖▐▌  ▐▌    ▐▙█▟▌▗▄█▄▖▐▌   ▗▄█▄▖        ▐▌ ▐▌▝▚▄▞▘  █ ▝▚▄▞▘    ▗▄▄▞▘▐▙▄▄▖  █  ▝▚▄▞▘▐▌   
                                                                                                           
                                                                                                           
                          Разработчик : Мохаммад Бабаи | Developer : Mohammad Babaee

'''


puts "🚀 Installing Dependencies for SIMIN AI Assistant... \n"
puts " --- --- --- --- Installing The Network Manager --- --- --- --- \n"
system("sudo apt install network-manager")
puts " --- --- --- --- Starting The Network Manager Service ⚒️ --- --- --- --- \n"
system("sudo systemctl start NetworkManager.service ")
puts " --- --- --- --- Enabling The Network Manager Service 💻 --- --- --- --- \n"
system("sudo systemctl enable NetworkManager.service")

puts "Setup Complete! You can now go and run `simin-wifi.rb` ✅ 💃 \n"

puts (" --------- --------- --------- ")

if system("nmcli --version")
  puts (" --------- --------- --------- ")
  puts "✅ nmcli is ready to go! ✅"
else
  puts "❌ Installation failed, check dependencies. ❌"
  exit(1)
end
