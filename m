Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55271
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 11:15:39 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l14so5187581wrx.5
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 04:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnhsZglV9Tim8CW0KmXYUH85PSzSV/y0PNcnH/Ygu/E=;
        b=QuoDQQzU54P/pO1hushKfsM9IASTAvM9x+K+B0FAT5zQxytbkZGXZmxdCZKNPEHc36
         1TBcfDQ+RGmBzGwrk7XvaZzpGq7fakoOOrV+D3d06lYHlYOyoGT/S7Bvbks9WHLOYdH9
         x/0F5Go06xpX9odxmDnVHsrV88rbEDfzWnqkR29V+u8+Wmyoxx8vUkeuMMslGJWRuSCo
         PgY9H9tUVflMZRENVAmmUjFmUJU7KvbZlnOLSc/tIjgy3++rTrNyovAV/9GrgoJWcKna
         H+XMCqKDv/5s9jt/v5LJ+UiltxO5s1u5sQBGuZagFxA2aiwM2zYNcQ1Yo4/Qs9llO7wH
         TVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnhsZglV9Tim8CW0KmXYUH85PSzSV/y0PNcnH/Ygu/E=;
        b=B30sapTd35IzovGbZ3tk6TdAbW96S4vbHhx4Gx9pciVhY4sY6KN3tutPS+4TXsAD8u
         wl01V1XV9wHjs/4roiCu/EpDT0l7KpVRNYhs02nrRg+yF7OnUtxeWPY5/cke6EzA++nY
         Rqvk+CoW/4tlxxk68FMTShOoNnCRKAXr34dSawCy2YODc7rmDWdkDd1uXIpuFUPbEvZy
         ghZtn5bMTXUZ63Tx+Wptvi2ttYDeA+lLwmWUUw49yE6rjG2wHltR5h9yamzSzsJl/nmG
         l9NocdlK799FhwBIov/8dsI6FGHe58nlRWbnuzFNsDV55Hl+uTvU/YOtOs9e+Ii7nVjS
         5Q4g==
X-Gm-Message-State: AOAM533Wyst5T2Ym8C+f3hYsu1o8LRRzOYoRG/Ad88Ze7lFa6B3zngzQ
	JKV/+qKFAz5vvf1bg/hraBc=
X-Google-Smtp-Source: ABdhPJzH20Vd2ChccpIwWV5inlVmnET2Cb9+hDPcI+6QZIxtgU6qxDS6dx2kxXTSYJMUiQsnwdSzTw==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr4619928wru.247.1620299738265;
        Thu, 06 May 2021 04:15:38 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id u5sm3642433wrt.38.2021.05.06.04.15.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 04:15:37 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 4/5] phy: ralink: Kconfig: enable COMPILE_TEST on mt7621-pci-phy driver
Date: Thu,  6 May 2021 13:15:30 +0200
Message-Id: <20210506111531.21978-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
References: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After use the clock apis and avoid custom architecture
code this driver can properly be enabled for COMPILE_TEST.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/ralink/Kconfig b/drivers/phy/ralink/Kconfig
index ecc309ba9fee..c2373b30b8a6 100644
--- a/drivers/phy/ralink/Kconfig
+++ b/drivers/phy/ralink/Kconfig
@@ -4,7 +4,7 @@
 #
 config PHY_MT7621_PCI
 	tristate "MediaTek MT7621 PCI PHY Driver"
-	depends on RALINK && OF
+	depends on (RALINK && OF) || COMPILE_TEST
 	select GENERIC_PHY
 	select REGMAP_MMIO
 	help
-- 
2.25.1

