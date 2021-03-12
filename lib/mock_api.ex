defmodule RateLimitedClient.MockAPI do
  require Logger

  def create_payment(user_id, new_payment_info) do
    Logger.info("create_payment")
    Process.sleep(random_latency())

    %{
      status: 201,
      user_id: user_id,
      payment: new_payment_info
    }
  end

  # Do something with the resp here
  def handle_create_payment(_resp), do: Logger.info("handle_create_payment")

  def delete_payment(user_id, payment_id) do
    Logger.info("delete_payment")
    Process.sleep(random_latency())

    %{
      status: 204,
      user_id: user_id,
      id: payment_id
    }
  end

  # Do something with the resp here
  def handle_delete_payment(_resp), do: Logger.info("handle_delete_payment")

  def charge_payment(user_id, payment_id, amount) do
    Logger.info("charge_payment")
    Process.sleep(random_latency())

    %{
      status: 200,
      user_id: user_id,
      amount: amount,
      id: payment_id,
      payment_processed: Enum.random(~w(success failed))
    }
  end

  # Do something with the resp here
  def handle_charge_payment(_resp), do: Logger.info("handle_charge_payment")

  defp random_latency do
    Enum.random(100..400)
  end
end
