defmodule CyrelasWeb.ClassView do
  use CyrelasWeb, :view
  alias CyrelasWeb.ClassView

  def render("index.json", %{classes: classes}) do
    %{data: render_many(classes, ClassView, "class.json")}
  end

  def render("show.json", %{class: class}) do
    %{data: render_one(class, ClassView, "class.json")}
  end

  def render("class.json", %{class: class}) do
    %{
      id: class.id,
      name: class.name,
      type: class.type
    }
  end
end
