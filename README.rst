**Model files for simulating the signaling pathways underlying striatal LTP and LTD**

*Signaling pathways include:*
1. dopamine D1R coupled pathways (activatin of Gs subtype of GTP binding protein, leading to cAMP, PKA and Epac)
2. calcium activated pathways (leading to PP2B,
3. metabotropic glutamate mGluR1/5 coupled pathways (activation of Gq subtype of GTP binding protein, leading to PLC and DAG)
4. muscarinic acetylcholine receptors: M1R (Gq coupled) and M4R (Gi coupled - inhibition of cAMP)
5. Molecules mediating interaction of these pathways, such as DARPP-32

This model represents a synthesis/merger of the models presented in Oliveria et al. PLoS Comp Biol 2012 and the model presented in Kim et al. PLoS Comp Biol 2013.

The Model reaction kinetics and molecule quantities are summarized in MSPN-mergeRateConstTable.xls, along with a list of all the models.  There are two main sets of model files:
A. those used to constrain to model.  These include simulations of the change in DARPP-32 phosphorylation in response to bath applied drugs, and simulations of depolarization induced suppression of inhibition.
B. Synaptic plasticity protocols.  These include both stimulation protocols with known outcomes, and stimulation protocols not yet measured experimentally.

**Modelxxx.xml contain the entire model specification**, which combines Reaction file (Rxn*.xml), Morphology file (Morph*.xml), initial conditions file (IC*.xml), output file (Out*.xml) and stimulation (Stim*.xml).  Most simulation experiments involve changing the stimulation. To run simulations, use NeuroRDv3.2.3:

java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar Modelfile.xml

The two main (control) Model files are:
-Model_SPNspineAChm4R_Gshydr5_GapD-stim20hz-noReb_lowDaDec3.xml
-Model_SPNspineAChm4R_Gshydr5_GapD-stimtheta-noReb_DaDec1.xml

Variations on running the models, e.g. by specifying initial conditions from a different (e.g. equilibrium) simulation, or running multiple trials, are illustrated in NeuroRD.bat, and explained in https://github.com/neurord/stochdiff/README.rst

Model output was processed using the python programs in https://github.com/neurord/NeuroRDanal
-nrdh5_anal.py produce graphs of molecules for one or more files, and optionally will generate outpu files of molecule concentration versus time for various morhpology subregions.
-sig.py calculates one or two "signatures" from sets of molecules by adding together the specified molecules.  E.g. to calculcate the total PKA phosphorylated DARPP-32, you would add D32p34PP1 and D32p34.
-sig2.py calculates the mean value of a set of molecule signatures at specified time points to use in statistical analysis.
