defmodule TestprojectWeb.LoginLive do
  use TestprojectWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, error: nil)}
  end

  @impl true
  def handle_event("login", %{"email" => email, "password" => password}, socket) do
    if email == "admin@gmail.com" and password == "secret123" do
      {:noreply, push_navigate(socket, to: ~p"/admin/dashboard")}
    else
      {:noreply, assign(socket, :error, "Email atau password salah")}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex items-center justify-center min-h-screen bg-gray-100">
      <div class="bg-white shadow-md rounded-lg p-8 w-96">
        <h2 class="text-2xl font-bold mb-6 text-center">Login Admin</h2>

        <form phx-submit="login" class="space-y-4">
          <input type="text" name="email" placeholder="Email" class="w-full p-2 border rounded"/>
          <input type="password" name="password" placeholder="Password" class="w-full p-2 border rounded"/>
          <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded">Login</button>
        </form>

        <%= if @error do %>
          <p class="text-red-600 mt-4"><%= @error %></p>
        <% end %>
      </div>
    </div>
    """
  end
end
