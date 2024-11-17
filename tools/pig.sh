#!/bin/bash

# Basisverzeichnis für die Länderordner
base_dir="./country_folders"

# Liste der Ländercodes und Ländernamen als paarweise Einträge
countries=(
  "AF Afghanistan" "AL Albania" "DZ Algeria" "AS American_Samoa" "AD Andorra" "AO Angola"
  "AI Anguilla" "AQ Antarctica" "AG Antigua_and_Barbuda" "AR Argentina" "AM Armenia" "AU Australia"
  "AT Austria" "AZ Azerbaijan" "BS Bahamas" "BH Bahrain" "BD Bangladesh" "BB Barbados"
  "BY Belarus" "BE Belgium" "BZ Belize" "BJ Benin" "BM Bermuda" "BT Bhutan"
  "BO Bolivia" "BA Bosnia_and_Herzegovina" "BW Botswana" "BR Brazil" "IO British_Indian_Ocean_Territory"
  "BN Brunei" "BG Bulgaria" "BF Burkina_Faso" "BI Burundi" "CV Cabo_Verde" "KH Cambodia"
  "CM Cameroon" "CA Canada" "KY Cayman_Islands" "CF Central_African_Republic" "TD Chad" "CL Chile"
  "CN China" "CO Colombia" "KM Comoros" "CG Congo" "CR Costa_Rica" "CI Cote_d'Ivoire"
  "HR Croatia" "CU Cuba" "CY Cyprus" "CZ Czech_Republic" "DK Denmark" "DJ Djibouti"
  "DM Dominica" "DO Dominican_Republic" "EC Ecuador" "EG Egypt" "SV El_Salvador"
  "GQ Equatorial_Guinea" "ER Eritrea" "EE Estonia" "SZ Eswatini" "ET Ethiopia" "FJ Fiji"
  "FI Finland" "FR France" "GA Gabon" "GM Gambia" "GE Georgia" "DE Germany" "GH Ghana"
  "GR Greece" "GD Grenada" "GT Guatemala" "GN Guinea" "GW Guinea_Bissau" "GY Guyana"
  "HT Haiti" "HN Honduras" "HU Hungary" "IS Iceland" "IN India" "ID Indonesia"
  "IR Iran" "IQ Iraq" "IE Ireland" "IL Israel" "IT Italy" "JM Jamaica" "JP Japan"
  "JO Jordan" "KZ Kazakhstan" "KE Kenya" "KI Kiribati" "KW Kuwait" "KG Kyrgyzstan"
  "LA Laos" "LV Latvia" "LB Lebanon" "LS Lesotho" "LR Liberia" "LY Libya" "LI Liechtenstein"
  "LT Lithuania" "LU Luxembourg" "MG Madagascar" "MW Malawi" "MY Malaysia" "MV Maldives"
  "ML Mali" "MT Malta" "MH Marshall_Islands" "MR Mauritania" "MU Mauritius" "MX Mexico"
  "FM Micronesia" "MD Moldova" "MC Monaco" "MN Mongolia" "ME Montenegro" "MA Morocco"
  "MZ Mozambique" "MM Myanmar" "NA Namibia" "NR Nauru" "NP Nepal" "NL Netherlands"
  "NZ New_Zealand" "NI Nicaragua" "NE Niger" "NG Nigeria" "NO Norway" "OM Oman"
  "PK Pakistan" "PW Palau" "PA Panama" "PG Papua_New_Guinea" "PY Paraguay" "PE Peru"
  "PH Philippines" "PL Poland" "PT Portugal" "QA Qatar" "RO Romania" "RU Russia"
  "RW Rwanda" "KN Saint_Kitts_and_Nevis" "LC Saint_Lucia" "VC Saint_Vincent_and_the_Grenadines"
  "WS Samoa" "SM San_Marino" "ST Sao_Tome_and_Principe" "SA Saudi_Arabia" "SN Senegal"
  "RS Serbia" "SC Seychelles" "SL Sierra_Leone" "SG Singapore" "SK Slovakia" "SI Slovenia"
  "SB Solomon_Islands" "SO Somalia" "ZA South_Africa" "SS South_Sudan" "ES Spain" "LK Sri_Lanka"
  "SD Sudan" "SR Suriname" "SE Sweden" "CH Switzerland" "SY Syria" "TW Taiwan"
  "TJ Tajikistan" "TZ Tanzania" "TH Thailand" "TL Timor_Leste" "TG Togo" "TO Tonga"
  "TT Trinidad_and_Tobago" "TN Tunisia" "TR Turkey" "TM Turkmenistan" "UG Uganda" "UA Ukraine"
  "AE United_Arab_Emirates" "GB United_Kingdom" "US United_States" "UY Uruguay" "UZ Uzbekistan"
  "VU Vanuatu" "VE Venezuela" "VN Vietnam" "YE Yemen" "ZM Zambia" "ZW Zimbabwe"
)

# Basisverzeichnis erstellen, falls es nicht existiert
mkdir -p "$base_dir"

# Ordner und index.astro für jedes Land erstellen
for country in "${countries[@]}"; do
  code=$(echo $country | awk '{print $1}')
  name=$(echo $country | awk '{for(i=2;i<=NF;++i) printf "%s ", $i; print ""}' | sed 's/ $//')
  folder_path="$base_dir/$code"
  mkdir -p "$folder_path"

  # Inhalt für die index.astro-Datei
  cat > "$folder_path/index.astro" <<EOF
---
import Layout from "../../../layouts/Layout.astro";
import EdgeFunctionExplainer from "../../../components/EdgeFunctionExplainer.astro";
---

<Layout title="In $name">
    <h1 class="mb-8">You are in $name ($code)!</h1>
    <EdgeFunctionExplainer />
</Layout>
EOF

  echo "Ordner erstellt: $folder_path und index.astro hinzugefügt mit Ländercode $code und Namen $name."
done

echo "Alle Ordner und index.astro-Dateien wurden erstellt."