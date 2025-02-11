module NRELServiceHelper
  def state_abbreviations
    state_names.keys
  end

  def state_names
    {"AK" => "Alaska", "AL" => "Alabama", "AZ" => "Arizona", "AR" => "Arkansas",
    "CA" => "California", "CO" => "Colorado", "CT" => "Connecticut", "DE" => "Delaware",
    "FL" => "Florida", "GA" => "Georgia", "HI" => "Hawaii", "ID" => "Idaho",
    "IL" => "Illinois", "IN" => "Indiana", "IA" => "Iowa", "KS" => "Kansas",
    "KY" => "Kentucky", "LA" => "Louisiana", "ME" => "Maine", "MD" => "Maryland",
    "MA" => "Massachusetts", "MI" => "Michigan", "MN" => "Minnesota", "MS" => "Mississippi",
    "MO" => "Missouri", "MT" => "Montana", "NE" => "Nebraska", "NV" => "Nevada",
    "NH" => "New Hampshire", "NJ" => "New Jersey", "NM" => "New Mexico",
    "NY" => "New York", "NC" => "North Carolina", "ND" => "North Dakota", "OH" => "Ohio",
    "OK" => "Oklahoma", "OR" => "Oregon", "PA" => "Pennsylvania", "RI" => "Rhode Island",
    "SC" => "South Carolina", "SD" => "South Dakota", "TN" => "Tennessee", "TX" => "Texas",
    "UT" => "Utah", "VT" => "Vermont", "VA" => "Virginia", "WA" => "Washington",
    "WV" => "West Virginia", "WI" => "Wisconsin", "WY" => "Wyoming", "DC" => "District of Columbia"}
  end

  def parse(path)
    JSON.parse(@connection.get(path).body)
  end

  def write_to_csv(input_data)
    CSV.open("/lib/assets/installs_data.csv", "a") do |csv|
      input_data.each do |row|
        csv << row[0].split(",")
      end
    end
  end
end
