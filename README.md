GDSC-Super
==========

Contains all the GDSC ImageJ repos as submodules.

This project can be used to checkout and build all the code required to install
the [GDSC ImageJ](https://github.com/aherbert/gdsc) and [GDSC SMLM
ImageJ](https://github.com/aherbert/gdsc-smlm) plugins into a version of
[ImageJ](https://imagej.nih.gov/ij/).

Installation from source
------------------------

The source code is accessed using [git](https://git-scm.com/) and built
using [Maven](https://maven.apache.org/).

1. Clone the GDSC Super repository

        git clone --recursive https://github.com/aherbert/gdsc-super.git

2. Build the code and package using Maven

        cd gdsc-super
        git submodule update --remote
        mvn package -DskipTests -Djavadoc.skip

    This will create a jar file for each module into a directory named
    `[module]/target`. The dependencies will be put into the `[module]/target/dependencies`
    directory.

    Note that the Maven package routine puts all dependencies into the
    `[module]/target/dependencies` directory even if they are not required by the GDSC
    code (it does not check what functions are actually used by the code).

3. If you are using ImageJ the main jars and dependencies are copied to the
`plugins` directory.

        export PREFIX=/usr/local/imagej

        cp gdsc/target/gdsc-ij_*jar ${PREFIX}/plugins
        cd gdsc/target/dependencies
        cp gdsc-analytics* gdsc-core* commons-rng* quickhull3d* fastutil-core* commons-math3* beansbinding* ${PREFIX}/plugins
        cd ../../..

        cp gdsc-smlm/gdsc-smlm-ij/target/gdsc-smlm-ij_*jar ${PREFIX}/plugins
        cd gdsc-smlm/gdsc-smlm-ij/target/dependencies
        cp gdsc-analytics* gdsc-core* commons-rng* quickhull3d* fastutil-core* commons-math3* JTransforms* JLargeArrays* ejml* xstream* mxparser* protobuf-java*  mfl-core* commons-lang3* gdsc-smlm* ${PREFIX}/plugins
        cd ../../../..

4. If you are using [Fiji](http://fiji.sc/) then use the `scijava:populate-app`
goal to copy the main jars and dependencies. The main plugin jars containing an
underscore (`_`) must be moved to the `plugins` directory as they are ImageJ
v1 plugins.

        export PREFIX=/usr/local/fiji

        cd gdsc
        mvn scijava:populate-app -Dscijava.app.directory=${PREFIX}
        cd ..

        cd gdsc-smlm
        mvn scijava:populate-app -Dscijava.app.directory=${PREFIX}
        cd ..

        mv ${PREFIX}/jars/gdsc*_*jar ${PREFIX}/plugins/


5. The plugins will now appear under the 'Plugins > GDSC' and
'Plugins > GDSC SMLM' menus in ImageJ.

Developers
----------

The code was developed using [Eclipse](https://eclipse.org/ide/). Each submodule
contains an eclipse directory with notes on how to set-up the code within
Eclipse including code formatting rules.

Import using 'Import...' then 'Maven > Existing Maven Projects' and select the
root gdsc-super folder.

To download each of the submodule repositories then use the utility script, e.g.

        ./checkout.sh ../gdsc

Background
----------

Developed at the
[Genome Damage and Stability Centre, University of Sussex](http://www.sussex.ac.uk/gdsc/).

The [Genome Damage and Stability Centre (GDSC) ImageJ plugins](http://www.sussex.ac.uk/gdsc/intranet/microscopy/UserSupport/AnalysisProtocol/imagej/gdsc_plugins/)
are a collection of analysis programs for microscopy images including colocalisation
analysis and peak finding.

The [GDSC Single Molecule Light Microscopy (SMLM) ImageJ plugins](https://gdsc-smlm.readthedocs.io/)
provide various tools for single molecule localisation analysis.
This includes PALM, STORM and other single molecule microscopy methods.

The code is split into several repositories. This super-project contains all the
GDSC ImageJ repositories as submodules.
