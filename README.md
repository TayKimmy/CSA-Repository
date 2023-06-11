## Blog site using GitHub Pages and Jekyll
> This site is intended for Students.   This is to take notes and complete hacks.
- This can be customized to support computer science as you work through pathway (JavaScript, Python/Flask, Java/Spring)
- All tangible work is in a _posts or _notebooks.  
- Front matter (aka meta data) is used to organize information by week and column.

## Preview Site 
> GitHub Pages development is optimized by testing and developing on your local machine.  This is called previewing you work, prior to commit and push. 
- GitHub setup for, [Testing your GitHub Pages site locally with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll).  After requirements are met for Jekyll and Ruby you need to install requirements for project.
```bash
bundle install
```
- Now the project is ready for preview.  To simplify typing and sharing logging the details for running have be place in a ```Makefile```
    - run and preview jekyll server
    ```bash
    make
    ```
    - stop jekyll server
    ```bash
    make stop
    ```
    - review notebook conversions
    ```bash
    make convert
    ```
    - stop server and clean up constructed files
    ```bash
    make clean
    ```
