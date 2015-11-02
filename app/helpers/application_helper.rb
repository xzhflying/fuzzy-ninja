module ApplicationHelper
  # Generates a page header. The title shown will be the +.header+ key in the page
  # that calls this helper.
  #
  # @param [String] header The custom page header string.
  # @yield A block in which other helper methods may be called, to place child elements
  #   on the far right of the header.
  # @return [String]
  def page_header(header = nil)
    content_tag(:div, class: 'page-header') do
      content_tag(:h1) do
        content_tag(:span, header || 'header') +
          content_tag(:div, class: 'pull-right') do
            yield if block_given?
          end
      end
    end
  end
end
