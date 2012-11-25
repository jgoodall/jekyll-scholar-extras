module Jekyll
  class ScholarExtras
    
    module Utilities
    
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
    
    def get_entries(and_list)
      b = bibliography['@*']
      and_list.each { |t|
        b = bibliography[t] & b
      }
#puts b.length
      
      unless config['sort_by'] == 'none'
        b.sort_by! { |e| e[config['sort_by']].to_s }
        b.reverse! if config['order'] =~ /^(desc|reverse)/i
      end
      
      b
    end
    
    def public_journal_entries
      bart = bibliography['@article']
      bpub = bibliography['@*[public!=no]']
      b = bart & bpub 
#puts b.class
#puts bart.length 
#puts bpub.length
#puts b.length
      
      unless config['sort_by'] == 'none'
        b.sort_by! { |e| e[config['sort_by']].to_s }
        b.reverse! if config['order'] =~ /^(desc|reverse)/i
      end
      
      b
    end
    
    def public_entries
      b = bibliography['@*[public!=no]']
      
      unless config['sort_by'] == 'none'
        b.sort_by! { |e| e[config['sort_by']].to_s }
        b.reverse! if config['order'] =~ /^(desc|reverse)/i
      end
      
      b
    end
    
    def details_file_for(entry)
      name = entry.key.to_s.dup
      
      name.gsub!(/[:\s]+/, '_')
      
      [name, 'html'].join('.')
    end
    
    def details_link_for(entry, base = base_url)
      [base, details_path, details_file_for(entry)].join('/')
    end
    
    def base_url
      @base_url ||= site.config['baseurl'] || site.config['base_url'] || nil
    end
    
    def details_path
      config['details_dir']
    end
    
    def cite_details(key)
      entry = bibliography[key]
      
      if bibliography.key?(key)
        link_to "More details.", details_link_for(entry)
        #citation = CiteProc.process entry.to_citeproc, :style => config['style'],
        #:locale => config['locale'], :format => 'html', :mode => :citation
        
        #link_to "##{entry.key}", citation.join
        #else
        #"(missing reference)"
      end
    end
    
    
  end
end
end

