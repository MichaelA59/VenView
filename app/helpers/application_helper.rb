module ApplicationHelper
  def show_errors(object, field_name)
    error_array = []
    if object.errors.any?
      object.errors.full_messages.each do |error|
        if error.include?(field_name.to_s.capitalize)
          error_array << error
        end
      end
      return error_array.join(", ")
    end
    return nil
  end
end
