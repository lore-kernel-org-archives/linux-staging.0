Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6437227EA4
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630115; cv=none; b=YGXDtO+gsIhyq9thwhw4oJErPZl/z4sTw0uR08mUsg8Lovkk+bseBWn00CgeFfAjIG81n3i9A4T81nFbJ1DJEkRjugbchRkX91L94ncpn9GDsYR6Gamt52drqjsWYjLogHpW2QZhRU17GALXhOmKPjm+dENXR5gDWs8gOLz9pWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630115; c=relaxed/simple;
	bh=DjggdyXK959MunKXj8FM3JKYvE8exBCUc2C/yiipFe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGDLwOyzRpyA0CUQxC1yIlTUo3oHdizHA4k2SWbszGnDlODMaAx10T1a8DaPky5XodSA7vtbNRVQ65YBM0y4WgfrBZEpun+KmTjW1/kGuxxQlKcaEhV3m4ZlBwyJgvWD/9AikCW9dDWjfk5FZ2/BKDntPjPog61040FEPWL5xjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZBWpWbX; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZBWpWbX"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30b9e755555so3407194eec.1
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630113; x=1783234913; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HoOZ9Ddd+5AUTtagS5rGOrM77bWuEv24KCd/5ZNyv4=;
        b=pZBWpWbXd51Jlfl1IFAuj4FQuius9EXm9HfuOJwkaYt8FjmUhEkPKj1QLEUD8nOYDa
         vn7OKdPRAATYHgu6JCuNgM6SWUsnBQZ39Z/JNA/jKaO0gn74QMGuUad6wXSW0RtPAIjm
         TthXckmQ+SnthUbPkt8oHBicwiP+YwllhPHhPIigYdGMvQablw1TdqNEKdFyFSmB3l8l
         u9buEj1R9QCrvmWQFQJmjeRtJ9rQu4Mz36jRYqKNJ4R+cpkSKszJFcZAbMdgslGrSyg+
         oiD/MAGu2zPU2So8tknlNFTgSo7QquB0AY0K+eYx525mNPoIvzHUm+kiQI8YIcuprztQ
         vsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630113; x=1783234913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4HoOZ9Ddd+5AUTtagS5rGOrM77bWuEv24KCd/5ZNyv4=;
        b=SmLTXKel5MplZlBRRvx2BqTXQ5nQ5UondEB5XbW5hM0xapwdHJEKwmHTJDrcVpJTLz
         XjhwsstSbiyry6faWVd7oaRQQ1eeHRIFcLM9QzUb3f0PYrWlnUhksRgsyB7+bN9Ld41H
         5So2qXLvIveIhkqduH1ROE6pdCEeGzbuBBEKS3nHncGr9KlC41ttMPkg86s1SgxLXZm9
         w3UUGGV0QblN7EcheBlkx0nJCKv8CfYAwBTxfm1et6t51mOKiogQXt1ddQhjclFbXSC5
         f+uQwVmQV05QPrazlvhDc4ZCIC9dpgWvpjDQM2CAHv+FSNERsmoTil00aYcZL6T/dUlV
         Idxg==
X-Forwarded-Encrypted: i=1; AHgh+RpsPcon1vwHovTRTiZXnyI/55+aiE1wFPQUpAGGzMUgJtvAZ99HqLrzqVZl0XUrXJmFP71tRX3FfTjl721L@lists.linux.dev
X-Gm-Message-State: AOJu0YyvO+u5ZKvrUHSH2BsmYkzNlK1d8D8gPEEdkxbe18TM67jXfUhg
	6A5S2uvFGUMlWuoENSWuItXcdmIgudnMGYRWpdrlykVYyesIjR4Sh/ll60IJsTBA
X-Gm-Gg: AfdE7cm51265w4xgXUEknDMkedoUdM7FBWxg+gL+tRZSArXV3kssufS3md0pA81KKLk
	YbRpbT5bjdaF6bthtv0pHiEQ4oPZY1QPpJCyoOuyGX1Pgm4jJkHuX6GG8R7w89EJdOBlui+RXzo
	rvsBwYmpnG4fAPZn+/qZS37mBXyJhW8X71SVfH4zMyxE9XpvDFmXk0RSwQ14qgFE0383WO+RkhQ
	hDVXo1P+WGxkfCL87hXNTnstVi6+PmQ1DPku9pxCAdRDXWNcue/5m4ktqUsA1XbuW8//f1+4HMN
	yg0WcY5bA+yF33njGMs1BoSZ8/YW6XCQmGayywi5HiQ2gN4jSaWXuU7fHxbTgpOWRC0pfPSlbW4
	//5dYWYKyJrcdg3NfiSSuyxlVEXaSfH/vM4La4a/tBP6Hjwp+BCD9TStO5FW9EqxtH6jZxHxYzw
	+xAlGrX2F5mKuPo3muU9iE/rnlzwgqpwrPgEIrgR/k303T3BJZ+Ke0AoQvKvpgdk1UDAob254RJ
	4xev/L4b/LdpsZz2AVcEw==
X-Received: by 2002:a05:7300:3208:b0:30c:536e:3a8e with SMTP id 5a478bee46e88-30c84b94fe8mr12435263eec.7.1782630112817;
        Sun, 28 Jun 2026 00:01:52 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm39878489eec.16.2026.06.28.00.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 00:01:52 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Sun, 28 Jun 2026 12:31:26 +0530
Subject: [PATCH 3/4] staging: octeon: Propagate tx initialization failures
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-staging-driver-octeon-panic-v1-3-fe8c34989254@gmail.com>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2835;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=DjggdyXK959MunKXj8FM3JKYvE8exBCUc2C/yiipFe4=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqQMbUahETqL0NErz4rs1duMuDH24mll/otknCH
 Fc/OWa5bpmJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakDG1AAKCRBsPpGo1/A4
 bVabD/9cqoiXDY7mihpCnw2a34/w8vFRPZPcva2ZIoL04udP7KYmIFM+bSYaGWWXa/CGPEV+vtf
 lMegDBx8hsGAUtUVeBdj2k1sotj+ddMJWsrJK8P6z5hn7JrtzNhdq0/E4wnthwAxdzcNfRKl7yM
 ofn0HQJqz+nJdmhYPunUNe6rDehsdV2kC5ns5wNpRbtLsghzRABCI7sJTo9X3jXWvybbBRQ8osb
 /sxmvgB2/eOqpdTIY2/E9dF2usHwcMsL9ROaKHGgAx04/cGzrHIG8ACPle1r4pitQPG2vaGuJtT
 s14OwcQ54XN1eo/dMxFKKWS+pLc3kWLfGr39bspFrvErU29PTi2bivVzyKUT7PuTs1oL4ee7JbG
 Ci4hVbO/ho2HcGSYC+XnzomnqBWdhXv8coeEv1tzCY/ViV8RQzH9DX1foqXYhRX6onNwTP0237y
 RHEs6xt20FRI+2TaxoeRT0F/721J7HTFlDaTcz1//7QB5YOefBvEQGDQlqJ2K4DiLFkjx3k7UZM
 f5CMk+2E+uYxEgWLDPpRAfXfeZHU9tTu1jr+T6T57ZdKT82jjjtrrKMmlbRUpdXYbgxKuHNf1qe
 DJYTQWyYdOp5NGoCxWxREm1819Hs+wdy2berbQ370s389sLI4gWffbqHUX6ct86vP5NRytDaZdN
 X8mevIg9NI7U7VQ==
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
index e07c6911b8252..1d3bf3c79598d 100644
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

