ExUnit.start

Mix.Task.run "ecto.create", ~w(-r StrategyForest.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r StrategyForest.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(StrategyForest.Repo)

