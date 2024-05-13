# frozen_string_literal: true

require "active_support/concern"

module AccessControlConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_access_control_allow_origin_to_localhost

    def set_access_control_allow_origin_to_localhost
      response.set_header("Access-Control-Allow-Origin", "http://localhost:5173")
    end
  end
end
