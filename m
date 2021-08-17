Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D966D22
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id y7so30269407ljp.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQDzXZvRDUZkLv5x3ImTMmoCkegW1/kgvrYOEYJcZ1E=;
        b=WnkqPT38iEK+LI2pegQ5CAgZHbUA+4T1HBF1Robs64xHzd2RVVDQL5P2Th1DUqHQmg
         Bmip5c85v20usxU6l+F6TNpm0oydiIVHub5elxPj9ebjhuRxMMJKJhh1mnjJkJBfCPui
         t3RNY/nUebYwUEneR0f3mwbtZtB/CmmkPR03QqeUewR3IvqyyyMRHZHKTwRUPOGUnQQw
         FHGyQFw5JabzhE6WPtOkrekSYjBvD/veH3cIzof6CzoYj45MQmTsKOpvWSA2fZSY8GmA
         YlKTz9SZ2ABu0XLhuo4N3qRhp1fuwUr3pubXVtg1Z2vckegbLZrvE43sBkYZzT4kyasO
         fJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQDzXZvRDUZkLv5x3ImTMmoCkegW1/kgvrYOEYJcZ1E=;
        b=apuRTAxIV5qp62Ia2lTLYR7HcVwwADmgaLdd9S8AZU852cZWvYUhRndlTmrd3Hb8Li
         t3XEz3b9qVlyda7f/Xl9ftiILl2VrPN9jcUhg5L/a/exsxNXg9uOtEsfNtvhlWQc00gL
         fAF4lccmEs3uPxeCyP6WT59bIfZumWmhjvGawxdeEctG3zHccmpLoDwdDBtnDm+/lnWN
         /fuOUPEBxvaGoftoGrAyfcDxnkFDcZvoJMj/HbM/4b/ca84bWgElnQyrdB6EEfqapHvL
         Zx5bOCAXbSTT/i78aH+nmOhsrFqGDwPW235cdwxl7+HfnqQHxsMS8+VZfx2EUu/c8WQE
         fGXA==
X-Gm-Message-State: AOAM532WgFA64K63ImYbveAe1AG77Dfh4POMArYJXBzRpIDwh2J6H3z/
	xeJm38nIeGQ4QxKJYSp7zUQ=
X-Google-Smtp-Source: ABdhPJxafgNSwgi9onfKPo0+LX8+L56eoUxCQoUliGfkte3CyYpPj4Ux16SZvsFjT/VXs0Ws0bfVww==
X-Received: by 2002:a05:651c:1144:: with SMTP id h4mr847720ljo.396.1629163833587;
        Mon, 16 Aug 2021 18:30:33 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:33 -0700 (PDT)
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
Subject: [PATCH v8 27/34] soc/tegra: fuse: Reset hardware
Date: Tue, 17 Aug 2021 04:27:47 +0300
Message-Id: <20210817012754.8710-28-digetx@gmail.com>
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

The FUSE controller is enabled at a boot time. Reset it in order to put
hardware and clock into clean and disabled state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 25 +++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h       |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index d1b66cd9339d..0c2723c2822f 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -248,6 +249,30 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		goto restore;
 	}
 
+	fuse->rst = devm_reset_control_get_optional(&pdev->dev, "fuse");
+	if (IS_ERR(fuse->rst)) {
+		err = PTR_ERR(fuse->rst);
+		dev_err(&pdev->dev, "failed to get FUSE reset: %pe\n",
+			fuse->rst);
+		goto restore;
+	}
+
+	/*
+	 * FUSE clock is enabled at a boot time, hence this resume/suspend
+	 * disables the clock besides the h/w resetting.
+	 */
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
+		goto restore;
+
+	err = reset_control_reset(fuse->rst);
+	pm_runtime_put(&pdev->dev);
+
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to reset FUSE: %d\n", err);
+		goto restore;
+	}
+
 	/* release the early I/O memory mapping */
 	iounmap(base);
 
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index de58feba0435..1b719d85bd04 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -43,6 +43,7 @@ struct tegra_fuse {
 	void __iomem *base;
 	phys_addr_t phys;
 	struct clk *clk;
+	struct reset_control *rst;
 
 	u32 (*read_early)(struct tegra_fuse *fuse, unsigned int offset);
 	u32 (*read)(struct tegra_fuse *fuse, unsigned int offset);
-- 
2.32.0

