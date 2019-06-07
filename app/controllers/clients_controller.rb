class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all.order_by(:ip)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  def update_client
    client = Client.find_or_create_by(ip: params[:ip])
    # :ip, :cpu, :ram, :server, :active
    client.cpu = params[:cpu]
    client.ram = params[:ram]
    client.os = params[:os]
    client.version = params[:version]
    client.ranking = client.get_ranking
    client.save

    if client.save
      render json: { server: client.is_best, clients: client.clients }
    else
      render json: client.errors, status: :unprocessable_entity
    end
  end

  def activate
    client = Client.find_or_create_by(ip: params[:ip])
    client.active = true
    client.save
    render json: client
  end

  def deactivate
    client = Client.find_or_create_by(ip: params[:ip])
    client.active = false
    client.save
    render json: client
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    if @client.save
      render :show, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    if @client.update(client_params)
      render :show, status: :ok, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:ip, :cpu, :ram, :server, :active, :os, :version)
    end
end
