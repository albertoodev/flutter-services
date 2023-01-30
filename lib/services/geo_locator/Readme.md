## Getting started

add this lines in `/android/app/main/AndroidManifest.xml`
& make sure to add your `GOOGLE MAPS API_KEY` on the value tag.


--- Permission ---

put this on the `manifest` tag
```xml
 <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
 <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

--- Google Maps API Key ---

put this on the `application` tag  

```xml
<meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="put ur google maps api key here"/>
```


## Usage

...enjoy...
