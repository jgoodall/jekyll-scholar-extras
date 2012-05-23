Feature: Public or Not
  A BibTeX bibliography may contain publications that are not supposed to be public as of yet.
  This could be due to several reasons such as it being under submission. 
  In order to allow this, I have a specific field that can be inserted in the 
  BibTeX to describe whether a particular entry should be generated using 
  jekyll-scholar or not.


Scenario: Wanting to *not* make a publication public.
  Suppose that one wants to hide the generation of the BibTeX entry for a 
  particular publication entry.  Simply add the following `public` field to the entry.


  """
  @book{ruby,
     title     = {The Ruby Programming Language},
     author    = {Flanagan, David and Matsumoto, Yukihiro},
     year      = {2008},
     publisher = {O'Reilly Media},
     public = {no}
  }
  """
