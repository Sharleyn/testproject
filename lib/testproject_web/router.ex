defmodule TestprojectWeb.Router do
  use TestprojectWeb, :router

  import TestprojectWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TestprojectWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestprojectWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/admin", TestprojectWeb do
    pipe_through :browser
    live "/dashboard", AdminDashboardLive
    live "/kursus", KursusLive
    live "/permohonan", PermohonanLive
    live "/peserta", PesertaLive
    live "/elaunpekerja", ElaunPekerjaLive
    live "/tetapan", TetapanLive

    live "/kursus/senarai", KursusSenaraiLive
    live "/kursus/tambah", KursusTambahLive
    live "/kursus/kategori", KursusKategoriLive

    live "/peserta/senaraipeserta", SenaraiPesertaLive

    live "/elaunpekerja/senaraituntutan", SenaraiTuntutanLive
    live "/elaunpekerja/buattuntutanbaru", BuatTuntutanBaruLive
    live "/elaunpekerja/senaraipekerja", SenaraiPekerjaLive
  end



  # Other scopes may use custom stacks.
  # scope "/api", TestprojectWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:testproject, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/admin", TestprojectWeb do
      pipe_through :browser
      live "/dashboard", AdminDashboardLive
      live "/kursus", KursusLive
      live "/permohonan", PermohonanLive
      live "/peserta", PesertaLive
      live "/elaunpekerja", ElaunPekerjaLive
      live "/tetapan", TetapanLive

      live "/kursus/senarai", KursusSenaraiLive
      live "/kursus/tambah", KursusTambahLive
      live "/kursus/kategori", KursusKategoriLive

      live "/peserta/senaraipeserta", SenaraiPesertaLive

      live "/elaunpekerja/senaraituntutan", SenaraiTuntutanLive
      live "/elaunpekerja/buattuntutanbaru", BuatTuntutanBaruLive
      live "/elaunpekerja/senaraipekerja", SenaraiPekerjaLive
    end

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TestprojectWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", TestprojectWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{TestprojectWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", TestprojectWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{TestprojectWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
    end
  end

  scope "/", TestprojectWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{TestprojectWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
