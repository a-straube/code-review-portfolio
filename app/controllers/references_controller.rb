class ReferencesController < ApplicationController
  def index
    @references = Reference.all
  end

  def create
  end
end
