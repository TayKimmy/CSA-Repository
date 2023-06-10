## Blog site using GitHub Pages and Jekyll
> This site is intended for Teachers.   This is to build lessons and distribute across different sections.
- This support 3 computer science sections that are in a pathway (JavaScript, Python/Flask, Java/Spring)
- JavaScript documents are new material for entry class into the pathway, they are prerequisites for the Python and Java classes.
- All course material works off of Notebooks using Python kernel, except Java which requires it own kernel.

## Preview Site 
> GitHub Pages development is optimized by testing and developing on your local machine.  This is called previewing you work, prior to commit and push. 
- GitHub setup for, [Testing your GitHub Pages site locally with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll).  After requirements are met for Jekyll and Ruby you need to install requirements for project.
```bash
bundle install
```
- Now the project is ready for preview.  To simplify typing and sharing logging the details for running have be place in a ```Makefile```
    - run preview server
    ```bash
    make
    ```
    - stop preview server
    ```bash
    make stop
    ```
    - test notebook conversions
    ```bash
    make convert
    ```
    - clean constructed files
    ```bash
    make clean
    ```
