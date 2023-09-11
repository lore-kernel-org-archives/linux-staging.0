Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C2AD23;
	Mon, 11 Sep 2023 18:46:23 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso74103391fa.0;
        Mon, 11 Sep 2023 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694457982; x=1695062782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8TBr4EN5rldaZkHvkd2rnKKqYjv2Um5C+H0942voyCA=;
        b=dBV9kVxFVSS5MxgZJUGZev2m8HjjCx7d7GoxX8/zbn4cJVCPbL1zLupgBLBCd5Xjcv
         m9QeLcaMQ0vVsdHVQ+9NLxtRyWw0OvlTO0M94dmYEA02hx1P8I4ZifDGx4e0Z1Z8v3Mz
         0tWNsPwGWpzbNy8gumcLeIz8A9xKHBjc6+ylxqFYP0d7v/VXy26iIk92e9O/xs3zx5D6
         EhO3QqVvW+bfQfmHBb2r8eRNpgh/i1WANrNiCKUxaiC11trudiwB2ljknRMtiUcVzEOl
         p4Hyq0pTijdKQUSJaoc6OS8w8NY9bLGlV1IjVsEHuPtpQOOY/IOkz6xaTOA+zMLaOOSL
         fKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694457982; x=1695062782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TBr4EN5rldaZkHvkd2rnKKqYjv2Um5C+H0942voyCA=;
        b=G0t/9IFHWwm4vJIpAnYqyesFQeNQf4H4bIOywb17sbE15jyCzL8A8db45ppbep3lAB
         pauCDpN9aGcD+z3v6hju1NDnaAAVJlg0zsPAvuCjV0NVkn1R2ha5gtrl6sfN1w3a+cD+
         U7GDBbT/FkBWXqNUCr09MjCbWX8AN99spk6Cg664iNwjwznuVwwIJGBFRTu5faJmfWtp
         mAAj53MYUfl5b+6S+yc9jh3XlhN0zNsHYjQen6fn7qko1pT6qpmCml+DJD77sty4lGML
         5oB/EUJG7vbytwBoBrexRJbGp6Z+YROSTigjKf0y8onvbuTDnqY/AjRRLI7dQDfG9mGh
         L0KA==
X-Gm-Message-State: AOJu0YyBLs4kg4UTAakESfQ4Hhk8nNRrcKW0UMhXvclBcFDZTDU3CJ2t
	i3QVMS3EzcigLaajMN/6AUw=
X-Google-Smtp-Source: AGHT+IEFtUwssM3Wz0EWQngKzY2DsMzQtci8zO+mdro+nrwGTnYM5m/LPUyRsxrerapH+WT+2kbMfQ==
X-Received: by 2002:a2e:980e:0:b0:2bc:dd96:147d with SMTP id a14-20020a2e980e000000b002bcdd96147dmr9353782ljj.28.1694457981836;
        Mon, 11 Sep 2023 11:46:21 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b009a9f00bdf8dsm5733764ejb.191.2023.09.11.11.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 11:46:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: cedrus: Fix clock/reset sequence
Date: Mon, 11 Sep 2023 20:46:12 +0200
Message-ID: <20230911184612.1754373-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to H6 user manual, resets should always be de-asserted before
clocks are enabled. This is also consistent with vendor driver.

Fixes: d5aecd289bab ("media: cedrus: Implement runtime PM")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index b696bf884cbd..32af0e96e762 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -172,12 +172,12 @@ int cedrus_hw_suspend(struct device *device)
 {
 	struct cedrus_dev *dev = dev_get_drvdata(device);
 
-	reset_control_assert(dev->rstc);
-
 	clk_disable_unprepare(dev->ram_clk);
 	clk_disable_unprepare(dev->mod_clk);
 	clk_disable_unprepare(dev->ahb_clk);
 
+	reset_control_assert(dev->rstc);
+
 	return 0;
 }
 
@@ -186,11 +186,18 @@ int cedrus_hw_resume(struct device *device)
 	struct cedrus_dev *dev = dev_get_drvdata(device);
 	int ret;
 
+	ret = reset_control_reset(dev->rstc);
+	if (ret) {
+		dev_err(dev->dev, "Failed to apply reset\n");
+
+		return ret;
+	}
+
 	ret = clk_prepare_enable(dev->ahb_clk);
 	if (ret) {
 		dev_err(dev->dev, "Failed to enable AHB clock\n");
 
-		return ret;
+		goto err_rst;
 	}
 
 	ret = clk_prepare_enable(dev->mod_clk);
@@ -207,21 +214,14 @@ int cedrus_hw_resume(struct device *device)
 		goto err_mod_clk;
 	}
 
-	ret = reset_control_reset(dev->rstc);
-	if (ret) {
-		dev_err(dev->dev, "Failed to apply reset\n");
-
-		goto err_ram_clk;
-	}
-
 	return 0;
 
-err_ram_clk:
-	clk_disable_unprepare(dev->ram_clk);
 err_mod_clk:
 	clk_disable_unprepare(dev->mod_clk);
 err_ahb_clk:
 	clk_disable_unprepare(dev->ahb_clk);
+err_rst:
+	reset_control_assert(dev->rstc);
 
 	return ret;
 }
-- 
2.42.0

