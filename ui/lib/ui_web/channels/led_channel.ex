defmodule UiWeb.LedChannel do
  use Phoenix.Channel
  alias Nerves.Leds

  def join("led:green", _message, socket) do
    {:ok, socket}
  end

  def handle_in("toggle", %{"body" => body}, socket) do
    broadcast! socket, "toggle", %{body: body}
    Leds.set "led0", true
    {:noreply, socket}
  end
end
