module Jekyll
  class Scholar

    class BibliographyHDPByTypeTag < Liquid::Tag
      include Scholar::Utilities
      include ScholarExtras::Utilities
  
      def initialize(tag_name, arguments, tokens)
        super

        @config = Scholar.defaults.dup
        @bibtex_type = arguments.strip
      end

      def render(context)
        set_context_to context

         year_section = ''
         puts bibtex_type.to_s
         opts = ['@article','@*[public!=no]']
#references = public_journal_entries.map do |entry|
        references = get_entries(opts).map do |entry|
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
           reference << "."
          end

          if entry.field?(:pdflink1) or entry.field?(:pptlink1)
            reference << "<b> Downloads: </b>" 
          end 

          if entry.field?(:pdflink1)
            reference << "<a href=\"" + entry[:pdflink1].to_s + "\">PDF</a>"

          end
          
          if entry.field?(:pptlink1)
            reference << "<a href=\"" + entry[:pptlink1].to_s + "\">PPT</a>"

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

Liquid::Template.register_tag('bibliography_bytype', Jekyll::Scholar::BibliographyHDPByTypeTag)
