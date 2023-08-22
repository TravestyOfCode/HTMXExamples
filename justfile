# Use PowerShell instead of sh:
set shell := ["powershell.exe", "-c"]

project := "HTMXExamples"
outputDir := "Data/Migrations"

# Lists the available recipes.
default:
    just --list

# Adds a new migration to the project.
add-migration name:
	dotnet ef migrations add {{name}} --project {{project}} -o {{outputDir}}

# Removes the last migration from the project.
remove-migration:
    dotnet ef migrations remove --project {{project}}

# Updates the database to match latest migration.
update-database:
    dotnet ef database update --project {{project}}

# Adds package with specific version
add-package package *v:
    dotnet add {{project}} package {{package}} {{v}}