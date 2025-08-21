defmodule Testproject.Repo.Migrations.RemoveTindakanFromKursusKategori do
  use Ecto.Migration

  def change do
    alter table(:kursus_kategori) do
      remove :tindakan
    end
  end
end
