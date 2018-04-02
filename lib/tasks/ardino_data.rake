# namespace :ardino_data do
#   desc 'Ardinoで取得した照明の明るさの値を取得する'
#   task :reciever => :environment do
#     require 'serialport'
#     port = '/dev/cu.usbmodemFA131'
#     sp = SerialPort.new(port, 9600, 8, 1, SerialPort::NONE)
#
#     temp = sp.gets
#
#     puts temp
#     puts a
#   end
# end
