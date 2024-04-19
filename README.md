# Public Transportation in Singapore: Redefining Accessibility with SGAccessView


#### According to the Singapore Consumer Sentiment Study 2022, conducted by PropertyGuru, they found significant insights into the preferences of Singaporean homebuyers, particularly in terms of their favoured districts. As highlighted in the study, districts such as Serangoon Garden, Hougang, Punggol (District 19) and Balestier, Toa Payoh, Serangoon (District 12) have garnered considerable attention from prospective buyers, with District 19 claiming the top spot at 22% popularity. Districts 12 and 3, comprising areas like Balestier, Toa Payoh, and Queenstown, have seen heightened interest among young buyers aged 22 to 29. This demographic shift suggests a preference for districts that offer a blend of affordability, amenities, and accessibility, aligning with our proposed focus on understanding the needs of commuters like Alec, who rely on public transportation for daily commutes.

#### Additionally, another article reports on the Singapore government's efforts to promote a car-lite society through measures such as the zero-vehicle growth policy and the expansion of public transportation networks, which include the MRT system. Acting Transport Minister Chee Hong Tat reiterated the need for such policies, stating, "it is 'not tenable' for Singapore’s vehicle population to keep rising," emphasising the importance of managing traffic congestion in a land-scarce environment. These developments highlight the increasing significance of factors such as accessibility and connectivity in shaping decisions of Singaporean homebuyers in purchasing a home.

#### By leveraging insights from both quantitative data and qualitative analysis, we aim to develop a comprehensive solution that enhances accessibility, fosters sustainable urban development, and aligns with the aspirations of Singapore's diverse population.


#### The descriptions of the files found in this repository is detailed below: 
#### 1. README.md (Markdown file): Details on DSE3101 Project (SGAccessView) GitHub repository
#### 2. MRT Stations.csv (Dataset): Referenced in sgaccessview_bus_accessibilityscore.R, dataset containing the following variables:
#### 3. mrtfaretime.csv (Dataset): Referenced in sgaccessview_mrt_accessibilityscore.R, dataset containing the following variables:
#### 4. data.R (R code): Referenced in sgaccessview_bus_accessibilityscore.R, web scraping & API code to obtain relevant datasets from LTA DataMall
#### 5. sgaccessview_mrt_accessibilityscore.R (R code): Referenced in sgaccessview_visualisation.R, MRT accessibility functions
#### 6. sgaccessview_bus_accessibilityscore.R (R code): Referenced in sgaccessview_visualisation.R, bus accessibility functions
#### 7. sgaccessview_visualisation.R (R code): Shiny visualisation code


### How to Install & Launch Application Locally

#### The following steps have to be completed in order to launch our Shiny application successfully on your local device:
#### 1. Ensure that all files in the table above (README.md is optional) are saved in the same working directory or folder.
#### 2. In your RStudio console, set your LTA DataMall API key as an environment variable using Sys.setenv(ltakey = “...”), where “...” represents your personal LTA DataMall API key.
#### Alternatively, you may set your API key under a different variable name, and update the Sys.getenv(“ltakey”) code in data.R to retrieve your API key accordingly.
#### To run the Shiny application, only sgaccessview_visualisation.R has to be open. Click on “Run App” at the top right corner and the application should be launched successfully.
