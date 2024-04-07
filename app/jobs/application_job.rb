# frozen_string_literal: true

# Inherits from ActiveJob::Base and acts as an abstract class for Rails jobs.
class ApplicationJob < ActiveJob::Base
  retry_on ActiveRecord::Deadlocked

  discard_on ActiveJob::DeserializationError
end
