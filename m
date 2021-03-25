Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FDD6F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 08:56:56 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P8sj34069835;
	Thu, 25 Mar 2021 08:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=a6v9jRWiy36eDEM/CCLOlX8gAvNC3LXoJodcbhXckrA=;
 b=bMS90AYmzn09whViqAPmCvWC3Hn4rtlcI4lV5T14b4Iy/s+In1JBsC/WOY1QjAo+6u8r
 x0xR0Beuto72cIxAxkuoAgSYPwTh6z0VsCoewXNAdLwUSdxn3CuH4JbMczZu3cdrz7h6
 0Brc6WtM/7it+nFBP+5oVqXyKmx//eEe++5rrLH5G2bGCyVz5aCx26Y1T+x9hZFC7rUa
 8V3WsPCxaHOvSgb16pZeJoaZvpqiS8O4L6R3G2z0PigyoCbE+xDgcHGLsEQHIubGHH+U
 gHXYs/+IifbskEyBOHzY+zA0jtZZw5xcr/r+E/O0mLz53l0Ib/qrVQk/kERpUQ4o14Tb wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2130.oracle.com with ESMTP id 37d6jbnn86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Mar 2021 08:56:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P8pGco079805;
	Thu, 25 Mar 2021 08:56:48 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 37dtmrvddc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Mar 2021 08:56:47 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12P8ukOX023681;
	Thu, 25 Mar 2021 08:56:46 GMT
Received: from mwanda (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 25 Mar 2021 08:56:46 +0000
Date: Thu, 25 Mar 2021 11:56:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: fabioaiuto83@gmail.com
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: rtl8723bs: remove unused code blocks
 conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*
Message-ID: <YFxQSJXXQ4dFPGS4@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250068

Hello Fabio Aiuto,

The patch 65f183001f6e: "staging: rtl8723bs: remove unused code
blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*" from
Mar 16, 2021, leads to the following static checker warning:

	drivers/staging/rtl8723bs/core/rtw_ap.c:911 start_bss_network()
	warn: inconsistent indenting

drivers/staging/rtl8723bs/core/rtw_ap.c
   904                  rtw_get_capability((struct wlan_bssid_ex *)pnetwork)
   905          );
   906  
   907          if (pmlmeext->bstart_bss) {
   908                  update_beacon(padapter, WLAN_EID_TIM, NULL, true);
   909  
   910          /* issue beacon frame */

The patch accidentally deleted these extra tab for this block.

   911          if (send_beacon(padapter) == _FAIL)
   912                  DBG_871X("issue_beacon, fail!\n");
   913  
   914          }
   915  
   916          /* update bc/mc sta_info */
   917          update_bmc_sta(padapter);
   918  

regards,
dan carpenter
