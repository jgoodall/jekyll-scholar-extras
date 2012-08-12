module Jekyll
  class Scholar

    class BibliographyHDPByTypeTag < Liquid::Tag
      include Scholar::Utilities
      include ScholarExtras::Utilities
  
      attr_reader :type, :header, :arr_args

      def initialize(tag_name, arguments, tokens)
        super

        @config = Scholar.defaults.dup
        # Check for number of arguments.
#@arr_args = arguments.strip.split(/\s+/)
        @type, @header= arguments.strip.split(/\s*,\s*/, 2)

#@type= arr_args[0]
#@header = arr_args[1]
      end

      def render(context)
        set_context_to context

         year_section = ''
         opts = ['@' + @type,'@*[public!=no]']

        references = get_entries(opts).map do |entry|
          reference = ''
          ref = ''

          ref = CiteProc.process entry.to_citeproc, :style => config['style'],
            :locale => config['locale'], :format => 'html'
          content_tag :span, ref, :id => entry.key

          reference << ref
          if generate_details?
           reference << "<br />"
           reference << link_to(details_link_for(entry), config['details_link'])
           reference << "."
          end

          if entry.field?(:pdflink1) or entry.field?(:slides)
            reference << "<b> Downloads: </b>" 
          end 

          if entry.field?(:pdflink1)
            reference << "<a href=\"" + entry[:pdflink1].to_s + "\">PDF</a>"

          end
          
          if entry.field?(:slides)
            reference << "<a href=\"" + entry[:slides].to_s + "\">Slides</a>"

          end

          content_tag :br, reference
        end
         
         section_header = "<h1> #{@header} </h1>"
 
        references.insert(0,section_header)
        references.join("\n")
      end
    end
    
  end
end

Liquid::Template.register_tag('bibliography_bytype', Jekyll::Scholar::BibliographyHDPByTypeTag)
