Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DD5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 19:07:08 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OJ4vjr194797;
	Wed, 24 Mar 2021 19:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=LNDD0jCzpRhp4theXoRAletQH9Llxl0hjdZtPOsxAmM=;
 b=I0OzSAWIy6ipxWG9rY6flOBWFifCZ9y5d6HiJdm5kf/K9utBq5x1CDIsKxTkfzfX7AB1
 4DoIBYku97izlRxPmVNGi8B66oAjlW5xaLINtncle9rmkGNK+0QAs39QSDVXLN0ZBlIP
 Fv27Dm0ke2rCFpA9X9wuMsh6j4+IeXfKEHu8kcdPOOE0umRGNL8e0iWj49c0JeZRAF2T
 DyK1+SEnWscLd1hyNIxhPAqJt2tHq56/d2EMCCAOUjxbE8qsk2yHxiZLxI24WhJ79sK1
 YB0Jf6AZ+408quhuD0jw+0+5UI4jSbN9zAeuco+zScSoGAETFI1+HuV+kPRUIBCJ3DKD Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 37d8frbxbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 19:07:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OJ5Cnn045204;
	Wed, 24 Mar 2021 19:07:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 37dtmr7fg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 19:07:02 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12OJ712M022035;
	Wed, 24 Mar 2021 19:07:01 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 24 Mar 2021 19:07:00 +0000
Date: Wed, 24 Mar 2021 22:06:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 21/21] Staging: rtl8723bs: remove enums in odm.h
Message-ID: <20210324190652.GR1717@kadam>
References: <20210324183847.5595-1-marcocesati@gmail.com>
 <20210324183847.5595-22-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324183847.5595-22-marcocesati@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240137
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240137

On Wed, Mar 24, 2021 at 07:38:47PM +0100, Marco Cesati wrote:
> @@ -1270,11 +1158,6 @@ enum dm_rf_e { /* tag_RF_Type_Definition */
>  /* 3 =========================================================== */
>  /* 3 Antenna Diversity */
>  /* 3 =========================================================== */

Probably this comment can go as well.

> -enum dm_swas_e { /* tag_SW_Antenna_Switch_Definition */
> -	Antenna_A = 1,
> -	Antenna_B = 2,
> -	Antenna_MAX = 3,
> -};
>  

regards,
dan carpenter

