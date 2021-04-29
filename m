Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D4171
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 09:09:04 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T98ki2049052;
	Thu, 29 Apr 2021 09:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=pVOvWs4o83AhUjKw9u/DFvZ6kSPJVED+IHEwlgmkNso=;
 b=rEg8pBsvs14ayOih5m5rWUZnq8BxKPqOmCl6zXDlcdP/JBlavUR3depzWQ60E5v8bpL9
 P4lTPZIXcGLCmY/O8iMuABbCW7yM6v38YKwpjbKwxD0FWGGv0Z6iN4pO7w25lAilQ5D+
 MAtxosI1z6iKigbE4s+XMH8N5cN2I+1UPGjh/Y4d0iifV7zrO4O3YS3xc0HLOXD63KYc
 3S5zRg5bsfPD6nw6VmaHBF4l9EHtagIreYSzhf/P8EtbY8sECOwBP0jYkKxJzqdbrEOa
 /4DyjKQogmuW5X+LqoHFiaLuvTenKl71LNtqlsxj+GP8iWQAPKYQxKW0nV8Jo0bhaa4v 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 385afq3qek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Apr 2021 09:08:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T95taf098643;
	Thu, 29 Apr 2021 09:08:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 384b59ywug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Apr 2021 09:08:54 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13T95xBA099697;
	Thu, 29 Apr 2021 09:08:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 384b59ywtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Apr 2021 09:08:53 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13T98p82010405;
	Thu, 29 Apr 2021 09:08:52 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 29 Apr 2021 02:08:51 -0700
Date: Thu, 29 Apr 2021 12:08:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Amos Gross <email@amosgross.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: rtl8723bs: rtw_xmit: fixed tabbing issue
Message-ID: <20210429090845.GX1981@kadam>
References: <YIAVfRxQ+XmKEf47@arch.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIAVfRxQ+XmKEf47@arch.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: TbCq6FgvUtmaLXWfeU4wRbdiWBiV5L5l
X-Proofpoint-GUID: TbCq6FgvUtmaLXWfeU4wRbdiWBiV5L5l
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290065

On Wed, Apr 21, 2021 at 12:07:31PM +0000, Amos Gross wrote:
> Fixed warning from checkpatch for code block not being indented
> correctly.
> 
> Signed-off-by: Amos Gross <email@amosgross.com>

This isn't a bug fix but I always like to see a Fixes tag for these or
some kind of explanation about why it's wrong in the first place.  In
this case it's just that the indenting has never been correct since the
driver was first merged.

regards,
dan carpenter

