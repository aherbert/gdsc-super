GDSC-Super
==========

Contains all the GDSC ImageJ repos as submodules.

This project can be used to checkout and build all the code required to install
the [GDSC ImageJ](https://github.com/aherbert/GDSC) and [GDSC SMLM 
ImageJ](https://github.com/aherbert/GDSC-SMLM) plugins into a version of [ImageJ]
(https://imagej.nih.gov/ij/).

Installation from source
------------------------

The source code is accessed using [git](https://git-scm.com/) and built using [Maven](https://maven.apache.org/). 

1. Clone the GDSC Super repository

        git clone https://github.com/aherbert/GDSC-Super.git

2. Build the code and package using Maven

        cd GDSC-Super
        mvn -P dist package install -DskipTests=true
        cd ..
    
    This will create a jar file for each module into a directory named 
	[module]/target. The dependencies will be put into the [module]/target/dist/lib
	directory. 
    
	Note that the Maven package routine puts all dependencies into the 
	[module]/target/dist/lib directory even if they are not required by the GDSC
	code (it does not check what functions are actually used by the code).
	
3. Copy the GDSC code to the plugins directory of ImageJ

		cp GDSC/target/gdsc_*jar GDSC-SMLM/target/gdsc_smlm*jar /path/to/ImageJ/plugins

4. Copy the GDSC dependencies to the plugins directory (or the Java classpath). 
	If you are using [Fiji](http://fiji.sc/) then use the jars directory.

		cp GDSC-Analytics/target/gdsc_*jar /path/to/ImageJ/plugins
		cp GDSC-Core/target/gdsc-core*jar /path/to/ImageJ/plugins
		cd GDSC/target/dist/lib
		cp beansbinding* commons-math3* imagescience* /path/to/ImageJ/plugins
		cd ../../../..
		cd GDSC-SMLM/target/dist/lib
		cp jtransforms* xstream* ejml* /path/to/ImageJ/plugins
		cd ../../../..
		
5. The plugins will now appear under the 'Plugins > GDSC' and 
'Plugins > GDSC SMLM' menus in ImageJ.

Developers
----------

The code was developed using [Eclipse](https://eclipse.org/ide/). Each submodule
contains an eclipse directory with notes on how to set-up the code within 
Eclipse including an example project file and code formatting rules.

# About #

###### Repository name ######
GDSC Super

###### Owner(s) ######
Alex Herbert

###### Institution ######
Genome Damage and Stability Centre, University of Sussex

###### URL ######
http://www.sussex.ac.uk/gdsc/intranet/microscopy/imagej/gdsc_plugins

###### Email ######
a.herbert@sussex.ac.uk

###### Description ######
The Genome Damage and Stability Centre (GDSC) plugins are a collection of
analysis programs for microscopy images including colocalisation analysis and
peak finding. 

The GDSC Single Molecule Light Microscopy (SMLM) plugins provide various tools
for single molecule localisation analysis. This includes PALM, STORM and other
single molecule microscopy methods. 

The code is split into several repositories. This super-project contains all the
GDSC ImageJ repositories as submodules.