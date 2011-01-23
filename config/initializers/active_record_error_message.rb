class ActiveRecord::Base
  def error_text
    self.errors.full_messages.join("\n")
  end
end