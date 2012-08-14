class FailureNotifier
  def notify_user_of_failure
    print_to_console(failure)
  end

  def print_to_console(failure)
    @console.print(failure.to_sentence)
  end
end
