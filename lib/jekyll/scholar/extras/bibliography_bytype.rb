module Jekyll
  class Scholar

    class BibliographyHDPByTypeTag < Liquid::Tag
      include Scholar::Utilities
      include ScholarExtras::Utilities
  
      def initialize(tag_name, arguments, tokens)
        super

        @config = Scholar.defaults.dup
        @args = arguments.strip
        puts "args:"
        puts @args.to_s
      end

      def render(context)
        set_context_to context

         year_section = ''
         opts = ['@' + @args,'@*[public!=no]']
#         puts opts.to_s

#references = public_journal_entries.map do |entry|
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
         
         header = "<h1>" 
          case @args
          when 'book'
            header << "Books"
          when 'article'
            header << "Journals"
          when 'inproceedings'
            header << "Refereed Conferences"
          when 'techreport'
            header << "Technical Reports"
          when 'incollection'
            header << "In Book Chapters"
          end
          header << "</h1>"

#  puts header

 
        references.insert(0,header)
        references.join("\n")
      end
    end
    
  end
end

Liquid::Template.register_tag('bibliography_bytype', Jekyll::Scholar::BibliographyHDPByTypeTag)
