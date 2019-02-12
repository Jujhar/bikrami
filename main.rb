# Bikrami Dates * 2019
# By singh [jujhar.singh@protomail.ch]
#

require 'sinatra'

$lunarDates = Array.new(50)

# year, m, d
$lunarDates.push(Date.new(2018,1,1),
                Date.new(2018,1,31),
                Date.new(2018,3,1),
                Date.new(2018,3,31),
                Date.new(2018,4,29),
                Date.new(2018,5,29),
                Date.new(2018,6,28),
                Date.new(2018,7,27),
                Date.new(2018,8,26),
                Date.new(2018,9,24),
                Date.new(2018,10,24),
                Date.new(2018,11,23),
                Date.new(2018,12,22))

# 2019 full moons
$lunarDates.push(Date.new(2019,1,21),
                Date.new(2019,2,19),
                Date.new(2019,3,20),
                Date.new(2019,4,19),
                Date.new(2019,5,18),
                Date.new(2019,6,17),
                Date.new(2019,7,16),
                Date.new(2019,8,15),
                Date.new(2019,9,14),
                Date.new(2019,10,13),
                Date.new(2019,11,12),
                Date.new(2019,12,12))

months = ['Chet',
          'Vaisakh',
          'Jeth',
          'Harh',
          'Sawan',
          'Bhadon',
          'Assu',
          'Kattak',
          'Magghar',
          'Poh',
          'Magh',
          'Phagan']

# Based on date entered calculate date
def convertDate(dato)
  @lastItem
  $lunarDates.each do |item|
    if dato > item && dato < @lastItem
      puts "Ok"
    end
    @lastItem = item
  end

  return "Chet" + " " + 2075.to_s
end

get '/' do
  currentDate = DateTime.now
  outputFile = "output.txt"

  File.open(outputFile, 'w') { |file| file.write(currentDate) }
  send_file 'output.txt'
end

get '/AD2Bikrami' do
  currentDate = DateTime.now
  outputFile = "output.txt"

  File.open(outputFile, 'w') { |file| file.write(currentDate) }
  send_file 'output.txt'
end

get '/AD2Bikrami/:month/:day/:year' do
  year = params['year']
  day = params['day']
  month = params['month']

  dato = Date.new(year.to_i,month.to_i,day.to_i) + 4

  # compare
  # currentDate = "You entered" + dato.to_s
  currentDate = convertDate(dato)
  outputFile = "output.txt"

  File.open(outputFile, 'w') { |file| file.write(currentDate) }
  send_file 'output.txt'
end

not_found do
  status 404
  outputFile = "output.txt"
  File.open(outputFile, 'w') { |file| file.write("error invalid route") }
  send_file 'output.txt'
end
