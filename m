Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9654227EA4
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 07:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630112; cv=none; b=tm32Dwh3mcrMK4xEagWpXRymLbYbqdgOSfT7etrr3d9lWrzBYdxvRXY1jgjeNVQHfEu+6Jk5GBfeGAueCxxLGsp63d1VS7fABT5m793QlD6864xx7u4X2Kwb78PP4W31P1Y8oVVDx43qkz3MRhkaLHvIut/gMpIk82vOOH6bPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630112; c=relaxed/simple;
	bh=S3WGUr8EbUDnzRnDQdiXuU7JQ5VvK/xEqOqJ6Y6XO6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eTcnwA+uDojqtpnwT+c3HwdkbSo8IYi4laLORWhzxAC2c+9zdXAjo7HtMkeBsyPfJDdeLMMzzLH5rKGrcx+O93CUjdBUGwNgYZopFH0xvoxhH0uwQDQvKoOZZQq+T82uFvN+WituSyGKfIKdQ8m1sCXlOEymnW9POiqWQ1qiJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8D5HHpB; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8D5HHpB"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3078e0dcd67so3968515eec.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 00:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630110; x=1783234910; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXokKAA+ArLkoRHycPsFI7+9fMpYzVXji7Up+eouGtM=;
        b=q8D5HHpB8y3PNchwc3eOnXkIdJXX88XXCckTORAO4fE7GqFr1U+9K3Lusy+t0S+ufY
         1s0lPlFWR3ysx541HGiJ8JVF0fKegVTAcNs4fsDgJvgsUE5lJjDa0HOvEo5gWlxCdzmW
         a32OEu6JhXp+hv0VeQL4rEOVMurvKUubjpakp2VVAyIgbkdY2pxUB7MfOlKnPqmwdkbT
         /gmcczIYfOD1ZjQOuwgwsZSNVqdJ7eYKGh9a1d5ZW7DX4ae6VkIAWr/YSM6nIOTQ+TDZ
         fegkuSUm+wbc40ODdNhgPu85AUmPNsMNxRqFnKDM+tMGlqc80ufi1exJ5FJQ2iuxZGzN
         M/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630110; x=1783234910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXokKAA+ArLkoRHycPsFI7+9fMpYzVXji7Up+eouGtM=;
        b=Khnw7bEZbjotlBD9okuvCA/pJWzccD4gBoKOGb3DVC1bgRiy3G8kkdquLjTlVWtqVF
         uFjiLmRq4CCc4OZHM0+s4/i6Ti3SCM9s7Nc5jPIIXRXrHJPZKN068c7X/Kju1tpSZd7l
         GdeHYO9L4WYMqK1CmHGwZrinM68hZorfkt7bset7FihXrj7DSvFfXWk2Q9oJNIkUNk6j
         vF2TRjDGTWg55+uLi/N77nCj/NAQBVOdnu/DT2+sjSWIWUFbxdoGPUpVw/slqY6sAFvV
         B/0U9p2EobIdZ6sVErNQeK4ePNZ4ROoa+KX0DyUMxKdTQRtBgt0gecgPZ/+sle6TSkbE
         0Upw==
X-Forwarded-Encrypted: i=1; AHgh+RprsOUz0qGglufKSOF4Dlq67aUQ61CdxM6jvqAFAPB+2kMW7i0+h7VP3h3ByHbiTUG01ec1ZcS8o8KF/ZO4@lists.linux.dev
X-Gm-Message-State: AOJu0YxoNkIIl9QV+zPgYYNt6iuZ6Tcbizaz0XaSfa7lTWvXBoo+CFi6
	QEPTlFMEd+vYQzPBciO/z9797dchy1xCc81Sts524TN2xB4kPlg1kopE
X-Gm-Gg: AfdE7cm6VXBphEDPO8d3GAJzuWVEFpo24P5YOkQvgXuv7pFEdvnE4Z/g3Hsj91/Gws9
	OHYrvSENHytLbmzH6VB8MZjgJxLMCNSbqCPTETWFENAHA0TQpJbo7E8u5/Fek2f0RQe8kfmhGdP
	K34HbUwTlmx2w2rw35v2YBZPQS3wqF/a36JQ5RoUyeffQnzZOW9Xmk2P1BiZ5ixGkWvj+/lyhaD
	JQf27qOA0d4kJDefE0g/jyCk/O79XqM2Bv6B2tppKygTsVWgSPaqfrMdLDGCFkDVYn4crxnGUWg
	p7H1txbCWomKhJ5wxeuvhECGWUKWs1JiTbNG1uEiiMEM2iCrOg9dnE9MDrT9Vzw9+8QwCUk9EEw
	NNxnZsVfNhtoa5JyZrdl5OrKYzKLLwLiFx7FgMYREU16D4g1pNf9skZGE/I98MonX+CTvsx045c
	4TaoypFugq2pDr+qHg+A+KAVCrsHCswBdzz0ArAKKMmRp6WcKR1L6wXwoun26prDkWQRzApkjl5
	62xydSg7Yw=
X-Received: by 2002:a05:7300:4312:b0:304:df8b:71ee with SMTP id 5a478bee46e88-30c84b1dbbcmr11880558eec.7.1782630109767;
        Sun, 28 Jun 2026 00:01:49 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm39878489eec.16.2026.06.28.00.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 00:01:49 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Sun, 28 Jun 2026 12:31:25 +0530
Subject: [PATCH 2/4] staging: octeon: Propagate rx initialization failures
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-staging-driver-octeon-panic-v1-2-fe8c34989254@gmail.com>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=S3WGUr8EbUDnzRnDQdiXuU7JQ5VvK/xEqOqJ6Y6XO6c=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqQMbUFWyMMeHTyQti/HR7f2/My+Sb9hfniUkla
 yAys0Kg37iJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakDG1AAKCRBsPpGo1/A4
 bZMYEACtuG8gzTuNLu4emvtvWLCssaiMlTqJBaXUj8w8NsLY+5GloxZxDYMY1o23bFuco74vQbH
 5eRV2IWaHRLwM+ONkJ0b01zJL87p85bkNRYGJUaVoYrDIBbOXhH5BU/h6ZZ7qZ61Q1yWkeAamvo
 B6S4nJO+iPDlo2G++o4c7V8RZDvJTL+BcEvk1qnEC7PFdPYGiu0jDJ1nyXrC3zKjuM6pv96erAX
 5bU5SrwAjy2QK6rxwBAV94q2RZa+fdjeVMaHLpaxw4WSsES4CXMpPskRics+TytZUTdHDzYNQWt
 BTXn2zzyAlz99bVaBUd0sAdzNwn/58KYtAzn1Bdunx/xwuVJC33fTlHRSMu+o5Gf2OrxMEDbQuP
 C87620IToNRVRRX3NRs+Wkgz/mMMJwgIHkSXJG1sZ3RyDJlO5MRoOfqLFIKUgVpvoVXUs+YJcic
 7vz4SrQOtuGcWSlV2uHiIC5faf/jMXvsVGJL4g5PAGWI8M9D24AZQ512+YE6r5LahYqyO8N/dvj
 awQJ5k4WOQWV0AzK8Hi3HPplb+P3+RzbRoNAzFBBIN2JQ10sg4BpbBCqdgjAwsbp9M8GtGTaBfy
 HOstIyWVPARlaQRcI6F2GELWHm/QM6NGfcKFTam0vFvHLFcNmAQreICXdzwsU+qEkaXAm/PYQgi
 voRp8DNIXko+kgg==
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

