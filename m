Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134F2F80
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 06:22:53 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14Q69Rvw124764;
	Wed, 26 May 2021 06:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=FiTKKTT/v6P8G6n97RNs+YZ+S3F+d7bHbdjPNefmcgU=;
 b=B9xzpcQNlavH8FQVgXzg5tELYdY+TDX2tq2yBXYhTOHQ0Lpi/za8Oey6t7vDzEiWnGlg
 GykmeP/HAzREj6DRSxvVkiiKFuG7hSSzXH3eSb0vZgPwzVkgFm+VHMB/qPBzC+U1Rpe/
 3NiQjooF8vu/d7+Tbx1nlSiXtlF9cJXK35OhmcR8YNrbaKATI36fagirxP7GAHRFSxML
 zqnv6QewBRsqT7VvZLtIHhWc3tmtK+bzgxwkpge52r8wQezDywQFo7pqdJKOy025bAQX
 ikyeFLep6QYqAW/6lmteWShD1HNMNmCw98uAvLTQ6OMZNd2ONxwioFhMlstrnjS3nKNG zQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 38q3q8ye1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 May 2021 06:22:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14Q6AET9032511;
	Wed, 26 May 2021 06:22:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 38qbqsy8gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 May 2021 06:22:40 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14Q6K4Up052077;
	Wed, 26 May 2021 06:22:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3020.oracle.com with ESMTP id 38qbqsy8g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 May 2021 06:22:40 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14Q6Mbxk013463;
	Wed, 26 May 2021 06:22:39 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 25 May 2021 23:22:37 -0700
Date: Wed, 26 May 2021 09:22:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove the repeated declaration
Message-ID: <20210526062231.GP1955@kadam>
References: <1621923531-21262-1-git-send-email-zhangshaokun@hisilicon.com>
 <YK0kIsNcPHDhvT8D@kroah.com>
 <fbeba5db-c55d-dcb1-92f7-63dc437f0c82@hisilicon.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbeba5db-c55d-dcb1-92f7-63dc437f0c82@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: jmWuvenFuXYyI0xtCrulg4c47GNuMEyY
X-Proofpoint-ORIG-GUID: jmWuvenFuXYyI0xtCrulg4c47GNuMEyY
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105260041

On Wed, May 26, 2021 at 02:14:53PM +0800, Shaokun Zhang wrote:
> Hi Greg,
> 
> On 2021/5/26 0:21, Greg Kroah-Hartman wrote:
> > On Tue, May 25, 2021 at 02:18:51PM +0800, Shaokun Zhang wrote:
> >> Function 'Hal_SetBandwidth' is declared twice, remove the
> >> repeated declaration.
> >>
> >> Cc: Hans de Goede <hdegoede@redhat.com>
> >> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> >> ---
> >>  drivers/staging/rtl8723bs/include/rtw_mp.h | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
> >> index 2788ad80b114..ea3abee325ef 100644
> >> --- a/drivers/staging/rtl8723bs/include/rtw_mp.h
> >> +++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
> >> @@ -348,7 +348,6 @@ void Hal_SetCarrierSuppressionTx(struct adapter *padapter, u8 bStart);
> >>  void Hal_SetSingleToneTx(struct adapter *padapter, u8 bStart);
> >>  void Hal_SetSingleCarrierTx(struct adapter *padapter, u8 bStart);
> >>  void Hal_SetContinuousTx(struct adapter *padapter, u8 bStart);
> >> -void Hal_SetBandwidth(struct adapter *padapter);
> >>  
> >>  void Hal_SetDataRate(struct adapter *padapter);
> >>  void Hal_SetChannel(struct adapter *padapter);
> >> -- 
> >> 2.7.4
> >>
> >>
> > 
> > You sent 2 patches with identical subjects, yet they did different
> > things :(
> > 
> 
> Oops, my apologies that I didn't check it carefully.
> 
> > Please fix up and send a patch series that properly identifies what is
> 
> Since both are the trivial patch on rtl8723bs, shall I do a single patch
> to cleanup this?
> 

Yes.  Combine these two patches because they do the same thing to the
same driver.

regards,
dan carpenter

