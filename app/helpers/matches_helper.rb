module MatchesHelper

  # Converts time zone format
  def convert_datetime(time)
    ord_day = Time.zone.parse(time.to_s)
    Time.zone.parse(time.to_s).strftime("%l:%M%P %a %b #{ord_day.day.ordinalize}, %Y")
  end
end

