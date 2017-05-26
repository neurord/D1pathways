**This is terse but detailed list of steps to develop the model.**  See ResearchPlanMSNsignalingPathway.txt for bigger picture, including
     What are the big research questions
     What are some little research questions
     Some experiments that can help test/develop the model
     See NeuroRD.bat for information on how to run models
This file is also used to keep track of which steps have been done, and what needs to be done next.

**Details of what was done with a summary of results (with xml filenames) are reported in Notebook subdirectory:**
Notebook files should have following name format: year_MM_DD_lastname
Information: goal/plan of the days work, e.g. data trying to simulation
	     names of xml files and directorys created (e.g. if subset of rxn file used, or different stim file)
	     table of results: parameters tried and summary of results
	     conclusion / next steps (e.g. parameters X matched, copied into main Rxn file; or try parameters Z next time)

**Modelxxx.xml contain the entire model specification**, which combines Reaction file (Rxn*.xml), Morphology file (Morph*.xml), initial conditions file (IC*.xml), output file (Out*.xml) and stimulation (Stim*.xml).  Most simulation experiments involve changing the stimulation. To run simulations, use NeuroRDv3.2.3:
java -jar  /home/neuroware/stochdif/neurord-3.2.3-all-deps.jar Modelfile.xml

Variations on running the models, e.g. by specifying initial conditions from a different (e.g. equilibrium) simulation, or running multiple trials, are illustrated in NeuroRD.bat

**Model Development and Simulation Steps**
*Step 1. Merge reactions from modified version of Rodrigo's model and BoHung's model*

Notes in the RXN file indicate whether the reaction came from the Gs model (Oliveira 2012) or Gq model (Kim 2013)
DONE. 1A. Merge reactions
DONE. 1B. Use the smaller, 1 spine morphology
DONE. 1C. Create initial IC file - BALANCE ALL SPECIES, concentration and total PKA, etc in dend sm and spine head
Compare rate constants with xpp model and Oliveira model: which rates match references theirin, which ones do not match references, which rates don't have references.
DONE. Search for updated references for rates with none or non-matching refs.  
DONE. Check thermodynamic balance of some sets of reactions.
DONE. Create spreadsheet with rates and references to rates

*Step 2. Assays and adjustment to achieve correct basal cAMP and calcium*

DONE. 2A. assays for PLC, Da binding to DR1 (very small subset of reactions) - PLCassay/, DRGassay/
DONE. 2B. IC and RXN for Gs production and binding (very small subset of reactions) - cAMPassay/
DONE. 2C. IC and RXN for calmodulin, calbindin, pumps, affinity of Ca for Dagl and PLC - whole model but 3-5 comps (dend with sm)
DONE. 2D. assays of DARPP32 phos in response to bath applied Da and Ca, as in Lindskog. -  whole model but 3-5 comps (dend with sm)
DONE. 2E. Include Gi reactions here to help decrease basal cAMP - simulate ss in whole, multi-comp model (witih spine)

*Step 3. Interaction between Gs and Gq/calcium pathways*

DONE. 3A. CaMKII inhibition of Dagl
POSTPONE 3B. Replace the D2R parameters with m4R parameters in the D1R model. Higher affinity of m4R and higher ACh will decrease basal cAMP, may need to add AC1 or otherwise tweak params to fix basal cAMP and Dp34PP1.
POSTPONE 3C. PKA enhances of Gq or Gi GAP activity?  Via RGS?  Speed GaGTP production according to Chuhma et al.?
DONE 3D. Add in Epac (from Chay et al.) or AKAR (from Nair ... Kotaleski) to quantify assays
IN PROGRESS 3E. Re-run all assays to verify, including Uchigashima bath application simulations - still valid?

*Step 4.  Simulation experiments: 20 Hz vs theta*

DONE 4A. Stim files: Glu: how to account for release refractoriness and receptor desensitization (Ca and mGluR)?
    constrain by Lovinger imaging or Asia calcium dynamics model
DONE. 4B. Stim files: Da and ACh: what pattern of release occurs (Da from Lovinger)
DONE 4C. Which temporal patterns select for LTP vs LTD? - repetition of BoHung sims
4D. Sensitivity to order of Ca and Da?  Create alternative stimulation files
DONE 4E. Effect of blocking various molecules, such as protein phosphatases or CamKII
IN PROGRESS 4F. Create signature that can correctly predict LTP vs LTD for block cases also.  Then create novel stim patterns.
DONE 4F. Spatial specificity
IN PROGRESS 4F. Effect of alcohol

*Step5. Parameter sensitivity analysis*
