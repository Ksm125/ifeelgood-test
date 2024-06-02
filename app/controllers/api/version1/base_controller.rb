# frozen_string_literal: true

module Api
  module Version1
    # Base controller for API version 1
    class BaseController < ApplicationController
      include Pagy::Backend

      protected

      # This is a basic helper method to render JSON response
      def render_json(data, status: :ok)
        render json: {data: }, status:
      end
    end
  end
end
