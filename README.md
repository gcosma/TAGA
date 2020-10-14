# TAGA
TAGA: Tabu Asexual Genetic Algorithm Embedded in a Filter/Filter Feature Selection Approach for High-dimensional Data

0 - Open the TAGA.m file

1- Load the dataset. The dataset is an n by m (n x m) matrix where n is the number of samples and m is the number of features

2- Set number of features to be filtered out in the first step (N_filter). This value is set to 100 features by default.

3- Set the sparameters of the GA. These parameters include population size, number of features in the final subset, number of iterations, and mutation rate.

By default, the values of these parameter have been set to: popsize:100, nfeat:10, maxiter:200, pm:0.2.

4- Run the TAGA.m file

Please Reference: Salesi, Cosma and Mavrovouniotis. TAGA: Tabu Asexual Genetic Algorithm Embedded in a Filter/Filter Feature Selection Approach for High-dimensional Data. Elsevier Information Sciences.

Copyright (c) 2020, Sadegh Salesi, Georgina Cosma and Michalis Mavrovouniotis. All rights reserved.

Abstract:
Feature selection is the process of selecting an optimal subset of features required for maintaining or improving the performance of data mining models. Recently, hybrid filter/wrapper feature selection methods have shown promising results for high-dimensional data. However, filter/wrapper methods lack of generalisation power, which enables the selected features to be trainable over different classifiers without having to repeat the feature selection process. To address the generalisation power problem, this paper proposes a novel evolutionary-based filter feature selection algorithm that is sequentially hybridised with the Fisher score filter algorithm in a new hybrid framework called filter/filter. The proposed algorithm is based on a long-term memory Tabu Search combined with an Asexual (i.e. mutation-based) Genetic Algorithm (TAGA). TAGA benefits from a new integer-encoded solution representation, a novel mutation operator, a new tabu list encoding scheme, and uses a minimum redundancy maximum relevance information theory-based criterion as the fitness function. Experiments were carried out on various high-dimensional datasets including image, text, and biological data. The goodness of the selected subsets was evaluated using different classifiers and the experimental results demonstrate that TAGA outperforms other conventional and state-of-the-art feature selection algorithms.
