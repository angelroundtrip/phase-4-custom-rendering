class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # serialization below
    render json: cheeses, only: [:id, :name, :price, :is_best_seller]

    # Alternate option
    # cheeses = Cheese.all
    # render json: cheeses, except: [:created_at, :updated_at]
  end

  # GET /cheeses/:id
  # JSON response contains an additional key-value pair, in which the key is the name of the method and the value is the result of calling the method for the current Cheese object
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      # status: :not_found will produce a 404 status code
      render json: { error: 'Cheese not found' }, status: :not_found
    end
  end

end
