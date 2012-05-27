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
      puts b.length

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
      puts b.class
      puts bart.length 
      puts bpub.length
      puts b.length

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
 
    end
  end
end

