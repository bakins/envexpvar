#!/bin/bash
mkdir -p /opt/envexpvar

mkdir -p /etc/service/envexpvar

cat <<EOF > /etc/service/envexpvar/run
#!/bin/sh
exec chpst -u nobody /opt/envexpvar/envexpvar 2>&1
EOF

chmod +x /etc/service/envexpvar/run

mkdir -p /etc/service/envexpvar/log

cat <<EOF > /etc/service/envexpvar/log/run
#!/bin/sh
mkdir -p /var/log/envexpvar
exec svlogd -tt /var/log/envexpvar
EOF

chmod +x  /etc/service/envexpvar/log/run

ln -sf /etc/service/envexpvar /etc/sv/
