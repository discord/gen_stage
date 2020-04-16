defmodule GenStage.Metrics do
  @moduledoc false

  use Instruments.CustomFunctions, prefix: "gen_stage"

  @doc """
  Returns the registered name of the current process or nil.
  """
  def metrics_self_name() do
    case Process.info(self(), :registered_name) do
      {:registered_name, name} when is_atom(name) -> name
      _ -> "no_registered_name"
    end
  end

  @doc """
  Returns the default list of tags to use with metrics for GenStage.
  """
  def default_tags() do
    ["producer_name:#{metrics_self_name()}"]
  end
end
