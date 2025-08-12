defmodule TestprojectWeb.HomeLive do
  use TestprojectWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
