class PagesController < ApplicationController
  def top
    @students = Student.all
    @lab_status =
      if LabStatus.where(light_entry: '1').last.present?
        '研究室の鍵が開いてます'
      else
        '研究室の鍵が開いていません。早く登校して鍵を開けてください！'
      end
  end
end
