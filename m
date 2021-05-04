Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BD71
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 08:18:17 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1447ejri018294;
	Tue, 4 May 2021 08:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=cRkYXPXX0BStF/p++GsGJZj+CRFK/alIZIOrBhRPi7U=;
 b=m+aJnoRgNdaGRHQfex4Pr5873l7Cp0hx3S3KNhjGQ0e3TjAofa4yCfHimw9sLtqhoxmF
 CiOdwNEz2tTeDdsBvADbmbvRlYtfiEKAGhrxXROrwBYozTCGBlnUeq6oKDY5lG97zy8q
 +Nr9aolbZtbsfasifQf2Mw0HOnXBGoLDoIz491+xjv6GTBs/0yI01ZDI9feZGKWsZDKp
 5uZDlPikQU/D3R15NPvxNJpEh5/wxtZZt2xtSk5mqE2lJ+fy6OYrt2JIQuZ6kcfBomiA
 jIhAILBSRaLflzWfUz9tt4VnavVkBmVyNPU++1p3dC5iJR5pZFaiHzONHIs/BDJAl4DC lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 388vgbp3cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 08:18:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1447fLxr092568;
	Tue, 4 May 2021 08:18:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 389grrq8s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 08:18:08 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1448I7g6010762;
	Tue, 4 May 2021 08:18:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 389grrq8rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 08:18:07 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1448I5w0028208;
	Tue, 4 May 2021 08:18:06 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 04 May 2021 01:18:05 -0700
Date: Tue, 4 May 2021 11:17:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jordan Vaughn <jordanvaughn1@gmail.com>
Cc: gregkh@linuxfoundation.org, ganesanr@broadcom.com,
        linux-staging@lists.linux.dev, Jordan Vaughn <jordvaughn1@gmail.com>,
        jchandra@broadcom.com
Subject: Re: [PATCH] netlogic: This patch formats existing comments to Linux
 standards found in TODO.
Message-ID: <20210504081758.GT1981@kadam>
References: <20210503170353.66415-1-jordvaughn1@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503170353.66415-1-jordvaughn1@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: bx36u0H1C8JLWqgI8O_GxgcXb6DDdu21
X-Proofpoint-ORIG-GUID: bx36u0H1C8JLWqgI8O_GxgcXb6DDdu21
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9973 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040058

The subject doesn't make sense.

> -/*
> - * Configure the 6 FIFO's that are used by the network accelarator to
> +/**
> + * xlr_config_fifo_spill_area() - Configure the 6 FIFO's that are used by the network accelarator to

This comment is way too long now.  For comments, we want to be within
the 80 character limit.


>   * communicate with the rest of the XLx device. 4 of the FIFO's are for
>   * packets from NA --> cpu (called Class FIFO's) and 2 are for feeding
>   * the NA with free descriptors.
> @@ -440,8 +439,8 @@ static void xlr_config_fifo_spill_area(struct xlr_net_priv *priv)

[ snip ]

> @@ -599,7 +600,7 @@ static int xlr_phy_write(u32 *base_addr, int phy_addr, int regnum, u16 val)
>  	unsigned long timeout, stoptime, checktime;
>  	int timedout;
>  
> -	/* 100ms timeout*/
> +
>  	timeout = msecs_to_jiffies(100);

This patch introduces a double blank line checkpatch warning.

>  	stoptime = jiffies + timeout;
>  	timedout = 0;
> @@ -629,7 +630,7 @@ static int xlr_phy_read(u32 *base_addr, int phy_addr, int regnum)
>  	unsigned long timeout, stoptime, checktime;
>  	int timedout;
>  
> -	/* 100ms timeout*/
> +
>  	timeout = msecs_to_jiffies(100);

Same.

>  	stoptime = jiffies + timeout;
>  	timedout = 0;

[ snip ]

> @@ -951,9 +954,7 @@ static int xlr_net_probe(struct platform_device *pdev)
>  	int err, port;
>  
>  	pr_info("XLR/XLS Ethernet Driver controller %d\n", pdev->id);
> -	/*
> -	 * Allocate our adapter data structure and attach it to the device.
> -	 */
> +	 /* Allocate our adapter data structure and attach it to the device.*/

There needs to be a space before the "*/" closing.

>  	adapter = devm_kzalloc(&pdev->dev, sizeof(*adapter), GFP_KERNEL);
>  	if (!adapter)
>  		return -ENOMEM;

regards,
dan carpenter

