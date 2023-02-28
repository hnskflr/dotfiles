import nmcli
from rofi import Rofi

nmcli.disable_use_sudo()

def main():
    connections = get_connections()
    wifis = nmcli.device.wifi("wlan0")
    
    r = Rofi()
    
    wifi_names = []
    for wifi in wifis:
        wifi_names.append(wifi.ssid)

    index, key = r.select("Select Wifi", wifi_names)
    wifi_name = wifi_names[index]
    
    if wifi_name in connections:
        nmcli.connection.up(wifi_names[index])

def get_connections():
    con_list = nmcli.connection()
    wifi_list = []

    for con in con_list:
        if con.conn_type == "wifi":
            wifi_list.append(con.name)
    
    return wifi_list


if __name__ == "__main__":
    main()
