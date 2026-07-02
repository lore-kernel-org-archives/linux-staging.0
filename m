Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC938E10F
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 07:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975990; cv=none; b=sGSZkbB8adHGR2cRFJZpSvbb/QlCzrvrvMn+6nFSPqi8Rmz+UVXuTufeIaCaErmRhaNxXOaD0bs1R7yhfoZirEcxj9tNf7l/+ensFv+TZbuZwEpnrsUobaDZrq122X42QoV0Eg3BKoewfjzSUJF92U5SZY3YSKIk5PD4jnsZqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975990; c=relaxed/simple;
	bh=S3WGUr8EbUDnzRnDQdiXuU7JQ5VvK/xEqOqJ6Y6XO6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAMnmZya+qlWIwF41u1hK87GyDRGKunl7SbicpqLX5NBgVn3Zj/TnGDSl9r2+3l2haKlFxgYnpzSEvUuxH7/zqJDIOovgwlEwxZdMWqxdNcBTcOwQ/eohZbgW+U2BgKb1mV/XrmOF/zMyy7pkKR8XYGEQsakpxaEuK1rGymZluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsP3GUgb; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsP3GUgb"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37de8008910so1095742a91.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 00:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782975988; x=1783580788; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXokKAA+ArLkoRHycPsFI7+9fMpYzVXji7Up+eouGtM=;
        b=TsP3GUgbDWrgbSe6wllMKLmxuGbcL4PP0EfmnfYu9IzJtmQBOQjgBQWaqmve2ZyXcG
         MQN0h/4lYDtC04g680pMaX6zhprgD4rXuZU06xjBhmpiiCnBaA+XkoeLZ2sWnxL8Wypr
         2hOdGaKSci5uKoz1y/D7dfYTd8x6vrvaJy6t82homRwN3rNsjMxS7mAPVmyFDv1JP1nT
         YFbEPs5pvXAraZa6J++U6whqziGFSX81x9m8df6yzuQ8/ur6pwDFlX3pauk8AszIYOR0
         5DPlv6Ciq27EcH9bvS207/si3/GOGdalP1Ls9XkyLE+PXMRw2RdPD7H3jloHierf8vNA
         oXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975988; x=1783580788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXokKAA+ArLkoRHycPsFI7+9fMpYzVXji7Up+eouGtM=;
        b=BOvPfwuimvUS9fu/wpZAmUMe/cASFVNUAzkD+0T10UMfGJyZLDl4edIc8hz3OVYxjQ
         TewpDC/8wBrKOmpxRtvPAy1L6rnvLHKAi81K5D29BZsKZJE0ZAXfKWkqB3CuL9gIfTJ/
         lWElL//407u1SpfIKVkAeO7Ldp9qnDKON6DBtijnN6Z6BnscMAtJV/Zq9QTBYB8ZSDPU
         X69hV3x+PruDp2jNevc1ULCx13nDoXhoD7NXSEKsVSSWi5BYGnAWAOQpLIdUf8yWlVp9
         cxcXgpa0Bvu84yGNCsVqdjP1nGAbgq/SJsPwTwB+nrhm3OmsaValZsHSr75eLHUoNiyH
         mtxg==
X-Forwarded-Encrypted: i=1; AHgh+RrYH+SZ5/nnjKiHtIhXr6UEJlwVv+UJvISb/umIEmzgQghKC63wFVOBDacEPG/lDuXRsX8Ist2HNtUeh1aI@lists.linux.dev
X-Gm-Message-State: AOJu0YyZX9EzEJRzwefjupJRHZ5gR4Pd3OP1w9CxmhKfozbJqYfyrELg
	kBtOy0s9wWQdma7MCpOnEfyMZy7NHB8OkXN16+tWL/kE5FcWYMaMYiI0
X-Gm-Gg: AfdE7cmMHVdHtpcWzMlzQPSuH37Fkl23qhm967w6XrMGXq2e1ZOiesjjqG18K2KEXuJ
	yh2pAqJ9A7SUdXX875pSqGd4DBtQrIp+fVgEIlVsDfq0YXcK4FKpVoPYtpmR1wP36sIeP3FPve7
	wQKl/lEQF5dzLxwh1L8ncsW6K4ixsglFvUK3Lx775Wd18sY2poaooF0IhldmxVtrYZnl/F2KnDA
	LZczid4uIfvBs7vsvgdWKQKGkkWenyUA9blY71jhj5H3oGOx93peBbLza8Wx2mM1F6U7yVoFT5N
	/2LNqxcBTlr3Ql2e8gszMoK2Ui0JZNHC2iXuHY/w5U1/10RhiyjYNwtvJamwifViQh0rYSeQUAo
	jwAlyfUfERMnQLHyjlthLnisuqYL9FKTEFVPx2yYFEi6JWA9CyREb1rsYZZrad6nGnxuuE7d6kb
	nBUzLWLVBjWYUaLqaGsjRdJw5rskV5fMt+/echdcUvfbweHPQT9GLQEbglckzf8juMayZWm42O4
	lik7sFk1S8=
X-Received: by 2002:a17:903:4b07:b0:2c9:97a7:3286 with SMTP id d9443c01a7336-2ca7e885535mr52880375ad.40.1782975987679;
        Thu, 02 Jul 2026 00:06:27 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9124f2sm8865035ad.33.2026.07.02.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:06:27 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Thu, 02 Jul 2026 12:36:15 +0530
Subject: [PATCH v2 2/4] staging: octeon: Propagate rx initialization
 failures
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-staging-driver-octeon-panic-v2-2-2c2b6ae086dd@gmail.com>
References: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
In-Reply-To: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Klara Modin <klarasmodin@gmail.com>, 
 Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=S3WGUr8EbUDnzRnDQdiXuU7JQ5VvK/xEqOqJ6Y6XO6c=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqRg3pKPU/Eb7ha/Pj0JtgokCQ0htEd2WYP+cJm
 INWyTzTf1GJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakYN6QAKCRBsPpGo1/A4
 bbkWEACF9T61MrDL0qHo18dU43ZLlyKdH0M4K5IFECvTmRs8ZqfPM2SyrwcLNj1Pej04WPHrzNy
 zf+134eVcNrdJhu6xT2C7sN3WhswLLje734BmImWOZzzEUwI2aqIFPcal841Ne5nTBjZuwQt4BS
 FIjKs/KvJbYbVxMsWGzNOVpLq2DvvC4TxzraHA3f+CWj+zZ6mezniMIMke2cB75zCPVatGdsXO1
 W/FnKKsqhYmgiztyY0unCiPbuh+gRyY7k9UwR5L8iOjEuHi78PAOXHvrC06zqkKnwjlXtrcaulq
 riLqEKpR0WBtXVovKsjvvjE73w64e6sS8Z1dYE96D8WO92UcMxWduJNyaCLRuFgNt27zzvuZRpE
 I7yjRx4qZMN/fOWFrEVn0Qyl7P3+eVYMDRPho/Cm5BSV43ftfAC7tri+hGtjnXrDZssGrp1fkhH
 wSyWy3HTZpBal0qcOrqVYvrJfNZYd8ZGjIqppkxMwOLCInh854FeSh+O22g7FkOzIarR/Px66Ye
 mc9FQKfXjBMzZYHBtckIa59VU8qp5re+wvpxl5Zcl1BDYhSR89/YOrQkUCiwVqS6Jt5mSDfzVQ5
 WDXbG4JuYHrC7l6HVEUa9Id/qpWvQvpjmkK/pzrR+m3mgbbRKj3FL5j8zuVQanVQJCz0jQ5zT3i
 KG3sr+mVHFNsvrA==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Instead of calling panic(), log and propagate the error upwards for
better error handling.

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
 drivers/staging/octeon/ethernet-rx.c | 18 ++++++++++++------
 drivers/staging/octeon/ethernet-rx.h |  2 +-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index cd36b5ba6f6c2..66e7253d484de 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -5,6 +5,8 @@
  * Copyright (c) 2003-2010 Cavium Networks
  */
 
+#include <asm-generic/errno-base.h>
+#include <linux/dev_printk.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -445,22 +447,24 @@ void cvm_oct_poll_controller(struct net_device *dev)
 }
 #endif
 
-void cvm_oct_rx_initialize(struct platform_device *pdev)
+int cvm_oct_rx_initialize(struct platform_device *pdev)
 {
 	int i;
 	struct net_device *dev_for_napi = NULL;
 	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	struct oct_rx_group *rx_group = plat->rx_group;
 
 	for (i = 0; i < TOTAL_NUMBER_OF_PORTS; i++) {
 		if (cvm_oct_device[i]) {
 			dev_for_napi = cvm_oct_device[i];
 			break;
 		}
 	}
 
-	if (!dev_for_napi)
-		panic("No net_devices were allocated.");
+	if (!dev_for_napi) {
+		dev_err(&pdev->dev, "No net_devices were allocated.");
+		return -ENODEV;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(plat->rx_group); i++) {
 		int ret;
@@ -479,9 +483,10 @@ void cvm_oct_rx_initialize(struct platform_device *pdev)
 		/* Register an IRQ handler to receive POW interrupts */
 		ret = request_irq(rx_group[i].irq, cvm_oct_do_interrupt, 0,
 				  "Ethernet", &rx_group[i].napi);
-		if (ret)
-			panic("Could not acquire Ethernet IRQ %d\n",
-			      rx_group[i].irq);
+		if (ret) {
+			dev_err(&pdev->dev, "Could not acquire Ethernet IRQ %d\n", rx_group[i].irq);
+			return ret;
+		}
 
 		disable_irq_nosync(rx_group[i].irq);
 
@@ -518,6 +523,7 @@ void cvm_oct_rx_initialize(struct platform_device *pdev)
 		napi_schedule(&rx_group[i].napi);
 	}
 	atomic_inc(&oct_rx_ready);
+	return 0;
 }
 
 void cvm_oct_rx_shutdown(struct platform_device *pdev)
diff --git a/drivers/staging/octeon/ethernet-rx.h b/drivers/staging/octeon/ethernet-rx.h
index 6093694326cb6..ff3ed3d784a4b 100644
--- a/drivers/staging/octeon/ethernet-rx.h
+++ b/drivers/staging/octeon/ethernet-rx.h
@@ -8,7 +8,7 @@
 struct platform_device;
 
 void cvm_oct_poll_controller(struct net_device *dev);
-void cvm_oct_rx_initialize(struct platform_device *pdev);
+int cvm_oct_rx_initialize(struct platform_device *pdev);
 void cvm_oct_rx_shutdown(struct platform_device *pdev);
 
 static inline void cvm_oct_rx_refill_pool(struct platform_device *pdev,

-- 
2.54.0

