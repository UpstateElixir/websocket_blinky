defmodule UiWeb.LedChannel do
  use Phoenix.Channel
  alias Nerves.Leds

  def join("led:green", _message, socket) do
    {:ok, socket}
  end

  def handle_in("toggle", %{"active" => active}, socket) do
    broadcast! socket, "toggle", %{active: active}
    Leds.set "led0", active
    {:noreply, socket}
  end
end
