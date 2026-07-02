Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F408390613
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975994; cv=none; b=tGAqkjQj5FQr/SHhjL4OGMe66EqzXoyPeqnNyfWm/nl2XgviI1aO4iv1JBDAQbItFBtgje4vuMZcGDJ5t/wq+jt/BFai52o0fX9WWYDhQJEzeB1EdEVhZh5hHNHHdne1Wram5RotV0IBbN1u+LFzDXl8iaM37wB2on39LqMLhKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975994; c=relaxed/simple;
	bh=J8QF5GZtqE/ph2NHXPmRBoLb0O2q33/CPKZYFN1N4lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLuvHTRtMbPiUy+GAvDBkrsqbpp2EmRTEXZHXsk+ICEQjruDSDu/Y75+JcIPVz0FmHndwUefSrOVP1Yn87APPOHXow0RLPZIDHKCYrmlkPupaNIbvY4O8ywJGunFM+kxXXyldopUJFrXQT/3ZGWvvdhcWPARg9wZVWwX9n3sBrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJkOPOjT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJkOPOjT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c9b125d64cso8202005ad.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782975991; x=1783580791; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmGg1JfoiLQ9lBW/GE5uazgfEJl7D9E+kc1+/G3YwN4=;
        b=eJkOPOjTHEr+NxO31XvGDIy7vXzYg8Ppsk6i0TqqxRIvcbxXJHFl5o+0N8pCGOWnst
         WLFA0c4aGclpiz0UnZ5I22wYreZEX6sWgT857vNUN3tAZu2LHM99kKn3adjChM2aJjWT
         wr+KqtohkL5bB21lRCa8QB83bED6eN2Tfpde2+2I7rAc9HHhlb67dL5x/xyOoVvlb7vX
         I7afbwJNi8jkpDqTpL0Kek1IG6a5JWfesoW8ijOU9wEyNnb91Nnwhb8zBmkMwETmFSGN
         7RhlDo8xMhFxIco5ZxBkCaykFzZpirIc6fLmeUAQ5czgsyZ9RS2p0d+iMvCTmnNjyn3L
         UZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975991; x=1783580791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmGg1JfoiLQ9lBW/GE5uazgfEJl7D9E+kc1+/G3YwN4=;
        b=cAo6dTfrs21g+RnXpSbPVZRVY5a1dcVJZ4t2lgda3pAnpEHscZGsjPatUv7oTUpEqa
         TQDK/HdIhZVdoc+KAQYAA8g9m/x02sNcKc+r/cjUkema1efSMz/sNoDw9HwiNWLoSgYL
         MMUTAhdrauftv5zYucxOJLimXAtWJzRYzfrmT3walZhnQcWz/Ny3hjXEJaKhMKNvZmcu
         VZ/vMLQCQnxaY5Iyn66pLmsk310JDsCfOST535zWUWwL9a0lZITafKD/T3RQrf6sBMpj
         gHInHuleLV76qBPrlEldZawE/9CMAvv8Euim9CFZfr779UbTa41/5ybg4XLaGzKTnNoG
         LohA==
X-Forwarded-Encrypted: i=1; AHgh+RpM13E/QRwo8ypnG9Xf5HofsufSP2L25Pwtztocx4456nTNfhEgG8FrcQVRvF0Nr2hk1ruPfsfckTiq/c7/@lists.linux.dev
X-Gm-Message-State: AOJu0YwAGvumcqd/4WkV5pg6HP/RVzMu+ZCs87SRsEqbqZYZOIaLw6j2
	e9/1OC1v0uQ9bhogz0upIdmkfFL9qKwZ6THFwM21+BTSdn6BMIK9Vffo
X-Gm-Gg: AfdE7ckcr34w+zgrWgfzMbDR97YtLbOInTwkTatn1iVGwAtI94dU9fCZcGT5nIMvouu
	YzK/ETY1OylOfrXYyr1Y6AvY6VGyHFTHEZrUKVkBe9nbvoWQx0M85k1JueQ9+Ndn5ySSjRMzcId
	pjQa5dL6sy+H8pf3h5lT00yofHHAt6GGLrKwVle7Vp/UTTkqlFl1OrEr+kPhrsmym1Jfu2zcF8U
	1F/Dqrlo4RP3EpHizM6r42r06uRWQqp+3FiZeQ+om+Qv+Q2XiV2PQhRanoYMcNtsXpl785wXJrd
	i9UODpJku+2Nc5L6LUjcny5f6WuyDUoLhbcOQ/iLEgNqPyiY332q2zN5DAcAVQBlfzvBokoJ3BF
	2xWBPHXCZKekUmSUQg8yYuShLfOK8rr7FlenwGRCHwOc9rykeCf1Tj1Z7EeW94d2jegpgl3hOCN
	p88MqNtNbt1dhEcbJojUInqu3/zrN0Ut272WWVmYobGqqGeb+YTjtXt7MzNHJP731WtBT1otg8F
	+o/rt+KaFQ=
X-Received: by 2002:a17:902:a5c9:b0:2ca:281:27fd with SMTP id d9443c01a7336-2ca911d8ba9mr29383395ad.25.1782975991159;
        Thu, 02 Jul 2026 00:06:31 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9124f2sm8865035ad.33.2026.07.02.00.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:06:30 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Thu, 02 Jul 2026 12:36:16 +0530
Subject: [PATCH v2 3/4] staging: octeon: Propagate tx initialization
 failures
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-staging-driver-octeon-panic-v2-3-2c2b6ae086dd@gmail.com>
References: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
In-Reply-To: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Klara Modin <klarasmodin@gmail.com>, 
 Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2835;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=J8QF5GZtqE/ph2NHXPmRBoLb0O2q33/CPKZYFN1N4lY=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqRg3pGnMmuzkKhqHgHzTVQ6DTnVV9ZijUs9TqQ
 QK7yCwdq52JAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakYN6QAKCRBsPpGo1/A4
 bT0QD/99BTKHZfLHuYEP6LEavC1rQ1Epq66q3QW4zrwl2Mm1nIV/Qf95f3+ll0tXRWjby1MqBvF
 Gal8BjkOWFhIWqXli3HHmaHfu/pLjMJHJgF+ubr/2/sCaoQQfv3UTtTM/KdJAB+MGH2S1Z2nFqO
 jnBESP9g2FwQBev65sjemV0yR1iTTrb2I3sPbRCvzCDF/9nTbUckN3SvID3DrDAfItJ/cxlhxU7
 V2uCmUQsjlmtVi3ZYjFZIq4aWvl0NWgI5NSn6iAEE45l8i/3lyG5sy9loS/UdTNU7X+nXePjsN1
 WUO4XV0aES0+9gi1lX6blfhzwlNdvc+G6j/ixttjdfY55aS/cBcuoUxf7cf4CGzLsCwaLcVPEw+
 +0KyooIBYqFSVZEzMYltiyINDX9j3QsXzmvs0tl4w4G4eUOONOIWb76Vx5hGWaBJGKw+0rpiaXt
 xTwTasYdPybbeiq7z0KzNiHXIrLmnCjmEB7g9TBQrlgqqLWdcijwOsIl2572O/DaQXpx41ILRDe
 X0KUMG080mRHgpu203j/CgXVRhn8uWEBFcIMf3nVm//m9GoZg5+djCyOaSl9QzgkdNYI2ryDBCZ
 tWPulj7H/u2oR6g9239YupRucuulrxddDFWX1n9K12fmhlYFSyjNptxHxam0NRai74Cg6I49mLE
 4j83FVaThDGtwHQ==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Instead of calling panic(), log and propagate the error upwards for
better error handling.

Pass platform_device to tx initializer to match the rx
initializer interface and to log device specific failures.

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 17 +++++++++--------
 drivers/staging/octeon/ethernet-tx.h |  2 +-
 drivers/staging/octeon/ethernet.c    |  2 +-
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 14d10659bce71..0f3b1f34ff2a3 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2003-2010 Cavium Networks
  */
 
+#include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
@@ -649,19 +650,19 @@ static irqreturn_t cvm_oct_tx_cleanup_watchdog(int cpl, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-void cvm_oct_tx_initialize(void)
+int cvm_oct_tx_initialize(struct platform_device *pdev)
 {
-	int i;
+	int ret;
 
 	/* Disable the interrupt.  */
 	cvmx_write_csr(CVMX_CIU_TIMX(1), 0);
 	/* Register an IRQ handler to receive CIU_TIMX(1) interrupts */
-	i = request_irq(OCTEON_IRQ_TIMER1,
-			cvm_oct_tx_cleanup_watchdog, 0,
-			"Ethernet", cvm_oct_device);
-
-	if (i)
-		panic("Could not acquire Ethernet IRQ %d\n", OCTEON_IRQ_TIMER1);
+	ret = request_irq(OCTEON_IRQ_TIMER1, cvm_oct_tx_cleanup_watchdog, 0,
+			  "Ethernet", cvm_oct_device);
+	if (ret)
+		dev_warn(&pdev->dev, "Could not acquire Ethernet IRQ %d\n",
+			 OCTEON_IRQ_TIMER1);
+	return ret;
 }
 
 void cvm_oct_tx_shutdown(void)
diff --git a/drivers/staging/octeon/ethernet-tx.h b/drivers/staging/octeon/ethernet-tx.h
index 6c524668f65a5..b03d56b0d2b65 100644
--- a/drivers/staging/octeon/ethernet-tx.h
+++ b/drivers/staging/octeon/ethernet-tx.h
@@ -9,6 +9,6 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev);
 netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev);
 int cvm_oct_transmit_qos(struct net_device *dev, void *work_queue_entry,
 			 int do_free, int qos);
-void cvm_oct_tx_initialize(void);
+int cvm_oct_tx_initialize(struct platform_device *pdev);
 void cvm_oct_tx_shutdown(void);
 void cvm_oct_tx_shutdown_dev(struct net_device *dev);
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 21f3e27aabf2c..56ea848187531 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -934,7 +934,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 		}
 	}
 
-	cvm_oct_tx_initialize();
+	cvm_oct_tx_initialize(pdev);
 	cvm_oct_rx_initialize(pdev);
 
 	/*

-- 
2.54.0

