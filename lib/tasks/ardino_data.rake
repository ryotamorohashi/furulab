require 'active_record'
namespace :ardino_data do
  desc 'Get ardino status 1 or 0'
  task :reciever => :environment do
    SerialPort.open('/dev/cu.usbmodem1421', 9600, 8, 1, 0) do |sp|
      sp.read_timeout = 10000000
      begin
        ardino_data = sp.readline.slice(0)
        time_now = Time.now

        config = YAML.load_file('./config/database.yml')

        ActiveRecord::Base.establish_connection(config["development"])

        if ardino_data == '1' && !LabStatus.where(exit_time: nil).present?
          puts '1の値を取得しています'
          lab_record = LabStatus.new
          lab_record.light_entry = ardino_data
          lab_record.entry_time = time_now
          lab_record.save
        elsif ardino_data == '0' && LabStatus.where(exit_time: nil).present?
          puts "0の値を取得しています"
          lab_record = LabStatus.where(exit_time: nil).last
          lab_record.light_entry = ardino_data
          lab_record.exit_time = time_now
          lab_record.update(light_entry: ardino_data, exit_time: time_now)

          #are_you_now status of all students change false 
          Student.all.each do |student|
            student.total_time += student.exit_time.strftime("%H").to_i - student.entry_time.strftime("%H").to_i
            student.save
          end
          Student.all.update_all(entry_time: nil, exit_time: nil, are_you_now: 0)
        else
          puts 'どちらにも含まれてない'
        end

        if @line.present?
          break
        end
      rescue EOFError
        break
      end
    end
  end
end
