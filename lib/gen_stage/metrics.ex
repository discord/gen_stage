defmodule GenStage.Metrics do
  @moduledoc false

  use Instruments.CustomFunctions, prefix: "gen_stage"

  @doc """
  Returns the registered name of the current process or nil.
  """
  def metrics_self_name() do
    case :erlang.process_info(self(), :registered_name) do
      {:registered_name, name} when is_atom(name) -> name
      _ -> nil
    end
  end
end
