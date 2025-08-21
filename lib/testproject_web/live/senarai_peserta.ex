defmodule TestprojectWeb.SenaraiPesertaLive do
  use TestprojectWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full min-h-screen bg-gray-100 flex">
       <!-- Sidebar -->
    <.live_component module={TestprojectWeb.SidebarComponent} id="sidebar" current_view={@socket.view} />

      <!-- Main Content -->
      <div class="flex-1 flex flex-col">
        <!-- Header -->
        <header class="bg-white shadow-sm border-b border-gray-200">
          <div class="flex justify-between items-center px-6 py-4">
            <div class="flex items-center space-x-4">
              <div class="flex items-center gap-4">
                <div class="text-2xl">🎓</div>
                <div>
                  <h1 class="text-xl font-semibold text-gray-800">Kursus Hub Admin Dashboard</h1>
                </div>
              </div>
            </div>
            <div class="flex items-center space-x-4">
              <span class="text-gray-600">admin@gmail.com</span>
              <button class="text-gray-600 hover:text-gray-800">Logout</button>
              <div class="w-8 h-8 bg-gray-300 rounded-full"></div>
            </div>
          </div>
        </header>

        <!-- Main Content Area -->
        <div class="flex-1 p-6 bg-gray-50">
          <!-- Page Header -->
          <div class="mb-8">
            <div class="flex items-center justify-between">
              <div>
                <div class="flex items-center space-x-2 mb-2">
                  <div class="text-2xl">🎓</div>
                  <h2 class="text-3xl font-semibold text-gray-800">Dashboard Admin Kursus</h2>
                </div>
                <h1 class="text-4xl font-bold text-gray-900 mb-2">Peserta</h1>
                <p class="text-gray-600">Pantau dan urus semua peserta kursus</p>
              </div>
              <button class="bg-gray-200 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-300">+ Tambah peserta</button>
            </div>
          </div>

          <!-- Statistics Cards -->
          <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <!-- Jumlah Peserta -->
            <div class="bg-white rounded-lg p-6 shadow-sm border">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-gray-600 mb-1">Jumlah peserta</p>
                  <p class="text-3xl font-bold text-gray-900">50</p>
                </div>
                <div class="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center">
                  <svg class="w-6 h-6 text-gray-600" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3z"/>
                  </svg>
                </div>
              </div>
            </div>

            <!-- Peserta Aktif -->
            <div class="bg-white rounded-lg p-6 shadow-sm border">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-gray-600 mb-1">Peserta aktif</p>
                  <p class="text-3xl font-bold text-gray-900">50</p>
                </div>
                <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                  <svg class="w-6 h-6 text-green-600" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                  </svg>
                </div>
              </div>
            </div>

            <!-- Tamat Kursus -->
            <div class="bg-white rounded-lg p-6 shadow-sm border">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-gray-600 mb-1">Tamat kursus</p>
                  <p class="text-3xl font-bold text-gray-900">50</p>
                </div>
                <div class="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center">
                  <svg class="w-6 h-6 text-gray-600" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"/>
                  </svg>
                </div>
              </div>
            </div>

            <!-- Kadar Kehadiran -->
            <div class="bg-white rounded-lg p-6 shadow-sm border">
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-gray-600 mb-1">Kadar Kehadiran</p>
                  <p class="text-3xl font-bold text-gray-900">99 %</p>
                </div>
                <div class="w-12 h-12 bg-emerald-100 rounded-lg flex items-center justify-center">
                  <svg class="w-6 h-6 text-emerald-600" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M11 17a1 1 0 01-.707-.293l-5-5a1 1 0 111.414-1.414L11 14.586l7.293-7.293a1 1 0 111.414 1.414l-8 8A1 1 0 0111 17z"/>
                  </svg>
                </div>
              </div>
            </div>
          </div>

          <!-- Section: Senarai Semua Kategori Kursus -->
          <div class="bg-white rounded-lg shadow-sm border mb-8">
            <div class="px-6 py-3 bg-gray-100 border-b rounded-t-lg">
              <h3 class="text-sm font-semibold text-gray-700">Senarai Semua Kategori Kursus</h3>
            </div>
            <div class="overflow-x-auto">
              <table class="w-full">
                <thead class="bg-gray-50">
                  <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Bil.</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kategori Kursus</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Jumlah Kursus</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tindakan</th>
                  </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                  <tr>
                    <td class="px-6 py-3 text-sm text-gray-700">1</td>
                    <td class="px-6 py-3 text-sm text-gray-900">Teknologi</td>
                    <td class="px-6 py-3 text-sm text-gray-700">3</td>
                    <td class="px-6 py-3 text-sm"><button class="text-blue-700 hover:underline">Lihat</button></td>
                  </tr>
                  <tr>
                    <td class="px-6 py-3 text-sm text-gray-700">2</td>
                    <td class="px-6 py-3 text-sm text-gray-900">Kulinari</td>
                    <td class="px-6 py-3 text-sm text-gray-700">3</td>
                    <td class="px-6 py-3 text-sm"><button class="text-blue-700 hover:underline">Lihat</button></td>
                  </tr>
                  <tr>
                    <td class="px-6 py-3 text-sm text-gray-700">3</td>
                    <td class="px-6 py-3 text-sm text-gray-900">Kecantikan</td>
                    <td class="px-6 py-3 text-sm text-gray-700">2</td>
                    <td class="px-6 py-3 text-sm"><button class="text-blue-700 hover:underline">Lihat</button></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <!-- Section: Senarai Kursus Mengikut Kategori : Teknologi -->
          <div class="bg-white rounded-lg shadow-sm border">
            <div class="px-6 py-3 bg-gray-100 border-b rounded-t-lg">
              <h3 class="text-sm font-semibold text-gray-700">Senarai Kursus Mengikut Kategori : Teknologi</h3>
            </div>

            <!-- Search/Filter Bar -->
            <div class="px-6 py-4 flex flex-col md:flex-row gap-4 items-center">
              <div class="relative w-full md:flex-1">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                  <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"/>
                  </svg>
                </div>
                <input type="text" placeholder="# carian nama kursus" class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" />
              </div>
              <div class="relative w-full md:w-56">
                <select class="block w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 appearance-none bg-white">
                  <option>Status Kursus</option>
                  <option>Semua</option>
                  <option>AKTIF</option>
                  <option>TUTUP</option>
                </select>
                <div class="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
                  <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"/>
                  </svg>
                </div>
              </div>
            </div>

            <div class="overflow-x-auto">
              <table class="w-full">
                <thead class="bg-gray-50">
                  <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Bil.</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Kursus</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Jumlah Peserta</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status Kursus</th>
                  </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                  <tr>
                    <td class="px-6 py-3 text-sm text-gray-700">1</td>
                    <td class="px-6 py-3 text-sm text-gray-900">Web Development</td>
                    <td class="px-6 py-3 text-sm text-gray-700">25</td>
                    <td class="px-6 py-3 text-sm"><span class="inline-flex px-2 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">AKTIF</span></td>
                  </tr>
                  <tr>
                    <td class="px-6 py-3 text-sm text-gray-700">2</td>
                    <td class="px-6 py-3 text-sm text-gray-900">Asas Komputer</td>
                    <td class="px-6 py-3 text-sm text-gray-700">250</td>
                    <td class="px-6 py-3 text-sm"><span class="inline-flex px-2 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">AKTIF</span></td>
                  </tr>
                  <tr>
                    <td class="px-6 py-3 text-sm text-gray-700">3</td>
                    <td class="px-6 py-3 text-sm text-gray-900">Programming Language</td>
                    <td class="px-6 py-3 text-sm text-gray-700">50</td>
                    <td class="px-6 py-3 text-sm"><span class="inline-flex px-2 py-1 rounded-full text-xs font-semibold bg-gray-200 text-gray-800">TUTUP</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
