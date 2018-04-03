class PagesController < ApplicationController
  def top
    # sp = SerialPort.open('/dev/cu.usbmodem1421', 9600, 8, 1, 0)
    # @line = sp.readline
    @line = ""
    SerialPort.open('/dev/cu.usbmodem1421', 9600, 8, 1, 0) do |sp|
      sp.read_timeout = 10000000
      loop do
        begin
          @line += sp.readline
          @time = Time.now
          #時間によっているいないを判定する
          # if sp.readline > 110 && sp.readline < 500
          #   puts "いる"
          # else
          #   puts "いない"
          # end
        rescue EOFError
          break
        end
      end
    end
  end
end
