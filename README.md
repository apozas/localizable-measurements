## Code to accompany *[Classification of joint quantum measurements based on entanglement cost of localization](https://www.arxiv.org/abs/2408.00831)*
#### Jef Pauwels, Alejandro Pozas-Kerstjens, Flavio del Santo, and Nicolas Gisin

This is a repository containing the computational appendix of the article "*Classification of joint quantum measurements based on entanglement cost of localization*. Jef Pauwels, Alejandro Pozas-Kerstjens, Flavio del Santo, and Nicolas Gisin. [arXiv:2408.00831](https://www.arxiv.org/abs/2408.00831)." It provides the codes for analytically solving the initial levels in the hierarchies for localizing joint two-qubit measurements, and for exploring higher levels and the three-qubit scenario. It also contains all the measurements found by numerical searches, for the third level of the hierarchy in the two-qubit scenario, and for the first two levels in the three-qubit scenario.

The code is written in Mathematica and MATLAB.

Mathematica packages required:
  - [QI](https://github.com/rogercolbeck/QI) for quantum information tools.

MATLAB libraries required:
  - [QETLAB](http://www.qetlab.com/) for quantum information tools.
  - [YALMIP](https://yalmip.github.io/) for setting up semidefinite programs.
  - [Mosek](https://www.mosek.com/) (or any other SDP solver) for solving semidefinite programs.

Files:

  - [AllOneEbitSolutions.nb](https://github.com/apozas/localizable-measurements/blob/main/AllOneEbitSolutions.nb): Notebook that analytically finds all solutions to Equation 4 in the manuscript, giving all the two-qubit measurements that can be localized with one ebit in the finite-consumption Vaidman scheme.

  - [AllThreeEbitSolutions.nb](https://github.com/apozas/localizable-measurements/blob/main/AllThreeEbitSolutions.nb): Notebook that analytically finds all solutions to Equation 5 in the manuscript, giving all the two-qubit measurements that can be localized with three ebits in the finite-consumption Vaidman scheme.

  - [findUniqueBases.m](https://github.com/apozas/localizable-measurements/blob/main/findUniqueBases.m): Auxiliary script to identify representatives of measurements according to Definition 2 in the manuscript.

  - [numsearch](https://github.com/apozas/localizable-measurements/blob/main/numsearch/): MATLAB files that perform the numerical searches on the cases that are too complicated to solve analytically. This folder includes the search codes ([N2q9e](https://github.com/apozas/localizable-measurements/blob/main/numsearch/N2q9e.m) for the third level for two-qubit measurements, [N3q2e](https://github.com/apozas/localizable-measurements/blob/main/numsearch/N3q2e.m) for the first level for three-qubit measurements, and [N3q17e](https://github.com/apozas/localizable-measurements/blob/main/numsearch/N3q17e.m) for the second level for three-qubit measurements), the functions that are minimized ([fmin2ebits](https://github.com/apozas/localizable-measurements/blob/main/numsearch/fmin2ebits.m), [fmin9ebits](https://github.com/apozas/localizable-measurements/blob/main/numsearch/fmin9ebits.m), and [fmin17ebits](https://github.com/apozas/localizable-measurements/blob/main/numsearch/fmin17ebits.m)), functions to check equivalence of bases ([localunitarilyequiv2](https://github.com/apozas/localizable-measurements/blob/main/numsearch/localunitarilyequiv2.m) for two-qubit bases and [localunitarilyequiv3](https://github.com/apozas/localizable-measurements/blob/main/numsearch/localunitarilyequiv3.m) for three-qubit bases), and auxiliary functions ([BasesFixed](https://github.com/apozas/localizable-measurements/blob/main/numsearch/BasesFixed.m), [BasesRandom](https://github.com/apozas/localizable-measurements/blob/main/numsearch/BasesRandom.m), [PartialTrace](https://github.com/apozas/localizable-measurements/blob/main/numsearch/PartialTrace.m), [sigma](https://github.com/apozas/localizable-measurements/blob/main/numsearch/sigma.m), and [vector](https://github.com/apozas/localizable-measurements/blob/main/numsearch/vector.m)).

  - [PPT_SDP.m](https://github.com/apozas/localizable-measurements/blob/main/PPT_SDP.m): MATLAB script that checks whether a two-qubit measurement is localizable with $n$ ebits via the SDP criterion of appendix D.

  - [results](https://github.com/apozas/localizable-measurements/blob/main/results/): Folder containing the results as ``.mat`` files. In each of them ``knownM`` contains all the corresponding measurements.

If you would like to cite this work, please use the following format:

J. Pauwels, A. Pozas-Kerstjens, and N. Gisin, _Classification of joint quantum measurements based on entanglement cost of localization_, arXiv:2408.00831

```
@misc{pauwels2024localizable,
  author = {Pauwels, Jef and Pozas-Kerstjens, Alejandro and del Santo, Flavio and Gisin, Nicolas},
  title = {Classification of joint quantum measurements based on entanglement cost of localization},
  archivePrefix = {arXiv},
  eprint = {2408.00831},
  year = {2024}
}
```
