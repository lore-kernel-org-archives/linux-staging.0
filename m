Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DEC71
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 07:37:01 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14I7YviO084173;
	Tue, 18 May 2021 07:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=P7UNyVX3lEYGDvRj26wDjGBnFQbol5olDunt59+jR4c=;
 b=v+xWc2ISl8pohcc3yqzkLmCFN94rumbehVVT9EbqHR7tSrHFog4a7RFlYTpS7PfsSNYo
 DvZ8WwSd8RF8r5z7OA3J85pzJ4JJybNkgyHEnJ7KerUK5nqeVnxIKQJOkL/Re95rUzrn
 457pfqvc8NMWWeLb19fnGfK1189kRhZSmm7rC75rtzRoD1LuPPCsB4Qepfl/6xk1vAGK
 uvb6ebce/jtq8Ja+ATr5ZQxp4K4vp55xDIC6TM/0sR40WKrZYc49sh+suOFZhJtEcP9y
 df+ByKEbw+vHTd6X0RdFYVIT0p3E2qj8Ozmg9wlzS4oqbYGq4fowSHEqfCXjLhlgmOlZ mQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 38j5qr5d21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 May 2021 07:36:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14I7aF5Y028642;
	Tue, 18 May 2021 07:36:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 38j4bbtwvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 May 2021 07:36:54 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14I7asih029105;
	Tue, 18 May 2021 07:36:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 38j4bbtwv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 May 2021 07:36:54 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14I7anbZ011686;
	Tue, 18 May 2021 07:36:49 GMT
Received: from kadam (/62.8.83.26)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 18 May 2021 07:36:48 +0000
Date: Tue, 18 May 2021 10:36:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 18/20] staging: vchiq_core: introduce parse_message
Message-ID: <20210518073642.GL1955@kadam>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
 <1621105859-30215-19-git-send-email-stefan.wahren@i2se.com>
 <20210517114948.GH1955@kadam>
 <f1c03356-56b2-729d-e80f-84ec4056f773@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1c03356-56b2-729d-e80f-84ec4056f773@i2se.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: beqp7Pz3fm1vCC_nWYBnUTyFPx8BtO3n
X-Proofpoint-ORIG-GUID: beqp7Pz3fm1vCC_nWYBnUTyFPx8BtO3n
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9987 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180053

On Mon, May 17, 2021 at 07:38:19PM +0200, Stefan Wahren wrote:
> Hi Dan,
> 
> Am 17.05.21 um 13:49 schrieb Dan Carpenter:
> > On Sat, May 15, 2021 at 09:10:57PM +0200, Stefan Wahren wrote:
> >> +bail_not_ready:
> >> +	if (service)
> >> +		unlock_service(service);
> > Not related to this patch, but the unlock_service() function doesn't
> > having anything to do with locking so it's confusing.
> 
> Any preference about the naming of the both functions (lock_service /
> unlock_service)? At the end they are just wrapper around kref_get /
> kref_put.

It should be get/put or hold/release.

> 
> >
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +/* Called by the slot handler thread */
> >> +static void
> >> +parse_rx_slots(struct vchiq_state *state)
> >> +{
> >> +	struct vchiq_shared_state *remote = state->remote;
> >> +	int tx_pos;
> >> +
> >> +	DEBUG_INITIALISE(state->local)
> >> +
> >> +	tx_pos = remote->tx_pos;
> >> +
> >> +	while (state->rx_pos != tx_pos) {
> >> +		struct vchiq_header *header;
> >> +		int size;
> >> +
> >> +		DEBUG_TRACE(PARSE_LINE);
> >> +		if (!state->rx_data) {
> >> +			int rx_index;
> >> +
> >> +			WARN_ON(!((state->rx_pos & VCHIQ_SLOT_MASK) == 0));
> > Also not related but this WARN_ON() has a confusing double negative.  In
> > future patches someone could change this to:
> >
> > 			WARN_ON(state->rx_pos & VCHIQ_SLOT_MASK);
> 
> I could add this to V2 of this series.
> 

Nah, don't worry about it.  You copied that WARN_ON() from the original
code so don't change it except in a different patch.

regards,
dan carpenter


