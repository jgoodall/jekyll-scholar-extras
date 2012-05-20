jekyll-scholar-extras
=====================

```jekyll-scholar-extras``` provides customized generators and tags for generating a publication bibliography with individual details pages from a [BibTeX](http://www.bibtex.org) file. This resembles other [BibTeX](http://www.bibtex.org) to HTML converters such as [bibtex2web](http://www.cs.washington.edu/homes/mernst/software/#bibtex2web).

These customizations are extensions to [Jekyll](http://jekyllrb.com/) and [Jekyll-Scholar](https://github.com/inukshuk/jekyll-scholar).  

Installation
------------

```bash
$ [sudo] gem install jekyll-scholar-extras
```


Usage
-----
To enable ```jekyll-scholar-extras```, add a file in your plugin directory (e.g., to `_plugins/jekyll-scholar-extras.rb`) with the following:

      require 'jekyll/scholar/extras'


Features
--------
These extras provide some additional features over the vanilla Jekyll-Scholar.  These are described below:
* Disable generation of BibTeX entries marked  to not be public.
* Create a PDF download link based on the BibTeX key associated with each entry.


Example
-------

An example setup that uses the customized bibliography and details page generators and tags.
* [Sample 1](https://ece.uwaterloo.ca/~hdpatel/uwhtml/publications/index.html)


License
-------

```jekyll-scholar-extras``` is distributed under the same license as Jekyll.

Copyright (c) 2012 [Hiren D. Patel](http://ece.uwaterloo.ca/~hdpatel/)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
