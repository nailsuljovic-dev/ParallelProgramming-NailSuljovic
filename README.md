# ParallelProgramming-NailSuljovic
# Lab 03 – Performance Limits and Profiling

## 1. hwloc

Installed the required packages and built Cairo and hwloc to check the hardware topology.

```bash
sudo apt install build-essential pkg-config libcairo2-dev \
libpng-dev libglib2.0-dev gnuplot
wget https://www.cairographics.org/releases/cairo-1.16.0.tar.xz
tar -xf cairo-1.16.0.tar.xz
cd cairo-1.16.0
./configure --with-x --prefix=/usr/local
make
sudo make install
```

Installed hwloc:

```bash
git clone https://github.com/open-mpi/hwloc.git
cd hwloc
./configure --prefix=/usr/local --enable-cairo
make
sudo make install
lstopo
```

## 2. STREAM Benchmark

Downloaded and ran STREAM to measure memory bandwidth.

```bash
git clone https://github.com/jeffhammond/STREAM.git
cd STREAM
make
./stream_c.exe
```

## 3. Roofline Toolkit

Downloaded the Roofline Toolkit and configured it for the system.

```bash
sudo apt install openmpi-bin libopenmpi-dev gnuplot
git clone https://bitbucket.org/berkeleylab/cs-roofline-toolkit.git
cd cs-roofline-toolkit/Empirical_Roofline_Tool-1.1.0
cp Config/config.madonna.lbl.gov.01 Config/myconfig
```

Edited `Config/myconfig` to match the hardware configuration and ran the benchmark.

```bash
./ert Config/myconfig
```

The generated Roofline graph can be opened with:

```bash
xdg-open Results.madonna.lbl.gov.01/Run.003/roofline.ps
```

## 4. CloverLeaf and Callgrind

Installed Valgrind and KCacheGrind, downloaded CloverLeaf, and built the serial version for profiling.

```bash
sudo apt install valgrind kcachegrind
git clone --recursive https://github.com/UK-MAC/CloverLeaf.git
cd CloverLeaf/CloverLeaf_Serial
make COMPILER=GNU IEEE=1 C_OPTIONS="-g -fno-tree-vectorize" OPTIONS="-g -fno-tree-vectorize"
```

Prepared the input file and changed the number of cycles to 10.

```bash
cp InputDecks/clover_bm256_short.in clover.in
valgrind --tool=callgrind -v ./clover_leaf
```

Opened the profiling results with:

```bash
kcachegrind
```

## 5. likwid

Downloaded and compiled likwid to measure hardware performance counters.

```bash
git clone https://github.com/RRZE-HPC/likwid.git
cd likwid
nano config.mk
make
sudo make install
sudo modprobe msr
```

Ran the performance counter tool on CloverLeaf:

```bash
likwid-perfctr -C 0-87 -g MEM_DP ./clover_leaf
```

The CPU range should be adjusted to match the available cores on the system.
