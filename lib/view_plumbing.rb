class View
  def initialize(text, binding=TOPLEVEL_BINDING)
    @template = text
    @binding = binding
  end

  def contents
    e = ERB.new(@template)
    e.result(@binding)
  end
end
