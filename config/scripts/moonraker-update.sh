#!/bin/bash

source /home/pi/Minion_data/config/scripts/moonraker-ensure-policykit-rules.sh
ensure_moonraker_policiykit_rules

validate_moonraker_config()
{
  echo "Ensuring valid moonraker config.."
  install_version=$(/home/pi/moonraker-env/bin/python -mlmdb -e /home/pi/.moonraker_database/ -d moonraker get validate_install)
  cat /home/pi/Minion_data/moonraker.conf | grep "\[include config/moonraker.conf\]" > /dev/null
  has_include=$?
  if [ $has_include -eq 0 ] && [ "$install_version" = "'validate_install': missing" ]; then
    # Temporarily replace with old config
    echo "Installing old moonraker config.."
	echo $has_include
	echo $install_version
    # cp /home/pi/Minion_data/config/old-moonraker.conf /home/pi/Minion-data/config/moonraker.conf
  fi
}

validate_moonraker_config
