defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "Flávio",
        email: "flaviohugo.2000@gmail.com",
        password: "123456"
      }

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: ^params,
        errors: []
      } = response
    end
  end
end
