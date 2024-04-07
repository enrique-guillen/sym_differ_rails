# frozen_string_literal: true

# Inherits from ActiveRecord::Base and acts as an abstract class for Rails models. 
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
