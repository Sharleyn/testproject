defmodule TestprojectWeb.HomeLive do
  use TestprojectWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page, 1)}   # default page = 1
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="bg-blue-50 font-sans min-h-screen flex flex-col">

      <!-- HEADER -->
      <header class="bg-blue-200 shadow">
        <div class="max-w-7xl mx-auto flex justify-between items-center px-6 py-4">
          <!-- Logo -->
          <div class="flex items-center gap-4">
            <img src={~p"/images/3.png"} alt="Logo" class="h-12">
            <img src={~p"/images/7.png"} alt="Logokedua" class="h-8 -ml-8 mt-4">
            <img src={~p"/images/8.png"} alt="Logoketiga" class="h-8 -ml-6 mt-6">
            <img src={~p"/images/5.png"} alt="Logokeempat" class="h-10 -ml-7 mt-5">
            <img src={~p"/images/6.png"} alt="Logokelima" class="h-10 -ml-10 mt-7">
            <img src={~p"/images/4.png"} alt="Logokeenam" class="h-10 -ml-6 mt-7">
          </div>

          <!-- Menu atas kanan -->
          <div class="flex gap-6">
            <!-- Pengguna -->
            <div class="flex flex-col items-center">
              <img src={~p"/images/pengguna.png"} alt="Logopengguna" class="h-8">
            </div>

            <!-- Admin -->
          <div class="flex flex-col items-center">
            <img src={~p"/images/admin.png"} alt="Logoadmin" class="h-8">
            <.link navigate={~p"/login"} class="hover:underline text-sm">Admin</.link>
          </div>
          </div>
        </div>
      </header>

      <!-- Sub header -->
      <div style="background-color:#09033F;" class="border-t border-blue-300">
        <div class="max-w-7xl mx-auto px-6 py-2 text-sm text-white flex gap-4 ml-40">
          <a href="#" class="hover:underline">Laman Utama</a>
          <a href="#" class="hover:underline">Mengenai Kami</a>
          <a href="#" class="hover:underline">Program</a>
          <a href="#" class="hover:underline">Hubungi</a>
        </div>
      </div>

      <!-- Page 1 -->
      <section id="page1"
        class={"max-w-7xl mx-auto py-40 flex items-center justify-center #{if @page == 1, do: "flex", else: "hidden"}"}>
        <img src={~p"/images/3.png"} alt="Gambar Utama" class="h-64">
        <span phx-click="show_page2" class="mx-2 px-10 text-2xl cursor-pointer hover:text-gray-500">></span>
      </section>

      <!-- Page 2 -->
      <section id="page2"
        class={"max-w-7xl mx-auto py-10 px-6 grid md:grid-cols-2 gap-8 #{if @page == 2, do: "grid", else: "hidden"}"}>
        <div class="bg-white shadow-lg p-6 rounded-xl">
          <h2 class="text-xl font-bold mb-4">VISI</h2>
          <p>Menjadi sebuah organisasi terunggul...</p>
        </div>
        <div class="bg-white shadow-lg p-6 rounded-xl">
          <h2 class="text-xl font-bold mb-4">MISI</h2>
          <ul class="list-disc pl-6 space-y-2">
            <li>Menjadi penyedia khidmat terbaik</li>
            <li>Menawarkan khidmat mudah...</li>
          </ul>
        </div>
        <div class="col-span-2 flex justify-center mt-6">
          <span phx-click="show_page1" class="mx-2 text-4xl cursor-pointer hover:text-blue-500">⬅</span>
        </div>
      </section>
    </div>
    """
  end

  # Handle page switch
  @impl true
  def handle_event("show_page2", _, socket) do
    {:noreply, assign(socket, :page, 2)}
  end

  def handle_event("show_page1", _, socket) do
    {:noreply, assign(socket, :page, 1)}
  end
end
