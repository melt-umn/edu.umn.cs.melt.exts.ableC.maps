## A very simple 'skeleton' extension

This sample extension exemplifies an organization that some might
find useful in writing language extensions for ableC.

An `artifact` and `examples` directories demonstrate how to create
an ableC compiler using the extension and some sample programs using
that extension.

The `modular_analyses` directory contains a directory for each of the
two modular analyses: modular determinism and modular
well-definedness.  A `run.sh` script is in each to make it easy for an
extension user to verify that the extension does in fact pass the
modular analyses.

A `src` directory contains the sourse of the langauge extension.

Extension designers are of course free to organize files as they
choose.  This is simply an example that works well for us.
