module TaskHelper
    def show_check_icon(boolean_value)
        if boolean_value then 
          data = "<i class='fas fa-check'></i>"
        else 
          data = "<i class='fas fa-times'></i>"
        end
        data.html_safe
    end

    def change_date_format(date_value)
        months = ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec']
        month = months[date_value[3,2].to_i - 1]
        day = date_value[0,2].to_i
        year = date_value[6,4].to_i
        date = month.to_s + " " + day.to_s + ", " + year.to_s

        date.html_safe
    end
end
