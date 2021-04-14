Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723546D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:28:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EDNq8I066735;
	Wed, 14 Apr 2021 13:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=jAls2IFDVFZAUsCc/vhOJmMpWwouW7cbvWwf4P2kv2s=;
 b=zLKUwYqIHql9dsuY3E9V6w7HBmb/bUfTAIdgiyldu2L1xYF59QdOxI2n7Eh0jTrHg4Uy
 Ggi619zFxFXlue2ynavcitjRIpOeNMlWdbVon+aYMOUvrp2uWfebnH1e3STpDjx6kcij
 u9NClY0jLSInAezrqyyTHYJRNVd+yDCQL2Te8nUflHOxIIv3s3l6XZdEF4J/up5FhVeK
 1sfL7rp6lLWvfrmnEtkpFw3TgF9ANtYzOo5Srjxj9/d5ASEjTUT0fo8m9ainMGH/WwU1
 I+Dfj2ziEX/YyoMRwKkOmq5w9OPoF6dmcinsQCvGd8HCaK2UVuUPtL2aow9rxRlqaCog zg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 37u3erje4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Apr 2021 13:28:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EDPjFh105685;
	Wed, 14 Apr 2021 13:28:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 37unx1aspy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Apr 2021 13:28:29 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13EDSPI6026973;
	Wed, 14 Apr 2021 13:28:27 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 14 Apr 2021 06:28:24 -0700
Date: Wed, 14 Apr 2021 16:28:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        "Spencer E . Olson" <olsonse@umich.edu>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
Message-ID: <20210414132818.GF6048@kadam>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com>
 <20210414100905.GD6048@kadam>
 <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140092
X-Proofpoint-ORIG-GUID: 6-loLX8KaNMwitshSHu8mjmVGdJGGHF1
X-Proofpoint-GUID: 6-loLX8KaNMwitshSHu8mjmVGdJGGHF1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1015
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140092

On Wed, Apr 14, 2021 at 01:34:23PM +0100, Ian Abbott wrote:
> > drivers/staging/comedi/drivers/ni_routes.c:61 ni_find_route_values() warn: 'device_family' sometimes too small '8,11' size = 30
> >      59          for (i = 0; ni_all_route_values[i]; ++i) {
> >      60                  if (memcmp(ni_all_route_values[i]->family, device_family,
> >                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >      61                             strnlen(device_family, 30)) == 0) {
> >                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > This whole memcmp() is very strange.  Why not just use:
> > 
> > 	if (strncmp(ni_all_route_values[i]->family, device_family, 30) == 0)
> 
> I think even a simple strcmp() would do as well because all the device
> family strings and board name strings are null terminated.  I don't know why
> the magic number 30 is used here!
> 
> The above applies similarly to ni_find_valid_routes() too.
> 

I was thinking maybe ni_all_route_values[i]->family has an additional
string on the end.  For example, it could end in "_bar" and we want
->family "foo_bar" to match with device_family "foo"?

regards,
dan carpenter

