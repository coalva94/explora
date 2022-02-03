class PagesController < ApplicationController
  def home
    @tours_near = Tour.all + Tour.all + Tour.all # debemos filtrar los Tours que esten cerca del lugar donde el usuario abre nuestra paginas
  end
end
