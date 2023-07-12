Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E9DDCC
	for <linux-staging@lists.linux.dev>; Wed, 12 Jul 2023 23:35:33 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id A967D1A34FE;
	Wed, 12 Jul 2023 19:35:32 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	BIJS2wJRKpfoY/HYZJ/ljaNe/xebfvh3PWRsDZ37tq8=; b=HqEecp+AJvcZVaed
	q5fz6C/Y3nNz2SQSdRbyT1xlZMxIbwR+whbqQs4QGGbnr6SB4KU8aBWnwGtOPJ01
	ZfAs4xd/v68DtYx+tEGd4Xr36WLycuK/NnKmYsmtOGqD67TZhrCkkwsX/oZhcnFB
	MejtORmfvHEPaM2Xx5pZln2MBWI=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id A20BF1A34FC;
	Wed, 12 Jul 2023 19:35:32 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=BIJS2wJRKpfoY/HYZJ/ljaNe/xebfvh3PWRsDZ37tq8=;
 b=NjtaQKjo1DFwLKzzk+2Xlq78C39aYOS5rqQKgxsJRGIZI2q1Q7UF3JBrItUfzKDRtP9eOSQubeYrwBgEnyDbPUkeCnA6YprpQbLZlMdL7PZWEDsHsPj7dUdgyUtuzFUCO/lY//mx2c5dYZlYGOGl/MM27Qj3PaEvradSkgtjjcs=
Received: from basil (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 34E131A34FB;
	Wed, 12 Jul 2023 19:35:31 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Wed, 12 Jul 2023 16:36:21 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	error27@gmail.com
Cc: tdavies@darkphysics.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] Staging: rtl8192e: Rename variable Time
Message-ID: <ZK849egP8LrqGPYW@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 CACA6B1E-210C-11EE-ABCF-307A8E0A682E-45285927!pb-smtp2.pobox.com

Rename variable Time to time, in order to Fix
checkpatch warning: Avoid CamelCase

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 43ee1bd4a6ed..f64534d14104 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -10,11 +10,11 @@
 #include "rtllib.h"
 #include "rtl819x_BA.h"
 
-static void activate_ba_entry(struct ba_record *pba, u16 Time)
+static void activate_ba_entry(struct ba_record *pba, u16 time)
 {
 	pba->b_valid = true;
-	if (Time != 0)
-		mod_timer(&pba->timer, jiffies + msecs_to_jiffies(Time));
+	if (time != 0)
+		mod_timer(&pba->timer, jiffies + msecs_to_jiffies(time));
 }
 
 static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *pba)
-- 
2.41.0

