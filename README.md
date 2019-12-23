# glamer
Files for using cmake to build the GLAMER library for gravitational
lensing simulations.

The files in this project are used to build the files from projects NR, CosmoLib and SLsimLib into the GLAMER static library using cmake.  This is the recommended method for building the library on amy platform.

third party requirements:  git, cmake, C++11 compatible compiler

###basic installation

cloning the code: (requires git on you machine)

```
git clone https://github.com/glenco/glamer.git
cd glamer
git clone https://github.com/glenco/NR.git
git clone https://github.com/glenco/CosmoLib.git
git clone https://github.com/glenco/SLsimLib.git  
ls
CMakeLists.txt		NR			examples`  
`CosmoLib		SLsimLib`  
```

Now creating a makefile or IDE project (requires cmake on your machine)
There are also libraries such as fftw and cfitsio that the installation might requires.  See the wiki page for this project for details.

```
mkdir build
cd build
```

To make a makefile:
```
cmake ..
```
Makefile will be in the build directory.

To make a xcode project on a Mac:  
```
cmake .. -G Xcode
open GLAMER.xcodeproj/
```

Projects for other IDEs such as Eclipse can also be created. See cmake documentation for details.

You can now change some of the compiling options.  
To list the settings:  
```
cmake .. -L
```
To change the maximum number of threads used for example:  
```
cmake .. -DN_THREADS=20
```  

The wiki for this project should have more information on installing GLAMER and trouble shooting.  The documentation for the GLAMER code is at [GLAMERDOC++](http://glenco.github.io/glamer/Doc/html/).

You then must compile the library through your IDE of choice or by
`make all`.

###Updating:

To update you only need to `git pull` from the directory of the
individual projects.  You usually do not need to use cmake again
unless new files have been added to or removed from the projects, but
it can't hurt to cmake again to be safe.  You will need to build
again and link to your project that uses the GLAMER library.

###Creating your own project:

See the wiki for this project.

###Getting News

Each of the projects NR, CosmoLib, SLsimLib and this one have separate issue
tracking.  If you are intersted in development issues you can set
these to "watch" in the upper right hand corner of the projects.  If
you are only interested in major updates and major bug fixes you can
just "watch" this project where they will be announced.
