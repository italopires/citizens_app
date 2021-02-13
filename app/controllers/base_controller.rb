class BaseController < ApplicationController
  def index
    @objects = object_class.all
  end

  def new
    @object = object_class.new
  end

  def create
    @object = object_class.new permitted_params

    if @object.save
      redirect_to after_save_path, notice: t('notices.created', model: object_class.model_name.human)
    else
      render :new
    end
  end

  def edit
    @object = object_class.find params[:id]
  end

  def update
    @object = object_class.find params[:id]

    if @object.update(permitted_params)
      redirect_to after_save_path, notice: t('notices.updated', model: object_class.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @object = object_class.find params[:id]

    @object.destroy

    redirect_to after_save_path, notice: t('notices.destroyed', model: object_class.model_name.human)
  end

  private

  def permitted_params
    raise 'This method should be implemented'
  end

  def object_class
    controller_name.singularize.camelize.constantize
  end

  def after_save_path
    raise 'This method should be implemented'
  end
end