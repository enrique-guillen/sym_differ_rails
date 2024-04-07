# frozen_string_literal: true

# Inherits from ActionMailer::Base and acts as an abstract class for Rails mailer classes.
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
