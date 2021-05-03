Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8D070
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 11:48:39 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 143BeDEa114157;
	Mon, 3 May 2021 11:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=jZ2WGUZLFkJVaGSH+0SvXdVzfAUN3Jod1EyNdiZi+QU=;
 b=Y7dcfDShjGL+NH6jjZUsjdCoNjYxOT/1jeY6yNEN77IPNuTJtq2Rx7tHqH2/ZVg2O7Mk
 f4UuEOBGMpbDiQjTYas467JsnxTpjoVdEIfPamI/0PE6g2g6nBXyarHQRbLRkruzNyTn
 EVb+ldCsDiEwkM0ibxOYZaziF7Ewp526cCbwo1UB/0aXTUdjRSQLcIraSWVvtDlq9xSN
 5sMBV0NKNkopRcQ4mz6yu5e1NpYWegPJH4wqSKAwZ9K6kKMScRMZixc5VOXFE3drfhMV
 4VagvC60rKP7dqPL8FPtrOtDp+pAM3BixY73tF34Olo4ZHOzlGKS87gPmUa7f+vjSmjz fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 388xxmuayh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 May 2021 11:48:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 143BfDeA016620;
	Mon, 3 May 2021 11:48:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 389grqm98d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 May 2021 11:48:31 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 143BmUUZ037937;
	Mon, 3 May 2021 11:48:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 389grqm981-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 May 2021 11:48:30 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 143BmT4L015840;
	Mon, 3 May 2021 11:48:29 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 03 May 2021 04:48:28 -0700
Date: Mon, 3 May 2021 14:48:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/43] staging: rtl8723bs: clean up driver from
 private debug facilities
Message-ID: <20210503114821.GQ1981@kadam>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
 <20210503075201.GN1981@kadam>
 <20210503081717.GA8953@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503081717.GA8953@agape.jhs>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: UQKdgE_C_RZ5mZls7lEGzHD_0w9tjP4V
X-Proofpoint-ORIG-GUID: UQKdgE_C_RZ5mZls7lEGzHD_0w9tjP4V
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9972 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030081

On Mon, May 03, 2021 at 10:17:18AM +0200, Fabio Aiuto wrote:
> On Mon, May 03, 2021 at 10:52:01AM +0300, Dan Carpenter wrote:
> > Looks good.
> > 
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > regards,
> > dan carpenter
> > 
> 
> thanks Dan,
> 
> when a tag is offered this way, am I supposed to resend the patchset with
> the offered tag added on or it's just a tag which Greg is going to add when
> accept all in his tree?

No.  Greg will add it.

regards,
dan carpenter

