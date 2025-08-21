defmodule Testproject.Repo.Migrations.CreateKursusKategori do
  use Ecto.Migration

  def change do
    create table(:kursus_kategori) do
      add :kategori, :string
      add :tindakan, :text

      timestamps(type: :utc_datetime)
    end
  end
end
