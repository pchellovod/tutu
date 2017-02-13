class Admin::RoutesController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show; end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route], notice: 'Route created'
    else
      render :new
    end
  end

  def edit; end

  def update

    if @route.update(route_params)
      redirect_to [:admin, @route], notice: 'Route updated'
    else
      render :edit
    end
  end

  def destroy

    @route.destroy
    redirect_to admin_routes_url
  end

  private

  def set_train
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end
end
