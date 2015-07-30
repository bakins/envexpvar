#!/bin/bash
mkdir -p /opt/envexpvar

mkdir -p /etc/services/envexpvar

cat <<EOF > /etc/services/envexpvar/run
#!/bin/sh
exec chpst -u nobody /opt/envexpvar/envexpvar 2>&1
EOF

chmod +x /etc/services/envexpvar/run

mkdir -p /etc/services/envexpvar/log

cat <<EOF > /etc/services/envexpvar/log/run
#!/bin/sh
mkdir -p /var/log/envexpvar
exec svlogd -tt /var/log/envexpvar
EOF

chmod +x  /etc/services/envexpvar/log/run

ln -sf /etc/services/envexpvar /etc/sv/
