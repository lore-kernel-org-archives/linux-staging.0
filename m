Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD13FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:10:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id u16so11319268wrn.5
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
        b=MeT9W24Jr2f9RvjUC5EbBHXQOyy115v+4M/+W1kU/o08i4o+XtIkF3zaTkNILlsp3n
         QZ2vhRuQXCvwm1YePWgyHa3xQfnXKyksuI6Oeu9eTPhdhHhWOFCW3QPI3nmBrkq1f6ff
         JbG1uaz8WrgNCEHiPIAkUsNaBI/Ui2bxy2QuvcKSNJjxqh7yAe1S3IjEok4s4epX8HXN
         y+e8MqPONDOga34MZsm9+g8TIov9EiuV889Gpmb+rsWKXS5rk1ZJHZM0VpUkd/iuTVIn
         DdvPqlVezTjnVrgbYvjCurd9bHHM5//w4NKpvYVBWyJ4Gq40Ow8SphSrrZbPfgX3gT/a
         PFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
        b=Nv7T4S1CglyE3I1UNgqH9JMhJCPPBWOKDRkKLeBUkDd0l0fjuvICt8WgksL9caTtmk
         w21cT0TfwcOu8cJb1jxUiralL3mIiV8dFdhTcLGjmBQmBf9P4d/q/kYamRJ7wkp3m2Ho
         PqhcMkxQUtRrQSpIHgfgdglFFjlgRoNrhuJRKtyJhSseXk1CXlrhgUKFfr4/Ukehdnix
         Sq6srPy88ksyIC4oulrx5Pfe3P7RxWLiXPCXnttV2JAcPgvToCQn16Cdo0t606ny7l7/
         zyW36smgkwu2iV8zHxac3U/QfkjeZZUD1yUvnwvGRxrGFR6BrbHAnl4AAovmrB7ixKZr
         H3ew==
X-Gm-Message-State: AOAM532yw54ih/s424iIhQCOyEAsoqT/gF6QFpTOpH3RbYmxB0Z0blAL
	UcIO6THp+DeuwUMMwTinvvM=
X-Google-Smtp-Source: ABdhPJzu7MzyAyEOUCRr750amNJVBtVQ2utB+Xjt8OlkPvZv2p6LYKW9k094ppdCb1q26Tn+61kFew==
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr8787352wrs.183.1631477410012;
        Sun, 12 Sep 2021 13:10:10 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:10:09 -0700 (PDT)
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
Subject: [PATCH v11 15/34] drm/tegra: vic: Support system suspend
Date: Sun, 12 Sep 2021 23:08:13 +0300
Message-Id: <20210912200832.12312-16-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware must be stopped before system is suspended. Add suspend-resume
callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..359dd77f8b85 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -315,6 +315,8 @@ static int vic_runtime_suspend(struct device *dev)
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
+	host1x_channel_stop(vic->channel);
+
 	err = reset_control_assert(vic->rst);
 	if (err < 0)
 		return err;
@@ -517,6 +519,8 @@ static int vic_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.32.0

