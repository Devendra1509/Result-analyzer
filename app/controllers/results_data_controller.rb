class ResultsDataController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		result = ResultData.new(result_params)
		if result.save
			render json: {message:'successful data enter'}
		else 
			render json: {error: result.errors.full_messages}
	    end
	end

	def index
		@results=ResultData.all
		render json: @results
	end

	def result_params
		params.permit(:subject,:marks,:timestamp)
	end

end
