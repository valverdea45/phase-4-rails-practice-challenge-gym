class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

    def show
        client = find_client
        render json: client, status: :ok
    end

    private

    def client_params
        params.permit(:id)
    end

    def find_client
        Client.find_by!(client_params)
    end

    def record_not_found_response
        render json: { errors: "Client not found" }, status: :not_found
    end

end
