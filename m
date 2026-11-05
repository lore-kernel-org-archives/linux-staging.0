Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867826;
	b=EzlEb+e89V3tCBhypnIK0oI2479zO8fFqzrsK/ltaQ/8fPiQHbtlxDZ4j7LjAptZbBBT
	 aV8ExEAdpkBSxRn8ICNWboi4e0a1npjz0e3Gq9Bnox1U3xL3oV0MdhwvQe/uiXQYI+heg
	 MoSkEoqksrndaaW96c0L638QeGbcBiCmALzVduHPZXS2iumd/uJLhWC4hcwnkiwxpI29q
	 /iKBE2tC6GtgDRhq1H9mBOJ/0WLaRUmYqm6Okh0viXnjef/O1URbg77py8FxvIgA5MhXl
	 RzO+ooyyBAxhAAmxKgmID+Umk/UKpcwy1eNg/wmINOkq5om6jXYPbN+c1EyhPOhQObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867826;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=W4Zk2FLpcNUrXr35foVG7Z4kYUlJ8eIkjf0ShH+qhDE=;
	b=Vc6q5R/MAji8B06tXj5M7iQKdFFdL2WTty/0jxLUdXDKqafltMTGzcVtxwAnrACE3B1u
	 8dncB5a5eH0t2ceBXf6hvPW6mPKgY+pPjorHFN0PLWFj1YTHLUJDU4xbPwV7Lv/7ZASQ3
	 Fdk6u0qLNFBe60+ZCyzy4csMsj3KJEjSh05Kt4lmPTkTmxmQYW0JGASdKW2U4Cr3Q96lS
	 m6yEELX45nFXAUvR43vEsluBYNf/BVM3Ii8QLWNefx4gF2hKXZX+qRiiRewewwX0ebiXD
	 Bd5gg4jTeRWE9MzSFZ6IIGhnK7ntMbizdcf7YkH77Bm4U+mgAKDq29r5q6c6PMDhmXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=YLgyPy4M;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DAD606A336
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 08:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8DAD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=YLgyPy4M
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 539a5dbea;
	Thu, 5 Nov 2026 16:36:54 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	prashantrahul23@gmail.com
Subject: [PATCH] staging: octeon: unwind receive initialization on IRQ failure
Date: Thu,  5 Nov 2026 16:36:28 +0800
Message-Id: <20261105083628.4043124-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1aada974103a2kunm1e8bc9a61940ec
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkweVhkZGh5MH0NLTUtCGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=YLgyPy4M+WG81hzOF6Ms4KdRyJ9eRna4bnhFrX6fJP2kTrcMHhqzmlFhoApbS/kpIJ11C2NI6954qntx4sqqpaddiMyEsx0zDCqF9cvTkrp26FCmmTQxY6DHcdUUobvLffr76LGIxIGMMaVLMGPuPiBbVxoY10P3NVtfhm9WUlk=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=W4Zk2FLpcNUrXr35foVG7Z4kYUlJ8eIkjf0ShH+qhDE=;
	h=date:mime-version:subject:message-id:from;

cvm_oct_rx_initialize() returns immediately when request_irq() fails.
The failing receive group has already had its NAPI instance added and
enabled, and earlier selected groups can still have registered IRQ
handlers and active NAPI instances.

When RX initialization fails, cvm_oct_probe() unwinds and returns an
error. The driver core then releases the managed platform data, even
though earlier RX IRQ actions still reference NAPI instances embedded
in that data.

Disable and delete NAPI for the failing group, then unwind the previously
initialized groups in reverse order. Mask their POW interrupts, disable
and delete their NAPI instances, and free their IRQs before returning the
original error.

Fixes: ae4350364008 ("staging: octeon: Propagate rx initialization failures")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
An AI coding assistant helped analyze the RX error path, draft the
unwind, and edit the changelog.

Cross-built drivers/staging/octeon/ with cavium_octeon_defconfig,
GCC 10.3.0, and W=1.
Not runtime-tested on Octeon hardware.
 drivers/staging/octeon/ethernet-rx.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 5be43bbf6a1d..a1b5ccdbb6b2 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -450,6 +450,7 @@ void cvm_oct_poll_controller(struct net_device *dev)
 int cvm_oct_rx_initialize(struct platform_device *pdev)
 {
 	int i;
+	int ret;
 	struct net_device *dev_for_napi = NULL;
 	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	struct oct_rx_group *rx_group = plat->rx_group;
@@ -467,8 +468,6 @@ int cvm_oct_rx_initialize(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(plat->rx_group); i++) {
-		int ret;
-
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
@@ -485,7 +484,9 @@ int cvm_oct_rx_initialize(struct platform_device *pdev)
 				  "Ethernet", &rx_group[i].napi);
 		if (ret) {
 			dev_err(&pdev->dev, "Could not acquire Ethernet IRQ %d\n", rx_group[i].irq);
-			return ret;
+			napi_disable(&rx_group[i].napi);
+			netif_napi_del(&rx_group[i].napi);
+			goto err_irq;
 		}
 
 		disable_irq_nosync(rx_group[i].irq);
@@ -524,6 +525,25 @@ int cvm_oct_rx_initialize(struct platform_device *pdev)
 	}
 	atomic_inc(&oct_rx_ready);
 	return 0;
+
+err_irq:
+	while (--i >= 0) {
+		if (!(pow_receive_groups & BIT(i)))
+			continue;
+
+		/* Disable POW interrupt */
+		if (OCTEON_IS_MODEL(OCTEON_CN68XX))
+			cvmx_write_csr(CVMX_SSO_WQ_INT_THRX(i), 0);
+		else
+			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
+
+		napi_disable(&rx_group[i].napi);
+		/* Wait for the poll callback before freeing its IRQ. */
+		netif_napi_del(&rx_group[i].napi);
+		free_irq(rx_group[i].irq, &rx_group[i].napi);
+	}
+
+	return ret;
 }
 
 void cvm_oct_rx_shutdown(struct platform_device *pdev)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

