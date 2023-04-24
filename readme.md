# About

Template for Student Scientific Conference writing at _FBERG TUKE_. 

Warning! The encoding of all documents is set to _UTF-8_! So don't forget to set up your environment in which you will write your thesis to use this encoding!

However, please note that this version is still under development and due to potential changes, we recommend _changelog_ monitoring.

## Install

We recommend installing the [TeX Live](https://www.tug.org/texlive/) package.

As an editor, I recommend installing [VS Code](https://code.visualstudio.com).

Fedora users will write: 

```bash
sudo dnf install texlive-collection-latexrecommended \
    texlive-collection-langczechslovak texlive-totalcount \
    texlive-biblatex texlive-biblatex-iso690 texlive-glossaries \
    latexmk texstudio
```

Similarly, Debian and Ubuntu users will write:

```bash
sudo apt-get install texlive-latex-extra texlive-fonts-recommended \
    texlive-lang-czechslovak texlive-bibtex-extra biber latexmk texstudio
```

## Compilation

To create a document, type the following command from the command line:

```bash
latexmk -pdf -bibtex -pvc thesis
```

Running this command will create the resulting document in _PDF_ format, which will be displayed in the document browser afterwards. However, the tool will not quit and will monitor changes, while with each change (saving a _.tex_ file), the resulting document will be re-generated.

Of course, you can open the project in any _LaTeX_ editor or IDE, e.g. _VS Code_.


## Update

In case the template is updated, just update the `ssc.cls` file in your project. However, always look in the `changelog.md` file to make sure there was an update. 


## Spell Checking

In case your editor does not support spell-checking, you can use the `aspell` tool as follows: 

```bash
aspell -d sk_SK -t -c file.tex
```