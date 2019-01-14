# A collection of reveal.js presentations

## Usage

```bash
./slides [markdown-file]
```

This will clone [reveal.js](https://github.com/hakimel/reveal.js), link the relevant files
and start the webserver on port 8000.

## Images

Some images are generated using LaTeX and `pdf2svg`. Once both packages are installed,
you can build an individual image with:

```bash
pdflatex -shell-escape <tex-file>
```

You can rebuild on change using your favourite file watching tool, eg for Mac:

```bash
brew install fswatch
fswatch traffic-*.tex | xargs -n1 pdflatex -shell-escape
```
