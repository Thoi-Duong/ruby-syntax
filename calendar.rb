
require 'date'

def get_input

  p "put month:"
  month = gets.chomp.to_i
  p "put year:"
  year = gets.chomp.to_i
  while !month.between?(1, 12) || !year.between?(1900, 9999) do
    p "put month:"
    month = gets.chomp.to_i
    p "put year:"
    year = gets.chomp.to_i
  end
  {month: month, year: year}

end

def process(date, month, year)

  print " Su  Mo  Tu  We  Th  Fr  Sa \n"
  days = Array.new(7) { Array.new()}
  date.times do |i|
    i = i + 1
    date_in_week = Date.new(year, month, i).wday
    day = i.to_s
    day = "#{i} " if i <= 10
    days[date_in_week].push(day)
  end

  7.times do |day_in_week_index|
    if days[day_in_week_index][0].to_i != 1
      days[day_in_week_index].unshift("  ")
    else
      break
    end
  end

  6.times do |index|
    7.times do |day_in_week_index|
      date = days[day_in_week_index][index]
      print " #{date} "
    end
    print "\n"
  end

end

input = get_input

input_date = Date.new(input[:year], input[:month], -1)

total_days_in_month = input_date.day.to_i

print "\t #{input_date.strftime("%B")} #{input[:year]} \n"

process(total_days_in_month, input[:month], input[:year])
