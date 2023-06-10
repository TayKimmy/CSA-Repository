## Blog site using GitHub Pages and Jekyll
> This site is intended for Students.   This is to take notes and complete hacks.
- This can be customized to support computer science as you work through pathway (JavaScript, Python/Flask, Java/Spring)
- All course material work off of _posts or _notebooks.  

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
    - stop and clean constructed files
    ```bash
    make clean
    ```
