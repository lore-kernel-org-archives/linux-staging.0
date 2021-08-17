Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E576D19
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:34 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id y34so38165886lfa.8
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6lLAJV89hQcPlyDX5yfRwTHcihc/r1AqZv/5pRsMLxM=;
        b=nwrGyMxr7TkokoAbKrZt8dmendcbwZ/KglOYAoBtkklp0BVOYjBE6OPrXf8u2d0QSs
         JYJkalIYEYZY+URP5BFOM3PuBRhSKyvy8KCdC/rx8InfIY2vyXdT7bnsx67YVsK3yyDk
         TkFSDgeuVXYwWRPVubotA6I+kOxT5++AJriWNKLk5qzlP67E32aPtTnhVVg7sPhLoFDq
         F4wGo4eWbDPCAQY0oBCeUh2eY1FGe1yC6o5DeAI/SL7hvqLmmnRTITxwj3pV7KwsBons
         EzwYyNAwszjKMGVw+qrqW2pmosbwgrw1V5vmLfVDZeczzI3UsacNhxC+Ilhf6fIDM6QR
         GHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lLAJV89hQcPlyDX5yfRwTHcihc/r1AqZv/5pRsMLxM=;
        b=quB7kPAsWR5yBv6/eKycw1SIB5AIuMIOmRaXKqS+CFuxuFe+nKoQgUPU6dVjRvd95c
         S3duqZgyt0nX8gDTyXNYwfjofv4qzaZ2NU3LYRuW1BY2oTCsG74XrbffflYkO58vUXtd
         zHGgwIxCfvmuhzIpJYNfDJehSV+QjWwHEYwv+P+kBKvO6z6d+0kzf/Pekrv0LzVs77Bu
         500IWi99ZOXRfDmy2JDNL2plS4c4TXeLqK6VGUUYv4+rPKi3JHjjODg3wEpe5OkPOZis
         PMynmFpHjltykE1zgzMHY12BX2licfogfzUr8lBmrxfZXFTccHS1YBDUZDlFNMEbp4/o
         DRGA==
X-Gm-Message-State: AOAM532mti7M37HUIMpFNoFsMax79D2g7WFtXjGiMNQ9M7zlaT9QvtwG
	WBBn01eBz80DmDDCOJArotQ=
X-Google-Smtp-Source: ABdhPJysm3N4gOhYNuFKEDPKN7Uh+i4G/iAeuT5GxXfDxPml3wY50JIEVz90Yl1goWbq9lgObhlGSQ==
X-Received: by 2002:ac2:596b:: with SMTP id h11mr492625lfp.558.1629163832433;
        Mon, 16 Aug 2021 18:30:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:32 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>,
	Stefan Agner <stefan@agner.ch>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-spi@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v8 26/34] soc/tegra: fuse: Add OPP support
Date: Tue, 17 Aug 2021 04:27:46 +0300
Message-Id: <20210817012754.8710-27-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize and sync FUSE OPP to set up SoC core voltage vote needed by
FUSE hardware.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index f2151815db58..d1b66cd9339d 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
@@ -213,6 +214,10 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		goto restore;
+
 	if (fuse->soc->probe) {
 		err = fuse->soc->probe(fuse);
 		if (err < 0)
@@ -259,6 +264,12 @@ static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
 {
 	int err;
 
+	err = dev_pm_opp_sync(dev);
+	if (err) {
+		dev_err(dev, "failed to sync OPP: %d\n", err);
+		return err;
+	}
+
 	err = clk_prepare_enable(fuse->clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable FUSE clock: %d\n", err);
-- 
2.32.0

