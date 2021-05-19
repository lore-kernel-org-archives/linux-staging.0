Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37572
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 14:17:03 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JEAuqv032331;
	Wed, 19 May 2021 14:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=ttNoL6vgSqzxpKKnbEpf/kAYwaiUjRWRovcI3xZDGdE=;
 b=0GdMpxmsosE0EL3MAhz7ajiIk6idjGHJUCgE4mKUSGgcUy9blt2nYhGfEBuSBvEMx8/g
 i9hHiUW6KUxbvn4YfuYE+WB+Gr5Vzy+3lclh3RX/Jwp+q8APzZyyksPYjxM3xSmKMs8d
 zwuaFddWJQG4cLsjr7+4SXl1Sz+0wgnY7FiWOn4JYZw8HbJFXhpd6rWBCCjm70w8oI3/
 jsWib6SNVGJjSce9YALqWa/xzqugGdPP6gyQJJxVDoxMJgkv5Mgj79E7m1Gmh4GP3zpv
 4G7R6ONYB4KYLJOCNqHLMS8elG3Zln3sWpKn9Ug+bte1RCc/lBKCR3jUW8lE3/sRBeUd qw== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 38kh0h95sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 May 2021 14:17:01 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14JEBnqs181104;
	Wed, 19 May 2021 14:17:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 38meeg5mx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 May 2021 14:17:01 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14JEGm2q000820;
	Wed, 19 May 2021 14:17:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 38meeg5mwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 May 2021 14:17:00 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14JEGwpG030507;
	Wed, 19 May 2021 14:16:58 GMT
Received: from mwanda (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 19 May 2021 07:16:57 -0700
Date: Wed, 19 May 2021 17:16:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Somya Anand <somyaanand214@gmail.com>
Cc: Alex Dewar <alex.dewar90@gmail.com>, Sean Behan <codebam@riseup.net>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: emxx_udc: fix loop in _nbu2ss_nuke()
Message-ID: <YKUd0sDyjm/lkJfJ@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518082855.GB32682@kadam>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: l8gXSyTnNlChFqyjx9ZduCya7AJHYhzx
X-Proofpoint-ORIG-GUID: l8gXSyTnNlChFqyjx9ZduCya7AJHYhzx

The _nbu2ss_ep_done() function calls:

	list_del_init(&req->queue);

which means that the loop will never exit.

Fixes: ca3d253eb967 ("Staging: emxx_udc: Iterate list using list_for_each_entry")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index 741147a4f0fe..ecc5c9da9027 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2064,7 +2064,7 @@ static int _nbu2ss_nuke(struct nbu2ss_udc *udc,
 			struct nbu2ss_ep *ep,
 			int status)
 {
-	struct nbu2ss_req *req;
+	struct nbu2ss_req *req, *n;
 
 	/* Endpoint Disable */
 	_nbu2ss_epn_exit(udc, ep);
@@ -2076,7 +2076,7 @@ static int _nbu2ss_nuke(struct nbu2ss_udc *udc,
 		return 0;
 
 	/* called with irqs blocked */
-	list_for_each_entry(req, &ep->queue, queue) {
+	list_for_each_entry_safe(req, n, &ep->queue, queue) {
 		_nbu2ss_ep_done(ep, req, status);
 	}
 
-- 
2.30.2

