# Dundi Ferlo Model

DundiModel is an agent-based simulator designed to analyse and scenario natural resource management. Produced using a companion modelling approach called ComMod, it attempts to reproduce the 'spatial patterns' that can emerge from interactions between entities (households and herds) and the fodder resource (woody, agricultural and herbaceous) around Sahelian camps. The model is developed by working on the basis of elements defined and revised with the stakeholders. A body of scientific literature was retrieved, analysed and put into perspective with field observations to provide the basic data on herd behaviour and the environment.


## How to Load It?

First of all, you must get youself a Cormas image. To do that, follow instructions on [Cormas repository](https://github.com/cormas/cormas?tab=readme-ov-file#standard-installation).
In your Cormas image, run the following Metacello script to install the model:

```st
Metacello new
    repository: 'github://panchovdl/DundiModel';
    baseline: 'DundiModel';
    load
```

## Screenshots

![](img/screenshot1.jpg)
![](img/screenshot2.png)
![](img/screenshot3.png)
