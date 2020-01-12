require_relative 'enigma'
require_relative 'shift'

enigma_machine = Enigma.new

encrypted_reader = File.open(ARGV[0], "r")

encrypted_message = encrypted_reader.read

encrypted_reader.close

decrypted_message = enigma_machine.decrypt(encrypted_message, ARGV[2], ARGV[3])
file_to_write = File.open(ARGV[1], "w")

file_to_write.write(decrypted_message[:decryption])

file_to_write.close


puts "Created 'decrypted.txt' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
