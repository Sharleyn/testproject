defmodule Testproject.Kursus.KursusKategori do
  use Ecto.Schema
  import Ecto.Changeset

  schema "kursus_kategori" do
    field :kategori, :string


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(kursus_kategori, attrs) do
    kursus_kategori
    |> cast(attrs, [:kategori])
    |> validate_required([:kategori])
  end
end
