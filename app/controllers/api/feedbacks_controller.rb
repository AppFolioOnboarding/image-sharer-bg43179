module Api
  class FeedbacksController < ApplicationController
    def create
      if params[:name].present? && params[:comment].present?
        render json: { text: 'success' }, status: :created
      else
        render json: { error: 'error' }, status: :unprocessable_entity
      end
    end
  end
end
