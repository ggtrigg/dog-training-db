module CalendarHelper
  def calendar(date = Date.current, &block)
    Calendar.new(self, date, block).table
  end
end
