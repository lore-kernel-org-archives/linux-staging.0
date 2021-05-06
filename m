Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27270
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 09:45:00 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1469OdG4030963;
	Thu, 6 May 2021 09:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=nGsE20/kCx0Wlb3wRw8CTVYanreKBibL1Vdw1uPE3iQ=;
 b=0g5tRrdmYLQvZ10GfuX43nIah/5A2pT4dRPMwfuSJE/cA5GKJTO8OHxYT4oMWUHLnfHM
 at8OjQ+2nPNd59HYaoU0a/M6gHVhIfp9fkpqvzTn8fWb3dx9D7uXiwooGfM670JDhlVF
 +zwyIJb4adzcRiuF1AhfOskC2JHeMEi2xvX67xoVwecWgmKb1NNNWnImYngyZaeT/O0j
 mdkRSHaGYBQS5mhsaTQhSuTFhAfbUUcDSiMu/C6WCVj2XzX2lAWwR+4iuiFZTrJxQPOd
 /x25GZm8U9hAWMONF8m0FJ6/DYDNl29ZvfoLdl5qv6GzDhlHdjXM1vk8FD4PoSzJex5E 9g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 38bebc4ec2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 May 2021 09:44:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1469PhEO004785;
	Thu, 6 May 2021 09:44:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 38bewsgnht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 May 2021 09:44:50 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1469f1pC055155;
	Thu, 6 May 2021 09:44:49 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 38bewsgnhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 May 2021 09:44:49 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1469ilF8021419;
	Thu, 6 May 2021 09:44:47 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 06 May 2021 02:44:46 -0700
Date: Thu, 6 May 2021 12:44:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        Sven Van Asbroeck <TheSven73@gmail.com>, linux-staging@lists.linux.dev,
        kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] staging: fieldbus: anybus: Make remove callback
 return void
Message-ID: <20210506094438.GB1955@kadam>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210506064843.GA1432@agape.jhs>
 <20210506075213.uytlw6txmgstapam@pengutronix.de>
 <20210506084017.GB1432@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506084017.GB1432@agape.jhs>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: KJKDlcshQdQzHJftsVSAW6ctP-1W0Txs
X-Proofpoint-GUID: KJKDlcshQdQzHJftsVSAW6ctP-1W0Txs
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9975 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060065

On Thu, May 06, 2021 at 10:40:18AM +0200, Fabio Aiuto wrote:
> On Thu, May 06, 2021 at 09:52:13AM +0200, Uwe Kleine-König wrote:
> > On Thu, May 06, 2021 at 08:48:44AM +0200, Fabio Aiuto wrote:
> > > Hello Uwe,
> > > 
> > > On Wed, May 05, 2021 at 10:29:22PM +0200, Uwe Kleine-König wrote:
> > > > The driver core ignores the return value of struct bus_type::remove()
> > > > because there is only little that can be done. To simplify the quest to
> > > > make this function return void, let struct vio_driver::remove() return
> > > > void, too. All users already unconditionally return 0, this commit makes
> > > > it obvious that returning an error code is a bad idea.
> > > 
> > > looks like that the commit description hardly matches what you changed
> > > here. You changed the return type of handler remove() of struct
> > > anybuss_client_driver. Are the latter and bus_type tied in some
> > > fashion?
> > 
> > Oh, vio_driver leaked from my copy-and-paste template.
> > 
> > > Why using :: notation?
> > 
> > If you have a better suggestion I'm all ears.
> 
> maybe a simple dot? '::' reminds c++ or rust, this patch fixes c code.
> But I don't think it is a real issue, I was just wondering why you choose
> '::'

In Smatch I use:

	(struct vio_driver)->remove

But in emails I normally put a () on the end of function names.

regards,
dan carpenter

