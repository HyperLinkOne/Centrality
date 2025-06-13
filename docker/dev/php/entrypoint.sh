#!/bin/bash
# Exit immediately if a command exits with a non-zero status
#set -e

# Beispiel: Setze Dateiberechtigungen
#echo "Setting file permissions..."
#chown -R www-data:www-data /var/www/html

# Beispiel: Warte auf die Datenbank (falls erforderlich)
#echo "Waiting for the database to be ready..."
#until nc -z -v -w30 mariadb 3306
#do
#  echo "Waiting for database connection..."
#  sleep 1
#done

# Beispiel: Führe Datenbankmigrationen durch

# Clear cache
#php bin/console cache:clear

# Run database migrations
#echo "Running migrations..."
#php bin/console doctrine:migrations:migrate --no-interaction

#exec "$@"
# Starte den PHP-FPM-Prozess (wichtig, um den Hauptprozess zu starten)
#echo "Starting PHP-FPM..."
#exec php-fpm