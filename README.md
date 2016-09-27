# DevDataProdProj
This repo is created to submit the Developing Data Products Course Project  
The app is available in here: https://zimin.shinyapps.io/rrrpapp/

## Russian Rouble Rate Prediction Application Users Manual
### Introduction

It's a well known fact the Russian currency is strongly dependent on oil price. This shiny application is to predict Russian rouble rate aginst US dollar based on Brent oil price indicator. The data for prediction is taken in the period from **2013-06-26** to **2016-09-13**. It's also possible to subset the period with a slider control.

### Controls

One can manipulate 2 controls located in the left side bar of the application page to get the prediction:

- **Period slider**
- **Brent price**  

With the **Period slider** it's possible to subset a period which is used as a basis for the prediction.  
With the **Brent Price** input one can suggest a price for Brent oil to be used for the prediction.

As soon as both slider and price input are set, the Submit button should be pressed to generate outputs

### Outputs

On the right side bar there are 2 outputs:

- **Historical data plot**
- **Russian rouble rate prediction**  

**Historical data plot** shows the plot for the data for the period subset with the slider control.  
**Russian rouble rate prediction** shows the prediction of the Russian rouble rate against US dollar based on the chosen period and oil price.

### Credits

The data for the application was taken from the [Finam company web site](https://www.finam.ru/).
