module Jekyll
  class Scholar

    class BibliographyHDPTag < Liquid::Tag
      include Scholar::Utilities
  
      def initialize(tag_name, arguments, tokens)
        super

        @config = Scholar.defaults.dup
        @bibtex_file = arguments.strip
      end

      def render(context)
        set_context_to context

         year_section = ''
         references = entries.map do |entry|
          reference = ''
          ref = ''

          ref = CiteProc.process entry.to_citeproc, :style => config['style'],
            :locale => config['locale'], :format => 'html'
          content_tag :span, ref, :id => entry.key

          if entry.field?(:year)
            if (year_section != entry[:year])
              reference << "<h1>"
              reference << entry[:year].to_s
              reference << "</h1>"
              year_section = entry[:year]
            end
          end 

          reference << ref
          if generate_details?
           reference << "<br />"
           reference << link_to(details_link_for(entry), config['details_link'])
          end

          content_tag :br, reference
        end

        references.join("\n")
#content_tag :ul, references.join("\n")
#content_tag :li, reference
      end
      
    end
    
  end
end

Liquid::Template.register_tag('bibliography_hdp', Jekyll::Scholar::BibliographyHDPTag)
