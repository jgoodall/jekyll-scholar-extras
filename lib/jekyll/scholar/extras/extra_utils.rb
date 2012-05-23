module Jekyll
  class Scholar

    module ExtraUtilities

    attr_reader :bibtex_file, :config, :site

    def bibtex_options
        @bibtex_options ||= { :filter => :latex }
      end
      
    def bibtex_path
      @bibtex_path ||= extend_path(bibtex_file)
    end
      
    def bibliography
      @bibliography ||= BibTeX.open(bibtex_path, bibtex_options)
    end          
     
    def entries_public
      puts 'entries public only'
      b = bibliography[config['query']]

      unless config['sort_by'] == 'none'
        b.sort_by! { |e| e[config['sort_by']].to_s }
        b.reverse! if config['order'] =~ /^(desc|reverse)/i
      end
       
        b
     end
 
    end
  end
end

