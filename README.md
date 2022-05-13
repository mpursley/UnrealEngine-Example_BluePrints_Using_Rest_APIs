# UnrealEngine-Example_BluePrints_Using_Rest_APIs

This is an Unreal Engine 4 project (using only Blueprints and the [VARest Plugin](https://github.com/ufna/VaRest)), that gets data from various Rest APIs and then visualizes that data in various formats (e.g. charts, "racks", block layout of nested json data, etc).

## Rest APIs
- Kubernetes API using  "http://localhost:8080" (e.g. from local [docker desktop](https://www.docker.com/products/docker-desktop), [Google GCP/GKE](https://cloud.google.com/kubernetes-engine), [AWS EKS](https://aws.amazon.com/eks/), https://unrealcontainers.com/, etc)
- [Prometheus](https://prometheus.io/) metrics
- Financial prices (e.g. Stocks, [BTC Bitcoin](https://min-api.cryptocompare.com/data/v2/histohour?fsym=BTC&tsym=USD&limit=99), [ETH Ethereum](https://min-api.cryptocompare.com/data/v2/histohour?fsym=ETH&tsym=USD&limit=99), etc)

## Screenshots
![image](https://user-images.githubusercontent.com/3343322/155474236-354ba975-a07c-4c39-8256-0ddf13a5e887.png)

![image](https://user-images.githubusercontent.com/3343322/158944507-0fb1a944-835d-4cb9-a46b-0c9025f2e0dc.png)

![image](https://user-images.githubusercontent.com/3343322/158945137-6cc3afb5-072a-4e93-ba4b-c7da581cad3d.png)

![image](https://user-images.githubusercontent.com/3343322/158747343-a7ad87de-2fb5-4d93-aaff-5b2ceb8f37a8.png)

![image](https://user-images.githubusercontent.com/3343322/158682443-ea0a26ea-5022-4607-bd7f-f74e7f701685.png)

![image](https://user-images.githubusercontent.com/3343322/158682510-a9c6b2c3-427a-4847-ad61-ee7034da2efe.png)

## How to Load/Use

1. Click on [Releases](https://github.com/mpursley/UnrealEngine-Example_BluePrints_Using_Rest_APIs/releases) -> Release # -> Assets -> Source code (zip)
1. Extract the .zip file, and open the "BP_APIs.uproject" in Unreal Engine 4 (or 5?) Editor.  E.g. Unreal Editor -> File -> Open Project -> Browse -> "BP_APIs.uproject"
1. Once the project is loaded, choose "Play" -> "Selected ViewPort" to start the level.  This should load:
    1. The last 24 hour price for BTC (Bitcoin) and ETH (Ether) on the two large blue charts
    1. The nested json data for the BTC price API call from this [Rest API URL](https://min-api.cryptocompare.com/data/v2/histoday?fsym=BTC&tsym=USD&limit=12), in the boxes on the upper left.  You should be able to substitude any Rest API URL and the Blueprint should "walk" the nested json data, drawing boxes for each object item.  (Warning:  This BP is not heavily tested yet, ymmv.  ;)
    1. Kubernets Node, Service and Alert data in the boxes/"racks" at the bottom left...  If you're running Kubernetes in your local "Docker Desktop" install and started this to allow access to the Kubernetes API on port 8080
        1. `$ kubectl proxy --port=8080`
1. If you want to copy any of these assets/blueprints into another project:
    1. Select the Blueprints from "Content Browser" -> Content -> Blueprints -> BP_APIs -> Blueprint(s)
    1. Right-click the Blueprints and choose -> "Asset Actions" -> "Migrate..."
![image](https://user-images.githubusercontent.com/3343322/158743912-7ddabdc5-020c-4483-beb0-13f550bb11da.png)
    1. Select the assests in the "Assest Report" window -> Ok
![image](https://user-images.githubusercontent.com/3343322/158744041-ecd68440-a331-4004-a49e-b5a6529cdb50.png)
    1. Select the assets in the "Assets Report" window -> Ok -> Then, choose another Project's Content folder
    1. Then, you can open the other project and drop the BPs into the level.. e.g. 
![image](https://user-images.githubusercontent.com/3343322/158746084-cca33bc7-b745-45e6-832e-b0c3ab6f6e6b.png)
1. Also note that the "BP_APIs_Starter" Blueprint has some "Hotkeys" for spawning and destroying the racks, charts, etc.  So you might want to include that BP as well, if you want to be able to spawn racks and other parts at the Player's current location.


      
