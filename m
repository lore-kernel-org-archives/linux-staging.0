Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476305F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 19:05:32 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OJ4fO7114269;
	Wed, 24 Mar 2021 19:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=I5jGnOiXIQiiAe4tC1a6BvtgazxIJq8WCfUhCJOFWAU=;
 b=DNIrinVjKcOJGzpOMOL0/hg12p2UZeTUeiEATNrR1sq8GJlbW5jzYCc8RQQ+U+Van0dJ
 MAcY4cVZ2Wl6qgArbhzrqX0tqljceL5bpWkymW7LDqWwBHk+S5o4r9FQnaijf6ACWniF
 DQQab/w3U3kz/xIk4L1ONo73GK1N7PZiRHmyZpi92m3isPD5lb/JFySHY6PlHGZVnfC8
 WIQez7ZPd3b/A+yjtp/vO20yHWh1s/E+UwV56N6M0+sVB8G61AWOHI93R64DAyuR0T5+
 rY25PaStRHAXpMnwD8fihihCqsu0khqR5b4/lIh9T0XHhk/oeB2FTXyl90CjmjxPDFyh bw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 37d90mkw9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 19:05:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OJ5CkE045171;
	Wed, 24 Mar 2021 19:05:27 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 37dtmr7dk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 19:05:27 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12OJ5QCI021018;
	Wed, 24 Mar 2021 19:05:26 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 24 Mar 2021 12:05:25 -0700
Date: Wed, 24 Mar 2021 22:05:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/21] Staging: rtl8723bs: remove enums in HalBtcOutSrc.h
Message-ID: <20210324190518.GQ1717@kadam>
References: <20210324183847.5595-1-marcocesati@gmail.com>
 <20210324183847.5595-18-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324183847.5595-18-marcocesati@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240137
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240137

On Wed, Mar 24, 2021 at 07:38:43PM +0100, Marco Cesati wrote:
> @@ -217,15 +199,6 @@ enum btc_wifi_pnp {
>  };
>  
>  /* for 8723b-d cut large current issue */

Delete this comment.

> -enum bt_wifi_coex_state {
> -	BTC_WIFI_STAT_INIT,
> -	BTC_WIFI_STAT_IQK,
> -	BTC_WIFI_STAT_NORMAL_OFF,
> -	BTC_WIFI_STAT_MP_OFF,
> -	BTC_WIFI_STAT_NORMAL,
> -	BTC_WIFI_STAT_ANT_DIV,
> -	BTC_WIFI_STAT_MAX
> -};
>  
>  /*  defined for BFP_BTC_GET */
>  enum btc_get_type {

regards,
dan carpenter

