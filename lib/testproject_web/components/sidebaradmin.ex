defmodule TestprojectWeb.SidebarComponent do
  use Phoenix.LiveComponent
  use TestprojectWeb, :html

  @impl true
  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign_new(:kursus_open, fn -> false end)
      |> assign_new(:peserta_open, fn -> false end)
      |> assign_new(:elaunpekerja_open, fn -> false end)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-64 bg-blue-900 text-white">
      <!-- Logo Section -->
      <div class="p-6 border-b border-blue-800">
        <div class="flex items-center space-x-3">
          <div class="text-3xl">🎓</div>
          <div>
            <div class="font-bold text-lg">SPKP</div>
            <div class="text-sm text-blue-200">Admin Dashboard</div>
          </div>
        </div>
      </div>

      <!-- Navigation Menu -->
      <nav class="p-4">
        <div class="text-sm font-semibold text-blue-300 mb-4">Menu Utama</div>

        <!-- Dashboard -->
        <.link navigate={~p"/admin/dashboard"} class="block p-3 mb-2 rounded-lg hover:bg-gray-700">
          Dashboard
        </.link>

        <!-- Kursus -->
        <div>
          <div phx-click="toggle_kursus" phx-target={@myself}
               class="block p-3 mb-2 rounded-lg hover:bg-gray-700 cursor-pointer flex justify-between items-center">
            <span>Kursus</span>
          </div>
          <%= if @kursus_open do %>
            <div class="ml-4">
              <.link navigate={~p"/admin/kursus/kategori"} class="block p-2 mb-1 hover:bg-gray-600 text-sm">
                Kategori Kursus
              </.link>
              <.link navigate={~p"/admin/kursus/senarai"} class="block p-2 mb-1 hover:bg-gray-600 text-sm">
                Senarai Kursus
              </.link>
              <.link navigate={~p"/admin/kursus/tambah"} class="block p-2 mb-1 hover:bg-gray-600 text-sm">
                Tambah Kursus
              </.link>
            </div>
          <% end %>
        </div>


        <!-- Permohonan -->
        <.link navigate={~p"/admin/permohonan"} class="block p-3 mb-2 rounded-lg hover:bg-gray-700">
          Permohonan
        </.link>

        <!-- Peserta -->
        <div>
          <div phx-click="toggle_peserta" phx-target={@myself}
               class="block p-3 mb-2 rounded-lg hover:bg-gray-700 cursor-pointer flex justify-between items-center">
            <span>Peserta</span>
          </div>
          <%= if @peserta_open do %>
            <div class="ml-4">
              <.link navigate={~p"/admin/peserta/senaraipeserta"} class="block p-2 mb-1 hover:bg-gray-600 text-sm">
                Senarai Peserta
              </.link>
            </div>
          <% end %>
        </div>

        <!-- Elaun Pekerja -->
        <div>
          <div phx-click="toggle_elaunpekerja" phx-target={@myself}
               class="block p-3 mb-2 rounded-lg hover:bg-gray-700 cursor-pointer flex justify-between items-center">
            <span>Elaun Pekerja</span>
          </div>
          <%= if @elaunpekerja_open do %>
            <div class="ml-4">
              <.link navigate={~p"/admin/elaunpekerja/senaraituntutan"} class="block p-2 mb-1 hover:bg-gray-600 text-sm">
                Senarai Tuntutan
              </.link>
              <.link navigate={~p"/admin/elaunpekerja/buattuntutanbaru"} class="block p-2 mb-1 hover:bg-gray-600 text-sm">
                Buat Tuntutan Baru
              </.link>
               <.link navigate={~p"/admin/elaunpekerja/senaraipekerja"} class="block p-2 mb-1 hover:bg-gray-600 text-sm">
                Senarai Pekerja
              </.link>
            </div>
          <% end %>
        </div>

        <!-- Tetapan -->
        <.link navigate={~p"/admin/tetapan"} class="block p-3 mb-2 rounded-lg hover:bg-gray-700">
          Tetapan
        </.link>
      </nav>
    </div>
    """
  end

  # EVENTS
  @impl true
  def handle_event("toggle_kursus", _, socket) do
    {:noreply, socket
      |> assign(:kursus_open, !socket.assigns.kursus_open)
      |> assign(:peserta_open, false)
      |> assign(:elaunpekerja_open, false)}
  end

  @impl true
  def handle_event("toggle_peserta", _, socket) do
    {:noreply, socket
      |> assign(:peserta_open, !socket.assigns.peserta_open)
      |> assign(:kursus_open, false)
      |> assign(:elaunpekerja_open, false)}
  end

  @impl true
  def handle_event("toggle_elaunpekerja", _, socket) do
    {:noreply, socket
      |> assign(:elaunpekerja_open, !socket.assigns.elaunpekerja_open)
      |> assign(:kursus_open, false)
      |> assign(:peserta_open, false)}
  end
end
