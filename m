Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D922FB0
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 11:50:02 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14HBdKR0105979;
	Mon, 17 May 2021 11:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=E5lCg3XG471zC0y0M7fjrh/mmpOlhYjZlb08AU1QMu0=;
 b=ZRpQ/D/aLBj6VqKqHbMa2f5fWLkKlpUSs9LV4nXDpagiuz8639aMgDyM/I3VcnjbdnKN
 NgdYPKU+5hQEwjDKh6vNY9GHKEQmELGZNCbNRq7cwcslExzlvn0J1eso+JLKhbcpa2+d
 VPWZVQyM6S2NipP5N69PJeBnh+RP88U9KtdL2A31gfW96ZON3SwOigrVmKDmyhkk1UST
 y2dbMyD11gdMiKL0peUaPDMgKeT0Muc2yli0HzP7HOr3QK39sSK78nyDZTH6Uf5ecIO2
 7QTWm9g3dEFO4FBT9xwEHJjWwbBuYm1qChil3VVZb6U15m0Zj2meiI1/eXWqmozFffY0 aw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 38j6xnavvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 May 2021 11:49:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14HBdx5m086084;
	Mon, 17 May 2021 11:49:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3030.oracle.com with ESMTP id 38j3dt8vgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 May 2021 11:49:56 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14HBnuNB105999;
	Mon, 17 May 2021 11:49:56 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3030.oracle.com with ESMTP id 38j3dt8vfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 May 2021 11:49:56 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14HBntBW026621;
	Mon, 17 May 2021 11:49:55 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 17 May 2021 04:49:54 -0700
Date: Mon, 17 May 2021 14:49:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 18/20] staging: vchiq_core: introduce parse_message
Message-ID: <20210517114948.GH1955@kadam>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
 <1621105859-30215-19-git-send-email-stefan.wahren@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621105859-30215-19-git-send-email-stefan.wahren@i2se.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: lOEQrC8Ld4M1K7mIUbBea2wZb3vLxqCj
X-Proofpoint-ORIG-GUID: lOEQrC8Ld4M1K7mIUbBea2wZb3vLxqCj
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9986 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170084

On Sat, May 15, 2021 at 09:10:57PM +0200, Stefan Wahren wrote:
> +bail_not_ready:
> +	if (service)
> +		unlock_service(service);

Not related to this patch, but the unlock_service() function doesn't
having anything to do with locking so it's confusing.

> +
> +	return ret;
> +}
> +
> +/* Called by the slot handler thread */
> +static void
> +parse_rx_slots(struct vchiq_state *state)
> +{
> +	struct vchiq_shared_state *remote = state->remote;
> +	int tx_pos;
> +
> +	DEBUG_INITIALISE(state->local)
> +
> +	tx_pos = remote->tx_pos;
> +
> +	while (state->rx_pos != tx_pos) {
> +		struct vchiq_header *header;
> +		int size;
> +
> +		DEBUG_TRACE(PARSE_LINE);
> +		if (!state->rx_data) {
> +			int rx_index;
> +
> +			WARN_ON(!((state->rx_pos & VCHIQ_SLOT_MASK) == 0));

Also not related but this WARN_ON() has a confusing double negative.  In
future patches someone could change this to:

			WARN_ON(state->rx_pos & VCHIQ_SLOT_MASK);

Back in the day, I sort of hired someone to create a TODO website so
that if you're reviewing comments you could put a note:

TODO: staging: vchiq_core: tidy up naming

Then the website would make a list of all the TODOs for that driver.
But then I never went live with the website and we introduces
lore.kernel.org and it's almost searchable so hopefully some day it will
be able to do searches like this...

regards,
dan carpenter

