defmodule WabanexWeb.Resolvers.User do
  def create(%{input: params}, _context) do
    params
    |> Wabanex.Users.Create.call()
  end
  def get(%{id: user_id}, _context) do
    user_id
    |> Wabanex.Users.Get.call()
  end
end
