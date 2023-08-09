class MembershipsController < ApplicationController

    def create
       membership =  Membership.find_by(membership_params)
       if membership
        duplicate_response
       else
        new_membership = Membership.create(membership_params)
        render json: new_membership, status: :created
       end
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def duplicate_response
        render json: {error: "Membership already created"}, status: :unprocessable_entity
    end

end
