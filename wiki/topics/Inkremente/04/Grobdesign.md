# Grobdesign

---

### Übersicht

**Projekt**: Projekt Episko \
&nbsp;&nbsp;&nbsp;&nbsp;_Inkrement_: 4 \
&nbsp;&nbsp;&nbsp;&nbsp;_Arbeitspaket_: - \
**Autor**: Simon Blum, Ben Oeckl, Paul Stöckle\
**Datum**: 05.12.2024\
**Zuletzt geändert**: \
&nbsp;&nbsp;&nbsp;&nbsp;_von_: Simon Blum\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 24.01.2025\
**Version**: 2 \
**Prüfer**: Max Rodler\
**Letzte Freigabe**: \
&nbsp;&nbsp;&nbsp;&nbsp;_durch_: Max Rodler\
&nbsp;&nbsp;&nbsp;&nbsp;_am_: 24.01.2025 

### Changelog

| Datum      | Verfasser  | Kurzbeschreibung                  |
|------------|------------|-----------------------------------|
| 05.12.2024 | Simon Blum | Initiales Erstellen und Verfassen |
| 24.01.2025 | Simon Blum | Hinzufügen von Paketen/Modulen    |

### Distribution List

- Simon Blum <simon21.blum@gmail.com>
- Ben Oeckl <ben@oeckl.com>
- Maximilian Rodler <maximilianreinerrodler@gmail.com>
- Paul Stöckle <paul.stoeckle@t-online.de>

---

## Klassendiagramm

> **Anmerkung**: \
> Während das Klassendiagramm als Grundlage zur Implementierung sicherlich eine Stütze stellen kann,
> sollte trotzdem beachtet werden, dass Rust als Sprache sich nur begrenzt zur Objektorientierung anbietet
> und einiges durch leichte Veränderung idiomatischer, sauberer und effizienter implementiert werden kann
> und sollte.
> Hierfür sollen bei auftretenden Fällen, entsprechende Anmerkungen im Klassendiagramm angefügt werden.

```plantuml
@startuml
skinparam linetype ortho
title Class diagramm
legend bottom right
By default are parameters are classified
as "in".

The data/logic/frontend packages do seem like they could resemble a
classic model/view/controller architecture. However, since they are
not implemented as such the wording has been purposefully avoided.

end legend

package data {
    class Metadata {
        +uuid : Uuid
        +directory : Path
        +title : String
        +description : String
        +repository_url: String
        +created : DateTime
        +updated : DateTime
        --
        --Metadata will be constructed using a MetadataBuilder
        which has been left out for clarity
    '         {static} +builder() : MetadataBuilder
    '         +update() : MetadataBuilder
    }

    class Category {
        +id: i32
        +name: String
    }
    Metadata "*"-->"0..5" Category: +categories

    class Language {
        +id: i32
        +name: String
        +version: String
    }

    Metadata "*"-->"*" Language: +languages

    class IDE {
        +id: i32
        +name: String
    }


    Metadata "*"-->"1" IDE: +preferred_ide

    class BuildSystem {
        +id: i32
        +name: String
        +version: String
    }

    Metadata "*"-->"*" BuildSystem: +build_system


    class Config {
        +directories_to_load: List<Path>
        +files_to_load: List<Path>
        +database_directory: Path
    }

}

package logic {
    class ConfigController {
        -config_file_location: Path
        +load_config(): Result<Config>
        +add_saved_file(file: Path): Result<void>
        +add_saved_directory(dir: Path): Result<void>
    }

    ConfigController "1"-->"1" Config: -config

    class MetadataHandler {
        -cached_paths: HashSet<Path>
        __
        {static}+init(db_handler: DatabaseHandler): MetadataHandler
        .. Create ..
        +create_metadata(metadata: Metadata): Result<Metadata>
        .. Read ..
        +load_metadata(file: Path): Result<Metadata>
        +search_directory(dir: Path): List<Metadata>
        +load_cached_metadata(): Result<List<Metadata>>
        +search_metadata(query: String): Result<List<Metadata>>
        .. Update ..
        +update_metadata(metadata: Metadata): Result<Metadata>
        .. Delete ..
        +delete_metadata(id: Uuid): Result<void>
        --
        --return value from load_metadata/search_directory is
        not always needed
    }

    MetadataHandler "1"-->"1" DatabaseHandler: -db_handler



    class DatabaseHandler {

        -db_connection: DatabaseConnection

        {static} +init(path_to_db: Path): Result<DatabaseHandler>
        +cache_metadata(metadata: Metadata): Result<Uuid>
        +get_all_metadata(): Result<List<Metadata>>
        +filter_metadata(filter: Map<Any, Any>): Result<List<Metadata>>
        +get_metadata_by_id(id: Uuid) : Result<Option<Metadata>>
        +update_entry(metadata: Metadata): Result<Metadata>
        +delete_entry(id: Uuid): Result<Uuid>
    }

    class FileSystemHandler {
        +write_manifest(file: Path): Result<Void>
        +read_manifest(file: Path): Result<Metadata>
        +delete_manifest(file: Path): Result<Uuid>
        ..
        +search_directory(dir: Path): Result<List<Path>>
    }

    MetadataHandler "1"-->"1" FileSystemHandler: -fs_handler

    MetadataHandler "*"-->"1" Metadata: -cached_metadata
}

package statistics {
    class StatisticHandler {
        +generate_statistics(metadata: List<Metadata>): Statistics
    }

    class Statistics {
        +projects_by_language: Map<Language, Int>
        +projects_by_ide: Map<Ide, Int>
        +projects_by_category: Map<String, Int>
        +projects_by_build_system: Map<BuildSystem, Int>
        +number_of_projects: Int
    }

    StatisticHandler "1"-->"1" Statistics: -generated_statistics
}

package frontend{
    class App {
        {static} +init() : Result<App>
        -- Exposed to frontend --
        .. Create ...
        +create_metadata(metadata: Metadata): Result<Metadata>
        .. Read ..
        -- "retrieve" from cache
        +retrieve_all_metadata(): Result<List<Metadata>>
        +retrieve_searched_metadata(query: String): Result<List<Metadata>>
        +retrieve_filtered_metadata(filter: Map<Any, Any>): Result<List<Metadata>>
        -- "load" from files
        +search_directory(dir: Path, should_save: boolean): Result<List<Metadata>>
        +load_file(file: Path, should_save: boolean): Result<Metadata>
        .. Update ..
        +update_metadata(metadata: Metadata): Result<Metadata>
        .. Delete ..
        +delete_metadata(id: Uuid): Result<Uuid>
        .. Statistics ..
        +retrieve_statistics(): Statistics
    }

    App "1" -->"1" MetadataHandler: -metadata_handler


    App "1"-->"1" StatisticHandler: -statistics_handler

    App "1"-->"1" ConfigController: -config_controller
}



@enduml
```

## Sequenzdiagramme

Die Sequenzdiagramme basieren auf den Use-Cases und sind dementsprechend aufgeteilt.

### U1.1
```plantuml
@startuml U1.1 Start Application
'!CHANGE cached TO CACHED
actor User
boundary Gui
participant App
participant ConfigController
participant MetadataHandler
participant FileSystemHandler
participant DatabaseHandler
entity ManifestFile
entity ConfigFile
database Cache
' statistics

User -> Gui: Start Application
Gui -> App: init()
App -> ConfigController **: init()
' Config
ConfigController -> ConfigFile : load_config()
ConfigController --> App: ConfigController
App -> ConfigController : get_db_location()
ConfigController --> App : db_location
'DatabaseHandler
App -> DatabaseHandler ** : init(dbLocation)
DatabaseHandler --> App : DatabaseHandler
App -> MetadataHandler **: init(dbHandler)
MetadataHandler -> FileSystemHandler **
MetadataHandler --> App: MetadataHandler

App -> MetadataHandler ++: load_cached_metadata()
MetadataHandler -> DatabaseHandler ++ : get_all_metadata()
DatabaseHandler -> Cache : select *
Cache -> DatabaseHandler : QueryResult
DatabaseHandler --> MetadataHandler --: Result<List<Metadata>>
loop for each retrieved metadata
    MetadataHandler -> MetadataHandler :validate ⋔:
end

MetadataHandler -> MetadataHandler : cached_metadata
MetadataHandler --> App --: Result<void>

App -> ConfigController: get_saved_files()
ConfigController --> App: saved_files: List<Path>

loop for each saved_file
    App -> MetadataHandler ++: load_file(filePath)
    group if file_path not in cached_paths
            MetadataHandler -> MetadataHandler : LoadFile ⋔
    end
    MetadataHandler -> App --: Result<void>
end

App -> ConfigController : get_saved_directories()
ConfigController --> App: saved_directories: List<Path>

loop for each saved_directory
    App -> MetadataHandler ++: search_directory(dir)
    MetadataHandler -> FileSystemHandler: search_directory(dir)
    FileSystemHandler --> MetadataHandler: List<Path>
    loop for each received path
        group if file_path not in cached_paths
            MetadataHandler -> MetadataHandler : LoadFile ⋔
        end
        MetadataHandler -> App --: Result<void>
    end
end

App -> MetadataHandler: get_cached_metadata()
MetadataHandler --> App: List<Metadata>

App --> Gui: List<Metadata>
App -> App : StatisticGeneration ⋔

@enduml
```
### U1.2
```plantuml
@startuml Create Metadata
actor User
boundary Gui
participant App
participant MetadataHandler
participant FileSystemHandler
participant DatabaseHandler
entity ManifestFile
database Cache

User -> Gui : Create Metadata
Gui -> App: create_metadata(..)

App -> MetadataHandler: create_metadata(..)
' Caching
MetadataHandler -> DatabaseHandler : cache_metadata(..)
DatabaseHandler -> Cache : insert entry
DatabaseHandler --> MetadataHandler : Uuid
MetadataHandler -> DatabaseHandler : get_metadata_by_id(..)
DatabaseHandler -> Cache : select with id
Cache --> DatabaseHandler : Metadata
DatabaseHandler --> MetadataHandler : Metadata

MetadataHandler -> FileSystemHandler : write_manifest(..)
FileSystemHandler -> ManifestFile : create file
FileSystemHandler --> MetadataHandler: Result<void>


MetadataHandler --> App : Metadata
App --> Gui : Metadata
Gui --> User: Display Metadata

App -> App : StatisticGeneration ⋔



@enduml
```
### U1.3
```plantuml
@startuml Update Metadata
actor User
boundary Gui
participant App
participant MetadataHandler
participant FileSystemHandler
participant DatabaseHandler
entity ManifestFile
database Cache

User -> Gui : Update Metadata
Gui -> App: update_metadata(..)

App -> MetadataHandler: update_metadata(..)
' Caching
MetadataHandler -> DatabaseHandler : update_entry(..)
DatabaseHandler -> Cache : update entry
DatabaseHandler --> MetadataHandler : Uuid
MetadataHandler -> DatabaseHandler : get_metadata_by_id(..)
DatabaseHandler -> Cache : select with id
Cache --> DatabaseHandler : Metadata
DatabaseHandler --> MetadataHandler : Metadata

MetadataHandler -> FileSystemHandler : write_manifest(..)
FileSystemHandler -> ManifestFile : update file
FileSystemHandler --> MetadataHandler: Result<void>

MetadataHandler --> App : Metadata
App --> Gui : Metadata
Gui --> User: Display Metadata

App -> App : StatisticGeneration ⋔

@enduml
```
### U1.4
```plantuml
@startuml Delete Metadata
actor User
boundary Gui
participant App
participant MetadataHandler
participant FileSystemHandler
participant DatabaseHandler
entity ManifestFile
database Cache

User -> Gui : Delete Metadata
Gui -> App: delete_metadata(..)

App -> MetadataHandler: delete_metadata(..)
' Caching
MetadataHandler -> DatabaseHandler : delete_entry(..)
DatabaseHandler -> Cache : delete entry
Cache --> DatabaseHandler : Result<void>
DatabaseHandler --> MetadataHandler : Result<void>

MetadataHandler -> FileSystemHandler : delete_manifest(..)
FileSystemHandler -> ManifestFile : delete file
FileSystemHandler --> MetadataHandler: Result<void>

MetadataHandler --> App : Result<void>
App --> Gui : Result<void>
Gui --> User: Display Result

App -> App : StatisticGeneration ⋔
@enduml
```
### U2.1
```plantuml
@startuml Enter File
actor User
boundary Gui
participant App
participant MetadataHandler
participant ConfigController
entity ConfigFile

User -> Gui : Enter FilePath
Gui -> User : Save?
User --> Gui : should_save
Gui -> App : load_file(filePath, should_save)
App -> MetadataHandler: load_metadata(filePath)
MetadataHandler -> MetadataHandler : load_file ⋔
group if should_save
    MetadataHandler -> ConfigController : add_saved_file(filePath)
    ConfigController -> ConfigFile : save_config()
    ConfigController --> MetadataHandler : Result<void>
end

MetadataHandler --> App: Result<Metadata>
App --> Gui : Result<Metadata>
Gui --> User : Display Metadata

App -> App : StatisticGeneration ⋔
@enduml
```
### U2.2
```plantuml
@startuml Enter File
actor User
boundary Gui
participant App
participant MetadataHandler
participant ConfigController
participant FileSystemHandler
participant DatabaseHandler
entity ManifestFile
entity ConfigFile
database Cache

User -> Gui : Enter Directory
Gui -> User : Save?
User --> Gui : should_save
Gui -> App : search_directory(directory, should_save)
App -> MetadataHandler: search_metadata(directory)
MetadataHandler -> FileSystemHandler : search_directory(directory)
FileSystemHandler --> MetadataHandler : Result<List<Path>>
loop for each path received
    MetadataHandler -> MetadataHandler: LoadFile ⋔
end
group if should_save
    MetadataHandler -> ConfigController : add_saved_directory(directory)
    ConfigController -> ConfigFile : save_config()
    ConfigController --> MetadataHandler : Result<void>
end

MetadataHandler --> App: Result<List<Metadata>>
App --> Gui : Result<<Metadata>>
Gui --> User : Display Metadata

App -> App : StatisticGeneration ⋔
@enduml
```
### U3.1
```plantuml
@startuml Projekte durchsuchen
actor User
boundary Gui
participant App
participant MetadataHandler
participant DatabaseHandler
database Cache

User -> Gui : enter search
Gui -> App : retrieve_searched_metadata(query)
App -> MetadataHandler : search_metadata(query)
MetadataHandler -> MetadataHandler : create filter with query
MetadataHandler -> DatabaseHandler : search_metadata(filter)
DatabaseHandler -> Cache : select where filter applies
Cache --> DatabaseHandler : QueryResult
DatabaseHandler --> MetadataHandler : Result<List<Metadata>>
MetadataHandler --> App : Result<List<MetadataHandler>>
App --> Gui : Result<List<MetadataHandler>>
Gui --> User : display result
@enduml
```
### U3.2
```plantuml
@startuml Projekte durchsuchen
actor User
boundary Gui
participant App
participant MetadataHandler
participant DatabaseHandler
database Cache

User -> Gui : select filters
Gui -> App : retrieve_filtered_metadata(query)
App -> MetadataHandler : filter_metadata(query)
MetadataHandler -> DatabaseHandler : search_metadata(filter)
DatabaseHandler -> Cache : select where filter applies
Cache --> DatabaseHandler : QueryResult
DatabaseHandler --> MetadataHandler : Result<List<Metadata>>
MetadataHandler --> App : Result<List<MetadataHandler>>
App --> Gui : Result<List<MetadataHandler>>
Gui --> User : display result
@enduml
```
### U3.3
```plantuml
@startuml Statistiken
actor User
boundary Gui
participant App
participant MetadataHandler
participant StatisticHandler

User -> Gui : start application
Gui -> App: U1.1 ⋔
group StatisticGeneration
    App -> MetadataHandler : get_cached_metadata()
    MetadataHandler --> App: cached_metadata
    App -> StatisticHandler: generate_statistics(cachedMetadata)
    StatisticHandler --> StatisticHandler : generated_statistics
end

User -> Gui: open statistics page
Gui -> App: retrieve_statistics()
App -> StatisticHandler : get_generated_statistics()
StatisticHandler --> App : generated_statistics
App -> Gui: Statistics
Gui -> User: display statistics
@enduml
```

## Anforderungstracing

### Struktur

Die Anforderungsverfolgung ist aktuell nach folgender Struktur aufgebaut:

[Use Case] -> [Anforderung] -> [Klassenattribut]

In Zukunft soll diese noch in ein passendes Diagramm überführt werden.

### Verfolgung

UC1.1 -> FA1.1.1 -> App.retrieve_all_metadata()

UC1.1 -> FA1.1.2 -> FileSystemHandler.read_manifest()

UC1.2 -> FA1.2.1 -> App.create_metadata(), MetadataHandler.create_metadata(), DatabaseHandler.update_entry() FileSystemHandler.write_manifest()

UC1.2 -> FA1.2.2 -> FileSystemHandler.write_manifest()

UC1.2 -> FA1.2.3 -> DatabaseHandler.cache_metadata()

UC1.3 -> FA1.3.1 -> App.update_metadata()

UC1.3 -> FA1.3.2 -> MetadataHandler.update_metadata(), DatabaseHandler.update_entry()

UC1.3 -> FA1.3.3 -> MetadataHandler.load_metadata(), MetadataHandler.search_directory(), FileSystemHandler.read_manifest()

UC1.4 -> FA1.4.1 -> App.delete_metadata, MetadataHandler.delete_metadata, FileSystemHandler.delete_manifest()

UC1.4 -> FA1.4.2 -> DatabaseHandler.delete_entry(),

UC1.4 -> FA1.4.3 -> metadata_handler.load_metadata(), MetadataHandler.search_directory(), MetadataHandler.delete_metadata, DatabaseHandler.delete_entry()

UC2.1 -> FA2.1.1 -> App.loadFile, ConfigController.add_saved_file()

UC2.1 -> FA2.1.2 -> Siehe FA1.1.2

UC2.1 -> FA2.1.3 -> siehe FA1.2.3

UC2.1 -> FA2.1.4 -> App.search_directory(), ConfigController.add_saved_directory()

UC2.1 -> FA2.1.5 ->  MetadataHandler.search_directory(), FileSystemHandler.search_directory()

UC2.2 -> FA2.2.1 -> Siehe FA2.1.4

UC2.2 -> FA2.2.2 -> Siehe FA2.1.5

UC2.2 -> FA2.2.3 -> MetadataHandler.load_metadata(), MetadataHandler.update_metadata(), DatabaseHandler.update_entry()

UC2.2 -> FA2.2.4 -> Siehe FA2.1.5

UC2.2 -> FA2.2.5 -> Siehe FA2.1.5

UC3.1 -> FA3.1.1 -> MetadataHandler.search_metadata()

UC3.1 -> FA3.1.2 -> App.retrieve_searched_metadata() - Input der Methode stellt Nutzereingabe da

UC3.1 -> FA3.1.3 -> App.retrieve_searched_metadata() - Output Methode wird nutzer angezeigt

UC3.2 -> FA3.2.1 -> MetadataHandler.filter_metadata()

UC3.2 -> FA3.2.2 -> App.retrieve_filtered_metadata() - Input der Methode stellt Nutzereingabe da

UC3.2 -> FA3.2.3 -> App.retrieve_filtered_metadata() - Output Methode wird nutzer angezeigt

UC3.3 -> FA3.3.1 -> StatisticsController.generate_statistics()

UC3.3 -> FA3.3.2 -> StatisticsController.retrieve_statistics()
