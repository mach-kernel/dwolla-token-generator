require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module Parser
  mattr_reader  :md

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def block_code(code, language)
      Rouge.highlight(code, language || 'text', 'html')
    end
  end

  @@md ||= Redcarpet::Markdown.new(HTML, fenced_code_blocks: true, line_numbers: true)
end