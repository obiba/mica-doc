# mica-doc
Mica documentation

## Building Documentation
Follow these steps on your DEV computer to build the documentation pages: 

```bash
python -m venv venv
source venv/bin/activate
pip install sphinx pylint doc8 sphinx_rtd_theme sphinxcontrib-httpdomain
python -m sphinx -b html . "<FULL-PATH>/mica-doc/_build/html"
```