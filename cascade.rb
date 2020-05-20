def output_board_state
  puts "\n\n"
  puts "Total Milled: #{@total_milled}"
  puts "Zombie Power Roster: #{@zombies.map { |zombie| zombie[:power] }}\n\n"
end

puts "Welcome to the Vulturous Zombie Cascade Calculator!"
puts "Assuming you have an Altar of Dementia in play..."
print "\nWhat is the total power of creatures under your control OTHER THAN Vulturous Zombie? "

@total_power = gets.chomp.to_i
@total_milled = 0

print "\nOkay, how many Vulturous Zombies do you have in play? "
number_of_zombies = gets.chomp.to_i

@zombies = number_of_zombies.times.map do |zombie_number|
  print "  Zombie ##{zombie_number + 1}'s power: "
  { power: gets.chomp.to_i }
end.sort_by { |zombie| zombie[:power] }

output_board_state

puts "\nSTEP 1: sacrifice non-zombie creatures to the Altar..."
@zombies.each do |zombie|
  zombie[:power] += @total_power
end

@total_milled += @total_power

output_board_state

puts "\nSTEP 2: sacrifice the zombies from strongest to weakest..."
while @zombies.any? do
  mill = @zombies.pop[:power]
  puts "  Sacrificing a zombie with #{mill} power..."

  @total_milled += mill

  @zombies.each do |zombie|
    zombie[:power] += mill
  end

  output_board_state
end

puts "\nNow that all the zombies are sacrificed,"
puts "and assuming one player with sufficient cards in library was the target,"
puts "the total cards milled was #{@total_milled}."

puts "\n... Yeesh." if @total_milled > 60
