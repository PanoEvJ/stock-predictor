<p align = "center" draggable=”false” ><img src="https://user-images.githubusercontent.com/37101144/161836199-fdb0219d-0361-4988-bf26-48b0fad160a3.png" 
     width="200px"
     height="auto"/>
</p>

# Description

Deploying a time series model to predict stock prices as a RESTful API using FastAPI deployed to AWS EC2.

THe model is trained on historical stock data with yfinance, creates a new Prophet model, fits the model to the stock data, and then serializes and saves the model as a Joblib file. Then, the trained model is used to predict loads and deserializes the saved model, generates a new forecast, creates images of the forecast plot and forecast components. The model outputs a JSON file containing a dictionary of dates and forecasted values; e.g., {"07/02/2020": 200}).

The model can be executed using FastAPI with two arguments, a valid stock ticker and the number of days to predict. The ticker values are, for example, 'GOOG', 'AAPL', 'MSFT'. 

<p align="center">
<img src="src/MSFT_plot.png" alt="drawing" width="400"/>
<img src="src/MSFT_plot_components.png" alt="drawing" width="240"/>
</p>

# FastAPI

## Link

http://35.87.98.236:8000/docs#/default/get_prediction_predict_post

## Screenshot

<p align="center">
<img src="src/img/FastAPI_docs_visible_IP.png" alt="drawing" width="800"/>
</p>

# Curl

curl --header "Content-Type: application/json" --request POST --data '{"ticker":"MSFT", "days":7}' http://35.87.98.236:8000/predict
