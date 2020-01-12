require_relative 'enigma'
require_relative 'shift'

enigma_machine = Enigma.new

reader = File.open(ARGV[0], "r")

message = reader.read

reader.close

encrypted_message = enigma_machine.encrypt(message, nil, nil)

file_to_write_on = File.open(ARGV[1], "w")

file_to_write_on.write(encrypted_message[:encryption])

file_to_write_on.close

puts "Created 'encrypted.txt' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
