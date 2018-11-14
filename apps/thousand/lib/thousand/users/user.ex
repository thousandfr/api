defmodule Thousand.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Comeonin.Pbkdf2
  alias Ecto.Changeset
  alias Thousand.User

  schema "users" do
    field(:email, :string)
    field(:username, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :username, :password, :password_confirmation])
    |> validate_required([:email, :username, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> put_pass_hash()
  end

  @doc false
  defp put_pass_hash(%Changeset{valid?: true} = changeset) do
    password = changeset.changes.password
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
