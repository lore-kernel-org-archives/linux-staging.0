Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E43FC8
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 16:51:41 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id m3so227339lfu.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnVNJWxdJp/O3yNbbRJ7mIEi/fwxJdU+PF6KUrC9rVE=;
        b=1OTLWhIAZbw98TXwD1Gw/0gnV9IeA5sInhq86eCw9rH28Kbkiby2P26MPUY9DRxksS
         zlbL/p3GesEAjDdOaksgIZQAA0WwGATzjmt/mXlTfbFHjmPmFeX1uwfsbRy2K3N7Wkxy
         gV/xFk+5MOFhhvqS254pfPNL+/wxlTmx9pf/fen67K0zC2XO1kVbBHW+MhyK3WYVfL1X
         UakBHRuKYs5bXOQlr2sHsxnNQBp7PUfH0guzUQoDW78HpcPcHgCOTRjZ4CJmrKJfTZws
         LvK6Qo6dIdQcCf68YaB7EPCuGpsw5sauXQTAqmS5LIjCS2opMw7dg2rH/7VNrwXZZt5A
         ywfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnVNJWxdJp/O3yNbbRJ7mIEi/fwxJdU+PF6KUrC9rVE=;
        b=zzmYlr1rlzx2a7pvEb9xEghlTdPAlPdPKKakeSVq1s6Uy72ytIUymHvpElD4trKdnY
         F5ds4FmIS8e5A+evhXakQslcyVRaE4ZwvLTgixx2Cy0RSjPjoxmPcGAC6/71vuy1hASx
         Dp1vaswTV3pJUvJ00xvs0Or9aVTgawH0jyHCbHuiG60Gmrr9GFQJVG4QmBf74Kd7f3W+
         T1bwMpbM9I1CFr8ni2pP1+gEEDA1IhsBeoDwm18Kp0Ghrg2gVe+lFTNEDrQlNNmEqpiN
         KfuScKnPJebV41/TmdP0IhfGu+SHs4oCZGpJGSCa/tsrZu3BkrTmFx/Yqnplf9KofeBk
         ivOg==
X-Gm-Message-State: AOAM531npM+9DpS+NaOlz1J3QLOwXomFQKj1S/nVzUQwJl8m0hi0pZS9
	3gLz5CyNNoYtJfUvaO/M8WmdVA==
X-Google-Smtp-Source: ABdhPJwnhhw2d4dOMygsgFPi1GNVXIA1X4Ce9E8R+xk6bsFj+gkQwNLHwXyhfzOHXlWrbz/ZBuXqEg==
X-Received: by 2002:a2e:5049:: with SMTP id v9mr23584503ljd.128.1632243099506;
        Tue, 21 Sep 2021 09:51:39 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id bt38sm1559955lfb.269.2021.09.21.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:51:39 -0700 (PDT)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] staging: most: dim2: force fcnt=3 on Renesas GEN3
Date: Tue, 21 Sep 2021 19:51:30 +0300
Message-Id: <20210921165130.24178-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Renesas datasheet, MLBC0 register's fcnt field in the embedded
dim2 module must be never set to value different from 3.

Enforce that, via an optional field in struct dim2_platform_data.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/staging/most/dim2/dim2.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 093ef9a2b291..d90284d79621 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -108,6 +108,7 @@ struct dim2_hdm {
 struct dim2_platform_data {
 	int (*enable)(struct platform_device *pdev);
 	void (*disable)(struct platform_device *pdev);
+	u8 fcnt;
 };
 
 #define iface_to_hdm(iface) container_of(iface, struct dim2_hdm, most_iface)
@@ -731,7 +732,7 @@ static int dim2_probe(struct platform_device *pdev)
 	struct dim2_hdm *dev;
 	struct resource *res;
 	int ret, i;
-	u8 hal_ret;
+	u8 dev_fcnt, hal_ret;
 	int irq;
 
 	enum { MLB_INT_IDX, AHB0_INT_IDX };
@@ -770,8 +771,10 @@ static int dim2_probe(struct platform_device *pdev)
 
 	dev->disable_platform = pdata ? pdata->disable : NULL;
 
-	dev_info(&pdev->dev, "sync: num of frames per sub-buffer: %u\n", fcnt);
-	hal_ret = dim_startup(dev->io_base, dev->clk_speed, fcnt);
+	dev_fcnt = pdata && pdata->fcnt ? pdata->fcnt : fcnt;
+	dev_info(&pdev->dev, "sync: num of frames per sub-buffer: %u\n",
+		 dev_fcnt);
+	hal_ret = dim_startup(dev->io_base, dev->clk_speed, dev_fcnt);
 	if (hal_ret != DIM_NO_ERROR) {
 		dev_err(&pdev->dev, "dim_startup failed: %d\n", hal_ret);
 		ret = -ENODEV;
@@ -1047,9 +1050,19 @@ static void rcar_m3_disable(struct platform_device *pdev)
 enum dim2_platforms { FSL_MX6, RCAR_H2, RCAR_M3 };
 
 static struct dim2_platform_data plat_data[] = {
-	[FSL_MX6] = { .enable = fsl_mx6_enable, .disable = fsl_mx6_disable },
-	[RCAR_H2] = { .enable = rcar_h2_enable, .disable = rcar_h2_disable },
-	[RCAR_M3] = { .enable = rcar_m3_enable, .disable = rcar_m3_disable },
+	[FSL_MX6] = {
+		.enable = fsl_mx6_enable,
+		.disable = fsl_mx6_disable,
+	},
+	[RCAR_H2] = {
+		.enable = rcar_h2_enable,
+		.disable = rcar_h2_disable,
+	},
+	[RCAR_M3] = {
+		.enable = rcar_m3_enable,
+		.disable = rcar_m3_disable,
+		.fcnt = 3,
+	},
 };
 
 static const struct of_device_id dim2_of_match[] = {
-- 
2.20.1

