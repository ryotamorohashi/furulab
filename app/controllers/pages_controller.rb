require 'serialport'
class PagesController < ApplicationController
  def top
    port = '/dev/cu.usbmodemFA131'
    baud_rate = 9600

    STDOUT.sync = true

    SerialPort.open(port, baud_rate) do |sp|
      sp.read_timeout = 10
      loop do
        begin
          temp = sp.readline
        rescue EOFError
          retry
        end
      end
    end
    @serial_data = temp
  end
end
