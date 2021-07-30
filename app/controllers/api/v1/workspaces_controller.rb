# frozen_string_literal: true

module Api
  module V1
    class WorkspacesController < ApplicationController
      before_action :set_workspace, only: %i[show update destroy]

      # GET /workspaces
      # GET /workspaces.json
      def index
        @workspaces = Workspace.all
      end

      # GET /workspaces/1
      # GET /workspaces/1.json
      def show; end

      # POST /workspaces
      # POST /workspaces.json
      def create
        @workspace = Workspace.new(workspace_params)

        if @workspace.save
          render :show, status: :created, location: api_workspace_url(@workspace, format: :json)
        else
          render json: @workspace.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /workspaces/1
      # PATCH/PUT /workspaces/1.json
      def update
        if @workspace.update(workspace_params)
          render :show, status: :ok, location: api_workspace_url(@workspace, format: :json)
        else
          render json: @workspace.errors, status: :unprocessable_entity
        end
      end

      # DELETE /workspaces/1
      # DELETE /workspaces/1.json
      def destroy
        @workspace.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_workspace
        @workspace = Workspace.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def workspace_params
        params.require(:workspace).permit(:name, :description, :slug, :order, :favorite)
      end
    end
  end
end
