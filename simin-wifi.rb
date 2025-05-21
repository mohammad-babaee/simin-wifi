# MIT License
# 
# Copyright (c) 2025 Mohammad Babaee
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy 
# of this software and associated documentation files (the "Software"), to deal 
# in the Software without restriction, including without limitation the rights to 
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
# of the Software, and to permit persons to whom the Software is furnished to do so, 
# subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies 
# or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
# PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
# FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



header = '''


                               ▗▄▄▖▗▄▄▄▖▗▖  ▗▖▗▄▄▄▖▗▖  ▗▖    ▗▖ ▗▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖
                              ▐▌     █  ▐▛▚▞▜▌  █  ▐▛▚▖▐▌    ▐▌ ▐▌  █  ▐▌     █  
                               ▝▀▚▖  █  ▐▌  ▐▌  █  ▐▌ ▝▜▌    ▐▌ ▐▌  █  ▐▛▀▀▘  █  
                              ▗▄▄▞▘▗▄█▄▖▐▌  ▐▌▗▄█▄▖▐▌  ▐▌    ▐▙█▟▌▗▄█▄▖▐▌   ▗▄█▄▖ [Version:1.1.1]
                                                                                                           
                                                                                                           
                            Разработчик : Мохаммад Бабаи | Developer : Mohammad Babaee  

'''

puts ( header )


wifi_list = `nmcli -t -f SSID,SIGNAL,SECURITY dev wifi list`.split("\n")

puts "📡 Available Wi-Fi Networks: 🛜 \n\n"


wifi_list.each do |wifi_info|
  ssid, signal, security = wifi_info.split(":")
  
  puts "🔹 SSID: #{ssid}"
  puts "📶 Signal: #{signal}%"
  puts "🔒 Security: #{security}"
  puts "---------------------------"
end

puts ("Please Choose The Action That You Want [Enter The Number]")

options = '''
[1] > Detect Risky Auto-Connections 💻
[2] > DNS Hijacking Detection 🔎
[3] > WIFI Deauthentication Attack Detection 🌐
[4] > Weak Password Testing 🔒 🗝️
'''
puts (options)

puts ("--------------------------- \n")

user_input = gets.chomp

if user_input.to_i == 1
  puts "🚀 Running Auto-Connection Detection...\n"
  
  current_wifi = `nmcli -t -f NAME,DEVICE connection show --active`.split("\n").first

  if current_wifi
    ssid, device = current_wifi.split(":")
    puts "✅ Connected to: #{ssid} (Device: #{device})"
  else
    puts "❌ No active Wi-Fi connection detected!"
  end

elsif user_input.to_i == 2

dns_servers = `cat /etc/resolv.conf | grep nameserver`.split("\n")

puts "🔍 Checking DNS settings...\n\n"

dns_servers.each do |dns|
  dns_address = dns.split(" ").last.strip
  puts "🖥️ Current DNS Server: #{dns_address}"

  safe_dns = ["8.8.8.8", "8.8.4.4", "1.1.1.1", "9.9.9.9"]

  if safe_dns.include?(dns_address)
    puts "✅ Trusted DNS detected!"
  else
    puts "⚠️ WARNING: Unrecognized DNS! Possible hijacking risk!"
  end

  puts "---------------------------"
end

elsif user_input.to_i == 3
  puts "🔍 Monitoring Wi-Fi connection stability...\n"

  
loop do
  signal_strength = `nmcli -t -f SIGNAL device wifi list | grep '*'`.split("\n").first.to_i
  
  if signal_strength < 20 
    puts "⚠️ WARNING: Sudden signal drop detected! Possible deauthentication attack!"
  else
    puts "✅ Connection stable. Signal Strength: #{signal_strength}%"
  end

  sleep 5 
end

elsif user_input.to_i == 4
  
puts "📂 Enter the path of the password wordlist file (e.g., rockyou.txt):"
wordlist_path = gets.chomp


if !File.exist?(wordlist_path)
  puts "❌ Error: File not found! Please provide a valid file."
  exit(1)
end

puts "🔍 Loading password wordlist...\n"

weak_passwords = File.readlines(wordlist_path).map(&:strip)

puts "✅ Loaded #{weak_passwords.size} passwords from #{wordlist_path}!"

puts ("--------------------------- \n ")
puts ("Please Enter Your WIFI Password , Here : ")
wifi_password = gets.chomp().to_s 

puts "🔎 Checking Wi-Fi password against wordlist...\n"

if weak_passwords.include?(wifi_password)
  puts "⚠️ WARNING: Your Wi-Fi password is **weak** , it's matched easily and maybe you are a Victim for hackers ! "
else
  puts "✅ This password is not in the common weak password list , you are safe !"
end

puts "---------------------------"

end