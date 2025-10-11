//
//  ContentView.swift
//  VolumeConverter
//
//  Created by Michael C. Herrera on 10/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var volume: Double?
    @State private var selectedVolumeUnit: String = "liters"
    @State private var ConversionUnit: String = "liters"

    let volumeUnits: [String] = [
        "milliliters", "liters", "cups", "pints", "gallons",
    ]

    var result: String {
        guard let volume = volume else { return "0.00" }

        if self.selectedVolumeUnit == ConversionUnit {
            return String(format: "%.2f", volume)
        }

        var inputVolume: Double = 0

        switch self.selectedVolumeUnit {
        case "milliliters":
            inputVolume = volume
        case "liters":
            inputVolume = volume * 1000
        case "cups":
            inputVolume = volume * 4.22675
        case "pints":
            inputVolume = volume * 211.338
        case "gallons":
            inputVolume = volume * 2641.72
        default:
            break
        }

        if ConversionUnit == "milliliters" {
            return inputVolume.formatted(.number.precision(.fractionLength(2)))
        } else if ConversionUnit == "liters" {
            return (inputVolume * 0.001).formatted(
                .number.precision(.fractionLength(2))
            )
        } else if ConversionUnit == "cups" {
            return (inputVolume * 0.00422675).formatted(
                .number.precision(.fractionLength(2))
            )
        } else if ConversionUnit == "pints" {
            return (inputVolume * 0.00211338).formatted(
                .number.precision(.fractionLength(2))
            )
        } else if ConversionUnit == "gallons" {
            return (inputVolume * 0.000264172).formatted(
                .number.precision(.fractionLength(2))
            )
        }

        return inputVolume.formatted(.number.precision(.fractionLength(2)))
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Volume") {
                    TextField(
                        "Enter volume",
                        value: $volume,
                        format: .number
                    )
                    .keyboardType(.decimalPad)

                    Picker("Unit", selection: $selectedVolumeUnit) {
                        ForEach(volumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Conversion to") {
                    Picker("Convert to", selection: $ConversionUnit) {
                        ForEach(volumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Result") {
                    Text("\(result) \(ConversionUnit)")
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}

#Preview {
    ContentView()
}
