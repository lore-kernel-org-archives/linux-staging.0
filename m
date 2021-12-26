Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E812C9C
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 08:25:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bq20so28113242lfb.4
        for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 00:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QfGX56SYhwrpe+QvNudq4oZC6Wdokgb4rNo9PWlg7Lw=;
        b=gnqhgzeGrkX3CEKT0qBAnDAHP9U77iFMEW20LrgKWtBGaZme7MXfQIfo7UbEr8RhN8
         ZviUScjNbVWU1pxSJlQBvOF69+9foyrlO4R5Q/ldiRAjikhoTTF9AibmQqHzip2/qYX2
         eSuzotv3MR5pfI0ah8DZ2T5X4BG17RSuyUkBCyy1DPNVKM1WF6LQjfmJf2k4vNwXC9xz
         UuXqKNYh7+5Cl19NIE5/JrX36w9VcvRpqG4h8kwD7K5FcZIhq/PwnlJ5hymrg6DnzCXP
         Vb0Al4WJtK5VkSXLLs8NxdeevBZhHJDSL/wIUqDcrqyI4ciAJJLcbdq0hnGM7zAM3oZB
         llfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QfGX56SYhwrpe+QvNudq4oZC6Wdokgb4rNo9PWlg7Lw=;
        b=pRNE2H+krDxzkJZyhgiGbC/KHh5NdBwVIC/l3bSND3YZfQ1bdjBOlq4iLwIG2i1hU4
         uUoqoCPvpLens8uQHaF5kOenEfUxtvlsNlvEt0YuQSSPYB5ANeu0DJvIv8d/rXM2NM3L
         8wX5ExRUqe2an40ZA4Rva8QZN9CtHChF+UZrXNYxPhG+S/KQeg0oA5tdMSI0jUmWpuLM
         SXdyqraWOqakSZVjNaRfR46ygc+k9aOKWyuk92fM76R13ynU8lWoH/MA72YvS1zjtF45
         cp6cFj6sMSdj9D4ic+3Y85CGOoD81RxmN33FZTz1BxF34fH4zfpK+lhcLAO8ys4TR4UA
         Uo2g==
X-Gm-Message-State: AOAM532dfbdclm1/MYOmax1I66dIBQAJYdm5hmBJdMQVXFQeqX2MPoMD
	YHgNYfDq/WSjFkn4d7SF3xJ5Mw==
X-Google-Smtp-Source: ABdhPJya3oGg+1T8AWsq/DMm18GJEUhzuVkVpI8Z4am1xyFxdaHtMvIoDt3lS1UBLDxQ4SrWHEYNLg==
X-Received: by 2002:a05:6512:3e13:: with SMTP id i19mr11481737lfv.508.1640507143488;
        Sun, 26 Dec 2021 00:25:43 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id z5sm1309023lfd.184.2021.12.26.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 00:25:43 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 2/3] staging: most: dim2: use consistent routine naming
Date: Sun, 26 Dec 2021 11:25:29 +0300
Message-Id: <20211226082530.2245198-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211226082530.2245198-1-nikita.yoush@cogentembedded.com>
References: <20211226082530.2245198-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename init routines and enum values to reflect that those are for
Renesas R-Car Gen2 and R-Car Gen3 SoCs.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/staging/most/dim2/dim2.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 044e4bdeeaf2..29f8ce2a47f5 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -971,7 +971,7 @@ static void fsl_mx6_disable(struct platform_device *pdev)
 	clk_disable_unprepare(dev->clk);
 }
 
-static int rcar_h2_enable(struct platform_device *pdev)
+static int rcar_gen2_enable(struct platform_device *pdev)
 {
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
 	int ret;
@@ -1006,7 +1006,7 @@ static int rcar_h2_enable(struct platform_device *pdev)
 	return 0;
 }
 
-static void rcar_h2_disable(struct platform_device *pdev)
+static void rcar_gen2_disable(struct platform_device *pdev)
 {
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
 
@@ -1016,7 +1016,7 @@ static void rcar_h2_disable(struct platform_device *pdev)
 	writel(0x0, dev->io_base + 0x600);
 }
 
-static int rcar_m3_enable(struct platform_device *pdev)
+static int rcar_gen3_enable(struct platform_device *pdev)
 {
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
 	u32 enable_512fs = dev->clk_speed == CLK_512FS;
@@ -1046,7 +1046,7 @@ static int rcar_m3_enable(struct platform_device *pdev)
 	return 0;
 }
 
-static void rcar_m3_disable(struct platform_device *pdev)
+static void rcar_gen3_disable(struct platform_device *pdev)
 {
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
 
@@ -1058,20 +1058,20 @@ static void rcar_m3_disable(struct platform_device *pdev)
 
 /* ]] platform specific functions */
 
-enum dim2_platforms { FSL_MX6, RCAR_H2, RCAR_M3 };
+enum dim2_platforms { FSL_MX6, RCAR_GEN2, RCAR_GEN3 };
 
 static struct dim2_platform_data plat_data[] = {
 	[FSL_MX6] = {
 		.enable = fsl_mx6_enable,
 		.disable = fsl_mx6_disable,
 	},
-	[RCAR_H2] = {
-		.enable = rcar_h2_enable,
-		.disable = rcar_h2_disable,
+	[RCAR_GEN2] = {
+		.enable = rcar_gen2_enable,
+		.disable = rcar_gen2_disable,
 	},
-	[RCAR_M3] = {
-		.enable = rcar_m3_enable,
-		.disable = rcar_m3_disable,
+	[RCAR_GEN3] = {
+		.enable = rcar_gen3_enable,
+		.disable = rcar_gen3_disable,
 		.fcnt = 3,
 	},
 };
@@ -1083,11 +1083,11 @@ static const struct of_device_id dim2_of_match[] = {
 	},
 	{
 		.compatible = "renesas,mlp",
-		.data = plat_data + RCAR_H2
+		.data = plat_data + RCAR_GEN2
 	},
 	{
 		.compatible = "renesas,rcar-gen3-mlp",
-		.data = plat_data + RCAR_M3
+		.data = plat_data + RCAR_GEN3
 	},
 	{
 		.compatible = "xlnx,axi4-os62420_3pin-1.00.a",
-- 
2.30.2

