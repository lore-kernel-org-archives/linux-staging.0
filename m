Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60F6D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:30:30 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EDTrLt082254;
	Wed, 14 Apr 2021 13:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wU0VPN8XSR49K6nzqIZyZad2yxBFf1o+d40zEAWMHTk=;
 b=d6OvLZdjFHGHurtOEhJtgQ1SBg1ylTogwzT3wJeAuraafAw4TksQIT3ZUEHUL5RnNG+u
 /yFP55qdOaxelZRXfx7uLeSp+qpxjN6hBfN8Nq1tsCfUQrY4l/ve8dZdeOyaO0Sluu9b
 og40Eea4YwegcrLngpF36CAHrcW+enMs//0ykTgPp/iuFM95irwYDYkHbB4B5ylrK9AF
 t/bE0YP9amxIkTNFqPztdtQQ+4/v401bcqh04L+AqSM6G5XWNDNQXC/1TUdMORRKs3aV
 ilTC5WQZlvX9nr2GM60hUWKsL5u+Wvd8EqtkElNia5Mk34pc6ntRk4ZI44gjdyg6wNP2 zQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 37u3erjebm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Apr 2021 13:30:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EDTilS119073;
	Wed, 14 Apr 2021 13:30:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 37unx1avc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Apr 2021 13:30:26 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13EDUQIN017918;
	Wed, 14 Apr 2021 13:30:26 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 14 Apr 2021 06:30:25 -0700
Date: Wed, 14 Apr 2021 16:30:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        "Spencer E . Olson" <olsonse@umich.edu>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
Message-ID: <20210414133018.GG6048@kadam>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com>
 <20210414100905.GD6048@kadam>
 <87e957d3-12b8-bac8-b1a3-ea10abee4ef5@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e957d3-12b8-bac8-b1a3-ea10abee4ef5@mev.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140093
X-Proofpoint-ORIG-GUID: 9a0bnUehKhaYkHfCtR5VuBusXtSCTGt1
X-Proofpoint-GUID: 9a0bnUehKhaYkHfCtR5VuBusXtSCTGt1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1015
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140093

On Wed, Apr 14, 2021 at 01:40:34PM +0100, Ian Abbott wrote:
> On 14/04/2021 11:09, Dan Carpenter wrote:
> > This driver is doing a bunch of DMA on stack which doesn't work on
> > all architectures.  You have to use kmalloc() (or vmalloc() I suppose)
> > memory for DMA.
> > 
> > drivers/staging/comedi/drivers/dt9812.c:249 dt9812_read_info() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:273 dt9812_read_multiple_registers() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:299 dt9812_write_multiple_registers() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:318 dt9812_rmw_multiple_registers() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:330 dt9812_digital_in() error: doing dma on the stack (value)
> > drivers/staging/comedi/drivers/dt9812.c:456 dt9812_analog_in() error: doing dma on the stack (val)
> > drivers/staging/comedi/drivers/dt9812.c:692 dt9812_reset_device() error: doing dma on the stack (&tmp8)
> > drivers/staging/comedi/drivers/dt9812.c:700 dt9812_reset_device() error: doing dma on the stack (&tmp8)
> > drivers/staging/comedi/drivers/dt9812.c:711 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> > drivers/staging/comedi/drivers/dt9812.c:718 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> > drivers/staging/comedi/drivers/dt9812.c:725 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> > drivers/staging/comedi/drivers/dt9812.c:732 dt9812_reset_device() error: doing dma on the stack (&tmp32)
> 
> Yes, it seems it requires a bit of an overhaul!

It's just 6 functions in a single file...

regards,
dan carpenter

