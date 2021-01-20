defmodule DiscGolfWeb.PageLive do
  use DiscGolfWeb, :live_view

  @go_time ~U[2021-01-28 17:00:00Z]

  # > Weekends don't count so that makes it 7
  # > And we are taking off early on Thursday so it's basically 6 days
  #     - Keith
  @keith 2 * 24 * 60 * 60 + 10 * 60 * 60

  @impl true
  def mount(_params, _session, socket) do
    seconds = DateTime.diff(@go_time, DateTime.utc_now())
    Process.send_after(self(), :tick, 1000)
    {:ok, assign(socket, keith_logic: false, seconds: seconds, countdown: countdown(seconds))}
  end

  def handle_event("keith-logic", _, socket) do
    seconds = socket.assigns.seconds - @keith
    {:noreply, assign(socket, keith_logic: true, seconds: seconds, countdown: countdown(seconds))}
  end

  def handle_event("normal-logic", _, socket) do
    seconds = socket.assigns.seconds + @keith

    {:noreply,
     assign(socket, keith_logic: false, seconds: seconds, countdown: countdown(seconds))}
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 1000)
    seconds = socket.assigns.seconds - 1
    {:noreply, assign(socket, seconds: seconds, countdown: countdown(seconds))}
  end

  def countdown(seconds) do
    Timex.Duration.from_seconds(seconds)
    |> Timex.Duration.to_string()
    |> Duration.parse()
    |> elem(1)
  end
end
