# frozen_string_literal: true

module ApplicationCable
  # Authorize the incomming connection and proceeed to establish it if the user can be identified.
  class Connection < ActionCable::Connection::Base
  end
end
