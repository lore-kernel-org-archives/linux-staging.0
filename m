Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117F2F23
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 03:27:20 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1644377232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9YwsFwtEcmjTi9CsSJ4k8hjx9mqr5i/yrmHmuczKgmU=;
	b=tuX5hphIy3FFGOukx8I0voHwS0fJuzeS+KDfFy4dcjEEPXfnhgmhX5UKeSqRhtf8Zlz8RE
	WMTOdh8fAfRxWvrc+Df5TiNNZvZx1mb2ea5gKpsjq08QlJz8Gr8MVzcIJCg1VpVSPz9eie
	GsdzzPBSDZjljXxTQfsrDqDqDm354SY=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: net: Make use of the helper macro LIST_HEAD()
Date: Wed,  9 Feb 2022 11:26:43 +0800
Message-Id: <20220209032645.38305-1-cai.huoqing@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

Replace "struct list_head head = LIST_HEAD_INIT(head)" with
"LIST_HEAD(head)" to simplify the code.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/staging/most/net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index 47039f0d262f..1d1fe8bff7ee 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -67,7 +67,7 @@ struct net_dev_context {
 	struct list_head list;
 };
 
-static struct list_head net_devices = LIST_HEAD_INIT(net_devices);
+static LIST_HEAD(net_devices);
 static DEFINE_MUTEX(probe_disc_mt); /* ch->linked = true, most_nd_open */
 static DEFINE_SPINLOCK(list_lock); /* list_head, ch->linked = false, dev_hold */
 static struct most_component comp;
-- 
2.25.1

