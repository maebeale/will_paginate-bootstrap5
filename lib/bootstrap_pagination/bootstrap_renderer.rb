require "bootstrap_pagination/version"

module BootstrapPagination
  # Contains functionality shared by all renderer classes.
  module BootstrapRenderer
    ELLIPSIS = "&hellip;"

    def to_html
      list_items = pagination.map do |item|
        case item
          when 0.class
            page_number(item)
          else
            send(item)
        end
      end.join(@options[:link_separator])

      tag("ul", list_items, class: ul_class)
    end

    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def page_number(page)
      classes = ['page-item']
      classes << (@options[:active_class] ? @options[:active_class] : "active") if page == current_page
      classes << 'hidden-xs' if page > 2 && page < total_pages - 1 # phones
      classes << 'hidden-sm' if page > 3 && page < total_pages - 1 # tablets

      link_options = @options[:link_options] || {}
      tag("li", link(page, page, rel: link_options.merge(rel: rel_value(page))), class: classes.join(' '))
    end

    def previous_or_next_page(page, text, classname)
      text ||= 'Prev' if classname == 'previous_page'
      text ||= 'Next' if classname == 'next_page'

      classes = ['page-item', classname, "text-nowrap"].compact

      if page
        classes << 'hidden-xs' if page > 2 && page < total_pages - 1 # phones
        classes << 'hidden-sm' if page > 3 && page < total_pages - 1 # tablets
        link_options = @options[:link_options] || {}
        tag("li", link(text, page, link_options), class: classes.join(" "))
      else
        classes << 'disabled'
        tag("li", tag("span", text), class: classes.join(" "))
      end
    end

    def gap
      text = @options[:gap_text] || ELLIPSIS
      tag("li", tag("span", text), class: "page-item disabled")
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], "prev")
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], "next")
    end

    def ul_class
      ["pagination", @options[:class]].compact.join(" ")
    end
  end
end
