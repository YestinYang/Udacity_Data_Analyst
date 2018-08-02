# Udacity Data Analyst Nano Degree

[TOC]

## Part 4: Storytelling of Data

### Fundamental Data Visualization

[Anscombe's quartet:](https://en.wikipedia.org/wiki/Anscombe%27s_quartet)

![](https://upload.wikimedia.org/wikipedia/commons/e/ec/Anscombe%27s_quartet_3.svg)

[Gapminder: Wealth & Health of Nations](https://www.gapminder.org/tools/#$locale$id=en;&chart-type=bubbles) 

###Design Principles

#### Choosing Chart Type

> Visual Encodings + Data Types + Relationship = Chart Types
>
> Eg: x-axis, y-axis and points + continuous data + y related to x = scatter plot

- **Histogram:** need to consider binwidth to detect normality
- **Box plot:** need more data, and hard to detect normality
- **Violin plot:** need more data, but easy to detect normality
  - Kernel density estimation
- **纸带记录图:** can only show small amount of data
  - ![tableau_纸带记录图](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_纸带记录图.png)
- **Bullet graph:** 
  - ![image-20180802141825559](/var/folders/5q/93z8tcmn0xn8t6gr3gzzssz40000gn/T/abnerworks.Typora/image-20180802141825559.png)
- **Sparklines:** 
  - ![tableau_sparklines](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_sparklines.png)
- **Linked scatter plot:** add in ordinal 3rd dimension into scatter plot, like date
  - ![tableau_linked_scatter](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_linked_scatter.png)
- **[Cycle Plots](https://www.perceptualedge.com/articles/guests/intro_to_cycle_plots.pdf):** 
  - ![tableau_cycle](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_cycle.png)

#### Choose Colormap

> **Color in human brain:** our sensitivity of color is unbalance, where green > red > blue

**Problem of Jet colormap:** 

- Brightness change is non-linear
- Yellow and blue-green region has higher brightness

- ![tableau_jet](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_jet.png)

**Linear colormap:** 

- Continuous hue: for continuous data with all positive values
  - ![tableau_continuous_hue](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_continuous_hue.png)
- Divergent hue: for continuous data with both negative and positive values
  - ![tableau_divergent_hue](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_divergent_hue.png)
- Qualitative hue: for categorical data
  - Generation tool: [i want hue](http://tools.medialab.sciences-po.fr/iwanthue/) 

#### Other Encodings

- Size
  - ![tableau_size](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_size.png)

- Shape: 
- Double Encodings
  - ![tableau_double_encode](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_double_encode.png)

#### Less is More

**Remove data-ink! Focus on data!**

For example, border of bar and chart, scale axis.

![tableau_ink_1](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_ink_1.png)

![tableau_ink_2](/Users/yestinyang/Udacity_Data_Analyst/img/tableau_ink_2.png)

#### Honest Design

$Lie Factor = \frac{size\ of\ effect\ shown\ in\ graphic}{size\ of\ effect\ in\ data}$

**[Line chart with irregular intervals:](http://www.perceptualedge.com/articles/visual_business_intelligence/line_graphs_and_irregular_intervals.pdf)**

1. Lines should only be used to connect values along an interval scale (with a couple exceptions). 
2. Intervals should be equal in size. 
3. Lines should only directly connect values in adjacent intervals. 

#### How to Design a Visualization

[Multifaceted Data and Story](http://www.storytellingwithdata.com/blog/2014/01/multifaceted-data-and-story) 


### Visualization with Tableau

### Storytelling with Tableau

