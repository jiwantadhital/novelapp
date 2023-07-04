package com.example.novelapp
import android.Manifest
import android.annotation.SuppressLint
import android.content.pm.PackageManager
import android.location.Location
import android.os.Looper
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.google.android.gms.location.*
import com.google.android.gms.tasks.Task

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/location"
    private lateinit var fusedLocationClient: FusedLocationProviderClient

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getCurrentLocation") {
                getCurrentLocation(result)
            } else {
                result.notImplemented()
            }
        }
    }

  @SuppressLint("MissingPermission")
private fun getCurrentLocation(result: MethodChannel.Result) {
    fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
    if (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
        val locationRequest = LocationRequest.create().apply {
            priority = LocationRequest.PRIORITY_HIGH_ACCURACY
            interval = 10000 // Update interval in milliseconds (10 seconds)
        }
        
        var locationUpdated = false // Flag to track if location has already been updated
        
        fusedLocationClient.requestLocationUpdates(locationRequest, object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult?) {
                if (!locationUpdated && locationResult != null && locationResult.lastLocation != null) {
                    val location = locationResult.lastLocation
                    val latitude = location.latitude
                    val longitude = location.longitude
                    val locationString = "$latitude,$longitude"
                    result.success(locationString)
                    locationUpdated = true
                    
                }
            }
        }, Looper.getMainLooper())
    } else {
        result.error("PERMISSION_DENIED", "Location permission not granted", null)
    }
}
}