FROM mcr.microsoft.com/dotnet/core/sdk:7.0 AS build
WORKDIR /app

COPY aspnetapp/ YourProjectName.sln .
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 5015
ENTRYPOINT ["dotnet", "YourProjectName.dll"]
