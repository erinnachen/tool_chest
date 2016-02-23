class ToolsController < ApplicationController
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
      flash[:notice] = "Tool successfully created"
      redirect_to tool_path(@tool.id)
    else
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

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
