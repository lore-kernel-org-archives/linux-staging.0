Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF9F5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:59:39 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OIxPBU108879;
	Wed, 24 Mar 2021 18:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=cs5/5WXZP/gKiB6NLcwGBKuB59XdMf/w5TN1Nkz5ylE=;
 b=qKgZ63OjyrQ1VBAGifXEZwOIDPrqrHEVfCdzAFR2Jqv+ASEyPBu0fWgWlXieo21Gg+Iv
 HQz/9V/pD4b6zl/8/PUzHN5aeDRyfIvK1NDWeC88Kgpge7Eh4IqLr+EA54hmvJniPUWw
 Nr1A6ZZbSdxNBQErM5mqVz4IU6k0ZyNit7xiJJyGEBp3qWG9CBYVhSY2cxTTu7JHJQF2
 +F+TP+Ck+0CJ1OhyjitIpsuOYQJwN/T8rJj9LXLZXHiHGh6gskP6raX8KS/AovrA50UL
 +W3ljYn5274I2sZpQaGNN09gUAEnRs+d/Egt2pGD+XGKTFasj0j1QRuOVn7d/wqg1CFx 5w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 37d90mkvpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 18:59:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OIouW5152104;
	Wed, 24 Mar 2021 18:59:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 37du006uky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 18:59:28 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12OIxR2T015456;
	Wed, 24 Mar 2021 18:59:27 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 24 Mar 2021 18:59:26 +0000
Date: Wed, 24 Mar 2021 21:59:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 06/21] Staging: rtl8723bs: remove enums in osdep_service.h
Message-ID: <20210324185919.GO1717@kadam>
References: <20210324183847.5595-1-marcocesati@gmail.com>
 <20210324183847.5595-7-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324183847.5595-7-marcocesati@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240135
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240136

On Wed, Mar 24, 2021 at 07:38:32PM +0100, Marco Cesati wrote:
> Remove the following unnecessary enum definitions in
> include/osdep_service.h:
> 
> 	enum mstat_f
> 	enum mstat_status
> 
> Signed-off-by: Marco Cesati <marcocesati@gmail.com>
> ---
>  .../staging/rtl8723bs/include/osdep_service.h | 23 -------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index c4d29d65187f..9405bdb2abf0 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -59,33 +59,10 @@
>  extern int RTW_STATUS_CODE(int error_code);
>  
>  /* flags used for rtw_mstat_update() */

This comment doesn't make sense any more.  Also we can delete
rtw_mstat_update().  Feel free to delete this in a follow on patch
instead of resending.

> -enum mstat_f {
> -	/* type: 0x00ff */
> -	MSTAT_TYPE_VIR = 0x00,
> -	MSTAT_TYPE_PHY = 0x01,

regards,
dan carpenter

