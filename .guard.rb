# Global Guardfile
notification :tmux,
  display_message: true,
  timeout: 3, # in seconds
  default_message_format: '%s >> %s',
  default_message_color: 'black',
  # the first %s will show the title, the second the message
  # Alternately you can also configure *success_message_format*,
  # *pending_message_format*, *failed_message_format*
  line_separator: ' > ', # since we are single line we need a separator
  color_location: 'status-left-bg' # to customize which tmux element will change color

guard 'rspec', all_after_pass: false
