class ToolsController < ApplicationController
  helper_method :most_recent_tool, :current_tool_summary

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      session[:current_tool_count] = session[:current_tool_count].to_i + @tool.quantity
      session[:current_potential_revenue] = session[:current_potential_revenue].to_f + @tool.quantity*@tool.formatted_price
      session[:most_recent_tool_id] = @tool.id
      flash[:notice] = "Tool successfully created"
      redirect_to tool_path(@tool.id)
    else
      flash.now[:error] = @tool.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
    if @tool.save
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end
  end

  def destroy
    Tool.destroy(params[:id])
    redirect_to tools_path
  end

  def most_recent_tool
    @most_recent_tool = Tool.find_or_initialize_by(id: session[:most_recent_tool_id])
  end

  def current_tool_summary
    "Current tool count: #{session[:current_tool_count].to_i}
     Current potential revenue: $#{session[:current_potential_revenue].to_f}"
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

end
