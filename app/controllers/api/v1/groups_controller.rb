# frozen_string_literal: true

module Api
  module V1
    class GroupsController < ApplicationController
      before_action :set_group, only: %i[show update destroy]

      # GET /groups
      # GET /groups.json
      def index
        @groups = Group.all
      end

      # GET /groups/1
      # GET /groups/1.json
      def show; end

      # POST /groups
      # POST /groups.json
      def create
        @group = Group.new(group_params)

        if @group.save
          render :show, status: :created, location: api_group_url(@group, format: :json)
        else
          render json: @group.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /groups/1
      # PATCH/PUT /groups/1.json
      def update
        if @group.update(group_params)
          render :show, status: :ok, location: api_group_url(@group, format: :json)
        else
          render json: @group.errors, status: :unprocessable_entity
        end
      end

      # DELETE /groups/1
      # DELETE /groups/1.json
      def destroy
        @group.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_group
        @group = Group.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def group_params
        params.require(:group).permit(:name, :slug, :favorite, :order)
      end
    end
  end
end
