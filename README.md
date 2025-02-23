
# Potential Gravitational-wave and Gamma-ray Multi-messenger Candidate from Oct. 30, 2015
**Alexander H. Nitz<sup>1,2</sup>,  Alex B. Nielsen<sup>1,2</sup>, Collin Capano<sup>1,2</sup>

 <sub>1. [Albert-Einstein-Institut, Max-Planck-Institut for Gravitationsphysik, D-30167 Hannover, Germany](http://www.aei.mpg.de/obs-rel-cos)</sub>  
 <sub>2. Leibniz Universitat Hannover, D-30167 Hannover, Germany</sub>  
 
## [Read the associated paper on Arxiv](https://arxiv.org/abs/1902.09496)

## Abstract ##
We present a search for binary neutron star mergers during the first observing run of Advanced
 LIGO that produce both gravitational-wave and gamma-ray emission similar to GW170817 and GRB
170817A. We introduce a method to detect sources that do not produce significant gravitational-wave
or gamma-ray burst candidates individually. Searches of this type can increase by 70% the detections
of joint gravitational-wave and gamma-ray signals. We find one possible candidate at a false alarm
rate of 1 in 13 years. If confirmed, this candidate would correspond to a merger at 187+99
−87 Mpc with source-frame chirp mass of 1.30+0.02−0.03 Mpc. If we assume the viewing angle must be < 30◦
to be observed by Fermi-GBM, our estimate of the distance would become 224+88
−78 Mpc. By comparing the rate of
binary neutron star mergers to our search-estimated rate of false alarms, we estimate that there is a 1
in 4 chance this candidate is astrophysical in origin.

## Reading the 1-OGC 151030 posterior samples ##

We have provided the posterior samples from the parameter estimation analysis of 1-OGC 151030 as
an HDF file, `posterior.hdf`. See [How to read the posterior file](https://github.com/gwastro/o1-gwgrb/blob/master/How%20to%20read%20the%20posterior%20file.ipynb) for details on how to read this file.

We have also provided the configuration file `inference.ini` used for the
parameter esimtation analysis (which specifies the prior used), and the script
used to run `pycbc_inference` to generate the results (`run.sh`). These may be
found in the `scripts` directory.

## License and Citation

![Creative Commons License](https://i.creativecommons.org/l/by-sa/3.0/us/88x31.png "Creative Commons License")

We encourage use of these data in derivative works. If you use the material provided here, please cite the paper using the reference:

```
@article{Nitz:2019bxt,
      author         = "Nitz, Alexander H. and Nielsen, Alex B. and Capano,
                        Collin D.",
      title          = "{Potential Gravitational-wave and Gamma-ray
                        Multi-messenger Candidate from Oct. 30, 2015}",
      journal        = "Astrophys. J. Lett.",
      volume         = "876",
      year           = "2019",
      pages          = "L4",
      doi            = "10.3847/2041-8213/ab18a1",
      eprint         = "1902.09496",
      archivePrefix  = "arXiv",
      primaryClass   = "astro-ph.HE",
      SLACcitation   = "%%CITATION = ARXIV:1902.09496;%%"
}
```



