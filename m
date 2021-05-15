Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423962FB8
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:25 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MtfeD-1lUiQx3QZ5-00vAZd; Sat, 15 May 2021 21:11:20 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 10/20] staging: vchiq_arm: Prefer kzalloc(sizeof(*waiter)...)
Date: Sat, 15 May 2021 21:10:49 +0200
Message-Id: <1621105859-30215-11-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:ihkTda7q9bqitmA2BhQmmvOel4iub6NzJqWeQ59seePhpFjEJ4k
 LJkFkv7zB5oSbu25eHwZgmkbDPAkTb+KZeZ9IVQ/ra9Lh8aJAcfIiJoJafexKW9OHFRE9hj
 UepngHskFuNkPZ7ax4DnSOmbonv9nVqJLvWf6Yuij2jCeLDI0zMtaeWARf67y04CMOEx/D0
 tstwwWrrfYYphOwer2akA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7yFikt67VgE=:8uaRw7bHRBxRXELSRdCbQP
 c8jfCuajZzGbTTNkGCpKhyQ+O+8XSN2sU7N5N4YTWUPLBb/WmqsAdCqwN68OXeT1zadx8wMGk
 hk6HMtKV9Q1zezkrVh3ZanwKV8nZrCDFvs4T9LM1IGV0zid4fbK4p53d6ChNvUJIB0cnaTmCA
 pK/MvsmwgSPpNM9LQCsaLW1zLYbNw2ugmzmt1B4X1oOFS4+c5nWfxpTB+qKpBnCOaDp+5aqxE
 maaQhas8j2x1QDgXpnBy/hw0DYOIvwJT2Fd9y2JmQHfRzKVYs7o0xaQmDXSPjhvnT6othxcw2
 Fer1X028Mw8WoMWYeJJ73VZsQCvwYPzhHicSCewyXll+v2Zems0Dw8/mvNIWxlIu0mBhWlFFb
 Ah3LupLD5/qj+pPDX52Q6nLCQZMFG63U8W5Rp4U7AsOM5NddtogVpmfeEWsEOzS1MHaW532Zi
 ddFMTlF28Ex5EtoJW5tVcFICl4pK183lhxame1YAgKC/+m0tW17UXez9AZ72Og4KbMDHuVBxv
 S1cG6JZioGf28R7fkd3aes=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

It's shorter and easier to maintain. This has been found with checkpatch.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index b70db46..92825b7 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -459,7 +459,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
 			}
 		}
 	} else {
-		waiter = kzalloc(sizeof(struct bulk_waiter_node), GFP_KERNEL);
+		waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
 		if (!waiter) {
 			vchiq_log_error(vchiq_core_log_level,
 				"%s - out of memory", __func__);
@@ -962,8 +962,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		return -EINVAL;
 
 	if (args->mode == VCHIQ_BULK_MODE_BLOCKING) {
-		waiter = kzalloc(sizeof(struct bulk_waiter_node),
-			GFP_KERNEL);
+		waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
 		if (!waiter) {
 			ret = -ENOMEM;
 			goto out;
-- 
2.7.4

