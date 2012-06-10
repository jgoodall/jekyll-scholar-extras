module Jekyll
  class Scholar

    class Details < Page
      include Scholar::Utilities
      
      def initialize(site, base, dir, entry)
        @site, @base, @dir = site, base, dir

        @config = Scholar.defaults.merge(site.config['scholar'] || {})

        @name = details_file_for(entry)

        process(@name)
        read_yaml(File.join(base, '_layouts'), config['details_layout'])

				liquidify(entry)
      end

			private
			
			def liquidify(entry)
				data['entry'] = {}

				data['entry']['key'] = entry.key
				data['entry']['type'] = entry.type
				
				entry.fields.each do |key, value|
					data['entry'][key.to_s] = value.to_s
        end

        data['entry']['bibtex'] = entry.to_s

        # This is to get the CSL style output.
        data['entry']['citeproc'] = CiteProc.process entry.to_citeproc, :style => config['style'],
            :locale => config['locale'], :format => 'html'
            
#puts data['entry']['citeproc'].class

        if entry.field?(:pdflink1)
          data['entry']['pdflink1']= entry[:pdflink1].to_s
        end
          
        if entry.field?(:slides)
          data['entry']['slides']= entry[:slides].to_s
        end


#name = entry.key.to_s.dup
#        name.gsub!(/[:\s]+/, '_')

#        data['entry']['pdflink'] = '../pdfs/' + name.to_s + '.pdf'
			end
			
    end

    class DetailsGenerator < Generator
      include Scholar::Utilities
      safe true

      attr_reader :config
      
      def generate(site)
        @site, @config = site, Scholar.defaults.merge(site.config['scholar'] || {})

        if generate_details?
          entries.each do |entry|
            details = Details.new(site, site.source, details_path, entry)
            details.render(site.layouts, site.site_payload)
            details.write(site.dest)
            
            site.pages << details
          end
          
        end
      end
			
    end


  end
end
