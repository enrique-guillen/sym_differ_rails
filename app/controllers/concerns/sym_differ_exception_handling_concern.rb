# frozen_string_literal: true

require "active_support/concern"

module SymDifferExceptionHandlingConcern
  extend ActiveSupport::Concern

  included do
    def handle_sym_differ_error(exception)
      @sym_differ_exception = exception.cause || exception
      view_name = view_name_for_exception_cause(exception)

      render sym_differ_global_exception_view_path(view_name),
             status: :unprocessable_entity,
             formats: %i[json]
    end

    def sym_differ_global_exception_view_path(exception_name)
      "global_exceptions/#{exception_name}"
    end

    def view_name_for_exception_cause(exception)
      return underscore_class_name(exception.cause) if exception.cause

      underscore_class_name(exception)
    end

    def underscore_class_name(object)
      object.class.name.underscore.split("/").last
    end
  end
end
