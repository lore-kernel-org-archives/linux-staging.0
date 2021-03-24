Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67D5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 19:03:09 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OJ0ARJ053666;
	Wed, 24 Mar 2021 19:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=2u/p5s21vE096vax7IkyIqSKuRgx6qpPDYcf8zMR/QE=;
 b=b4U3ZJzipqB+DNv2rL1hSLG//oJ6ERCOeQx3xjOqme7jAm4N/Pzm55k+FOU4VKQj/mqm
 ArbgYg9zcBOEyNmZpb5GohI2+VTJGkWcsNYBf1u2FNxdBsAKUVXafPXE2+FVy9DvdJ4o
 5dw12cqqDOtzyb9BXB9wYLL1FPYHAaKYPHNlo27RQrgM11wEAsUmYzQqUbTBi0cgsYWK
 rms8zwapFO5to7jv9fXC9CBB0aABhp5ckxnKc5Zh3sgMb4VIv6wIEZUz8P/jpp+yGgE9
 YyvTgPb8ydAgGzrHJQn+a+FXFfqTqFBUCMvdA2t82OLRBFbmf5ymaZ2ld3CPJZf/l+a/ pg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 37d9pn3uwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 19:03:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OJ0TNA081568;
	Wed, 24 Mar 2021 19:03:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 37dty0y4r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 19:03:03 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12OJ31qd027425;
	Wed, 24 Mar 2021 19:03:01 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 24 Mar 2021 19:03:01 +0000
Date: Wed, 24 Mar 2021 22:02:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 08/21] Staging: rtl8723bs: remove enums in hal_com_h2c.h
Message-ID: <20210324190253.GP1717@kadam>
References: <20210324183847.5595-1-marcocesati@gmail.com>
 <20210324183847.5595-9-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324183847.5595-9-marcocesati@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240136
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240136

On Wed, Mar 24, 2021 at 07:38:34PM +0100, Marco Cesati wrote:
> Remove the following unnecessary enum definition in
> include/hal_com_h2c.h:
> 
> 	enum h2c_cmd
> 
> Signed-off-by: Marco Cesati <marcocesati@gmail.com>
> ---
>  .../staging/rtl8723bs/include/hal_com_h2c.h   | 60 -------------------
>  1 file changed, 60 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/hal_com_h2c.h b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
> index 65e9548c7b68..c7c2ff6c83b1 100644
> --- a/drivers/staging/rtl8723bs/include/hal_com_h2c.h
> +++ b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
> @@ -11,66 +11,6 @@
>  /*     H2C CMD DEFINITION    ------------------------------------------------ */
>  /*  */
>  /*  88e, 8723b, 8812, 8821, 92e use the same FW code base */

Delete these comments.

> -enum h2c_cmd {
> -	/* Common Class: 000 */
> -	H2C_RSVD_PAGE = 0x00,
> -	H2C_MEDIA_STATUS_RPT = 0x01,

regards,
dan carpenter

