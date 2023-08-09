class GymsController < ApplicationController
 rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

    def show
        gym = find_gym
        render json: gym, status: :ok 
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content, status: :no_content
    end

    private

    def gym_params
        params.permit(:id)
    end

    def record_not_found_response
        render json: {error: "Gym not found"}, status: :not_found
    end

    def find_gym
        Gym.find_by!(gym_params)
    end

end
