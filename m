Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7E71
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 08:29:27 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1448OKnZ175146;
	Tue, 4 May 2021 08:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Om9/0fbuqykrvDUbMFpY+lQYw2UVDPFslAI6RoUMyqs=;
 b=mWFna7K/5scSfSXy1Y7iPtqNlLm5XhUTWxot0ff+Eu6O/P8T73gRQVuP41HCrA2CWjF6
 50VxPiXtZN06jBKeGaj0XgUwwrPUC+GZxg0ggXcQ5GRDVVK8A5TKIcUH7xZq5FSYWXIU
 jjErz60CYRrLMs5TvnacUp0TppUEF5pdX1iX8uZDvzzjNhTpHpExcVPSdNS+Yp53vp3I
 YmLUCOrHnC/SMo+TafEE72SXnH2AkztaFDbqRTZ2C6KVQAlw0xnOtqi9KN/KvVoiOvao
 6Ob7QgjVU3EwEjfEwqRBmP3Mkn1fxRdNqtJ1K/e1/J9l+w6Y6EW2MFAt9SmKxIPCfODw +A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 389h13vwk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 08:29:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1448PCbY086658;
	Tue, 4 May 2021 08:29:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3030.oracle.com with ESMTP id 388v3w0fxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 08:29:23 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1448TMi4103646;
	Tue, 4 May 2021 08:29:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 388v3w0fwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 08:29:22 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1448TLwK014659;
	Tue, 4 May 2021 08:29:21 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 04 May 2021 08:29:21 +0000
Date: Tue, 4 May 2021 11:29:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jordan Vaughn <jordanvaughn1@gmail.com>
Cc: gregkh@linuxfoundation.org, ganesanr@broadcom.com,
        linux-staging@lists.linux.dev, Jordan Vaughn <jordvaughn1@gmail.com>,
        jchandra@broadcom.com
Subject: Re: [PATCH] netlogic: This patch formats existing comments to Linux
 standards found in TODO.
Message-ID: <20210504082914.GU1981@kadam>
References: <20210503170353.66415-1-jordvaughn1@gmail.com>
 <20210504081758.GT1981@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504081758.GT1981@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: g4dcFseX92rGuhRDsk-FFl5CxiYI_LAt
X-Proofpoint-GUID: g4dcFseX92rGuhRDsk-FFl5CxiYI_LAt
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9973 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040061

On Tue, May 04, 2021 at 11:17:58AM +0300, Dan Carpenter wrote:
> The subject doesn't make sense.

That subject does make sense, it's just that my email client wrapped it
so that I didn't see the last few words.  It needs to be shorter.

regards,
dan carpenter

