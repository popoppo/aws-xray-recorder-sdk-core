(defproject com.github.popoppo/aws-xray-recorder-sdk-core "0.1.0-SNAPSHOT"
  :description "Customized aws-xray-recorder-sdk-core"
  :url "https://github.com/popoppo/aws-xray-recorder-sdk-core"
  :license {:name "Apache License, Version 2.0"
            :url "https://www.apache.org/licenses/LICENSE-2.0"}
  :dependencies [[com.amazonaws/aws-java-sdk-core "1.11.903"]]
  :filespecs [{:type :path :path "classes"}]
  :jar-exclusions [#".*\.(jar)$"]
  :uberjar-exclusions [#".*\.(jar)$"])
