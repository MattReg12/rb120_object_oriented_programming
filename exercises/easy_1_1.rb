#1) Behold this incomplete class for constructing boxed banners.
=begin
Further Exploration
Modify this class so new will optionally let you specify a fixed banner width at the time
the Banner object is created. The message in the banner should be centered within the banner
of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.
=end

require 'terminfo'

class Banner
  def initialize(message, width = message.length)
    @message = message
    @width = width_validate(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    @horizontal_rule = "+-#{'-' * @width}-+"
  end

  def empty_line
    @empty_line = "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end

  def width_validate(width)
    max_terminal_length = TermInfo.screen_size.last - 10
    width.between?(@message.length, max_terminal_length) ? width : @message.length
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 1)
puts banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner = Banner.new('')
puts banner

=begin
+--+
|  |
|  |
|  |
+--+
=end