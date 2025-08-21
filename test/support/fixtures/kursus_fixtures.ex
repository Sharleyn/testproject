defmodule Testproject.KursusFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Testproject.Kursus` context.
  """

  @doc """
  Generate a kursus_kategori.
  """
  def kursus_kategori_fixture(attrs \\ %{}) do
    {:ok, kursus_kategori} =
      attrs
      |> Enum.into(%{
        kategori: "some kategori",
        tindakan: "some tindakan"
      })
      |> Testproject.Kursus.create_kursus_kategori()

    kursus_kategori
  end

  @doc """
  Generate a kursuss.
  """
  def kursuss_fixture(attrs \\ %{}) do
    {:ok, kursuss} =
      attrs
      |> Enum.into(%{
        anjuran: "some anjuran",
        gambar_anjuran: "some gambar_anjuran",
        gambar_kursus: "some gambar_kursus",
        had_umur: 42,
        kuota: 42,
        nama_kursus: "some nama_kursus",
        status_kursus: "some status_kursus",
        syarat_pendidikan: "some syarat_pendidikan",
        syarat_penyertaan: "some syarat_penyertaan",
        tarikh_akhir: ~D[2025-08-19],
        tarikh_mula: ~D[2025-08-19],
        tarikh_tutup: ~D[2025-08-19],
        tempat: "some tempat"
      })
      |> Testproject.Kursus.create_kursuss()

    kursuss
  end
end
