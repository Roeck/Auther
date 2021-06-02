module ApplicationHelper
    def boolean_label(value)
        case value 
            when true
                content_tag(:span, value, class: "badge bg-success")
            when false 
                content_tag(:span, value, class: "badge bg-warning text-dark")
            value
        end
    end
end
