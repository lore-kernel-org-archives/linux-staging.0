Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE75F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 11:03:45 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QAxkng087719;
	Fri, 26 Mar 2021 11:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=R6xFSwjLE6/8otZaDsmA/39k0i1WoJeR+EjZyhQcHkQ=;
 b=LaZjgHN8P68NXvD1HyZuNrjCFVkAPklD7gqsTbuNFTB7dxRhfHgdDgfSB5oqzTtofqXx
 LTq1DFxeqI3H7AoNP5zV3P1yRoV1teOPrOBxY6pr+M9B4ki4hZ9NElzJVe9mWLK9jYxL
 4OPMsBkz2xRR5pI+ajpuCWiZaU6vdG9tcGtkAQ25chZXz1E0TUIsBeKSXQ3SJtzrIBFd
 cE9vDfWZ1/tPlYI3tlFOYuN+rvG/23rQZav3n8mOJrSiwa0332wvtBGmrnGtepXqJgxC
 PS1O8oyL4+RZyPgEAqhKdYhYHY1290I10RIT03ha3aPkpG7uXjwtPpREmxpbJnpWrjSl Hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 37h13rsp6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Mar 2021 11:03:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QAuK4F017248;
	Fri, 26 Mar 2021 11:03:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 37h14h206a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Mar 2021 11:03:35 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12QB3WLV020579;
	Fri, 26 Mar 2021 11:03:33 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 26 Mar 2021 04:03:31 -0700
Date: Fri, 26 Mar 2021 14:03:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [bug report] staging: rtl8723bs: remove unused code blocks
 conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*
Message-ID: <20210326110321.GA1667@kadam>
References: <YFxQSJXXQ4dFPGS4@mwanda>
 <20210326082442.GA1452@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326082442.GA1452@agape.jhs>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260081
X-Proofpoint-ORIG-GUID: Xf2B6SOL3esu55ZBqpOWPsqwVgII2VH5
X-Proofpoint-GUID: Xf2B6SOL3esu55ZBqpOWPsqwVgII2VH5
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260081

On Fri, Mar 26, 2021 at 09:24:43AM +0100, Fabio Aiuto wrote:
> On Thu, Mar 25, 2021 at 11:56:40AM +0300, Dan Carpenter wrote:
> > Hello Fabio Aiuto,
> > 
> > The patch 65f183001f6e: "staging: rtl8723bs: remove unused code
> > blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*" from
> > Mar 16, 2021, leads to the following static checker warning:
> > 
> > 	drivers/staging/rtl8723bs/core/rtw_ap.c:911 start_bss_network()
> > 	warn: inconsistent indenting
> > 
> > drivers/staging/rtl8723bs/core/rtw_ap.c
> >    904                  rtw_get_capability((struct wlan_bssid_ex *)pnetwork)
> >    905          );
> >    906  
> >    907          if (pmlmeext->bstart_bss) {
> >    908                  update_beacon(padapter, WLAN_EID_TIM, NULL, true);
> >    909  
> >    910          /* issue beacon frame */
> > 
> > The patch accidentally deleted these extra tab for this block.
> > 
> >    911          if (send_beacon(padapter) == _FAIL)
> >    912                  DBG_871X("issue_beacon, fail!\n");
> >    913  
> >    914          }
> >    915  
> >    916          /* update bc/mc sta_info */
> >    917          update_bmc_sta(padapter);
> >    918  
> > 
> > regards,
> > dan carpenter
> 
> Thank you Dan,
> 
> sent yesterday a fix,
> 

Thanks!

regards,
dan carpenter

