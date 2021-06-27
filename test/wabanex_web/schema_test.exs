defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.{User, Users}

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{email: "teste@teste.com", name: "test", password: "testtest"}

      {:ok, %User{id: user_id}} = Users.Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            name
            email
          }
        }
      """

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "teste@teste.com",
            "name" => "test"
          }
        }
      }

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, create the user", %{conn: conn} do

      mutation = """
        mutation {
          createUser(input: {
            name: "test", email: "test@test.com", password: "testtest"
          }) {
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

        assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "test"}}} = response
    end
  end
end
