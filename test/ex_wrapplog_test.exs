defmodule ExWrapplogTest do
  use ExUnit.Case
  doctest ExWrapplog

  import ExUnit.CaptureIO
  test "log method" do
    Application.put_env(:ex_wrapplog, :level, :debug)
    assert capture_io(fn  -> ExWrapplog.log(:error, "This is an error") end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is an error\",\"level\":\"error\"}\n"

    assert capture_io(fn  -> ExWrapplog.log(:error, "This is an error", %{extra: "extra"}) end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is an error\",\"level\":\"error\",\"extra\":\"extra\"}\n"
  end

  test "info method" do
    Application.put_env(:ex_wrapplog, :level, :debug)
    assert capture_io(fn  -> ExWrapplog.info("This is a useful information") end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is a useful information\",\"level\":\"info\"}\n"

    assert capture_io(fn  -> ExWrapplog.info("This is an information with params", %{extra: "extra"}) end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is an information with params\",\"level\":\"info\",\"extra\":\"extra\"}\n"
  end

  test "warn method" do
    Application.put_env(:ex_wrapplog, :level, :debug)
    assert capture_io(fn  -> ExWrapplog.warn("This is a warning") end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is a warning\",\"level\":\"warning\"}\n"

    assert capture_io(fn  -> ExWrapplog.warn("This is a warning with params", %{extra: "extra"}) end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is a warning with params\",\"level\":\"warning\",\"extra\":\"extra\"}\n"
  end

  test "error method" do
    Application.put_env(:ex_wrapplog, :level, :debug)
    assert capture_io(fn  -> ExWrapplog.error("This is an error") end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is an error\",\"level\":\"error\"}\n"

    assert capture_io(fn  -> ExWrapplog.error("This is an error with params", %{extra: "extra"}) end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is an error with params\",\"level\":\"error\",\"extra\":\"extra\"}\n"
  end

  test "debug method" do
    Application.put_env(:ex_wrapplog, :level, :debug)
    assert capture_io(fn  -> ExWrapplog.debug("This is a debug message") end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is a debug message\",\"level\":\"debug\"}\n"

    assert capture_io(fn  -> ExWrapplog.debug("This is a debug message with params", %{extra: "extra"}) end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is a debug message with params\",\"level\":\"debug\",\"extra\":\"extra\"}\n"
  end

  test "panic method" do
    Application.put_env(:ex_wrapplog, :level, :debug)
    assert capture_io(fn  -> ExWrapplog.panic("This is a debug message") end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is a debug message\",\"level\":\"panic\"}\n"

    assert capture_io(fn  -> ExWrapplog.panic("This is a debug message with params", %{extra: "extra"}) end)
      == "{\"timestamp\":\"2017-03-28T13:46:06.989172Z\",\"service\":\"\",\"msg\":\"This is a debug message with params\",\"level\":\"panic\",\"extra\":\"extra\"}\n"
  end

  test "turn off logger" do
    Application.put_env(:ex_wrapplog, :level, :off)
    assert capture_io(fn  -> ExWrapplog.info("This is a useful information") end)== ""
    assert capture_io(fn  -> ExWrapplog.log(:error, "This is a an error") end)== ""
    assert capture_io(fn  -> ExWrapplog.log(:off, "Do not log") end)== ""
    assert capture_io(fn  -> ExWrapplog.log(:anything, "Do not log") end)== ""
  end
end
