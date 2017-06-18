defmodule Neko.Achievement.Store.Supervisor do
  @moduledoc """
  Used to group stores.
  """

  use Supervisor

  alias Neko.Achievement.Store
  alias Neko.Achievement.Store.Supervisor, as: StoreSupervisor

  @name StoreSupervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def start_store do
    Supervisor.start_child(@name, [])
  end

  def init(:ok) do
    children = [
      worker(Store, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
