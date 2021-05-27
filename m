Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E10E2FB4
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 19:22:19 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laumann.xyz; s=key1;
	t=1622143331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dE0h7OWclGhaloJhIe3yXB7vM0Hnz3RcKcpchme+u/o=;
	b=0CzYjIoK6/M5+JRJ5PmXmNJijUYw1SQATJodgX7LokShzBDhHPIcasqfvj/MLvGzdjoiKV
	W3xBZ8YGOGXfS2FYkZFzriInhS2iE3MqAv24s36SxYjHgvFE3P/INToxZHSf2dfYxC2JqI
	Zly+2TK0J4P0vdRSiKFDdvYF0TGK44isvkCOudJma+zu/mMCk1qUosoj/oLvc6O3D+qVqF
	7WhASTBTuvZS37h0joHscxG9a0v+Liwj9384qvbC9u1nCJc2uz9vrueMB+dzSJWsG2Kg3u
	0YU4vS0pQQgfQ1hXe+ick2X+oNzrylpLIJnvIQsEb1dZOXmoA5dsJCtBHZXHvw==
From: Thomas Bracht Laumann Jespersen <t@laumann.xyz>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bracht Laumann Jespersen <t@laumann.xyz>
Subject: [PATCH] staging: rtl8192u: Fix shadowed variable name
Date: Thu, 27 May 2021 21:21:49 +0200
Message-Id: <20210527192149.29686-1-t@laumann.xyz>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: t@laumann.xyz

Fixes the following sparse warning:

drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c:798:32: warning: symbol 'tcb_desc' shadows an earlier one
drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c:550:24: originally declared here

Signed-off-by: Thomas Bracht Laumann Jespersen <t@laumann.xyz>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
index 96e6aaf859ec..8602e3a6c837 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
@@ -795,7 +795,7 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
  success:
 //WB add to fill data tcb_desc here. only first fragment is considered, need to change, and you may remove to other place.
 	if (txb) {
-		struct cb_desc *tcb_desc = (struct cb_desc *)(txb->fragments[0]->cb + MAX_DEV_ADDR_SIZE);
+		tcb_desc = (struct cb_desc *)(txb->fragments[0]->cb + MAX_DEV_ADDR_SIZE);
 		tcb_desc->bTxEnableFwCalcDur = 1;
 		if (is_multicast_ether_addr(header.addr1))
 			tcb_desc->bMulticast = 1;
-- 
2.31.1

