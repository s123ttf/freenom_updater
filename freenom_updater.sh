while((1))
do
ip=`curl -L ip.tool.lu | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`
A=`host $FREENOM_DOMAIN | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}'`
if [$ip != $A]
then
    fdu record update $FREENOM_USERNAME $FREENOM_PASSWORD $FREENOM_DOMAIN
fi
done