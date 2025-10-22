Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC8234BA5E
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142891; cv=none; b=LAr+K5srhmXExN2ExoKmsgy4tCXLdikhKGlw6NFGM2PdtdVguPlC3k18TbH6YR3DNnBcRD6yocA7B791qumH5r0Afq3tQpXy6a1E12HutosMn3Sjh0O6EoAGiSVFZWO7vtOTWCjw//nAtB5wseesYmkejR//RXAKPBgrjrqFm+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142891; c=relaxed/simple;
	bh=StgmpCCvPBz0Xxp6Zjir2fxt92S4XxfOAldb0fVdh1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/1JtFbnXeHd9uJFPFuaOI6d2nfqn+P6w96kPfFmE5prI+4Y0AM2lv7tGxO51ugqNFGg3TAiJnQrZLWcWT+qrqszU+ASdUEO6x0hEMy+TYPa1sW334/TREibGksd1+x3bzlrCfYzYap2TmXt83vvOyNNk+IeXIMZICMNSw0yI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR1v9tGT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR1v9tGT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-427015003eeso1995718f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142885; x=1761747685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmNUOtQ4rCh+WJGfL6eSc2bLlTQ62NRBrul2RcvmvE8=;
        b=kR1v9tGTNZ4KisoMLsjQOUwcJadrZAhy6JF1L3A4BMDGFcfc+ergIaEGZZAACNyFWN
         jqdUPmwMdMgKOU1GB1wsPLzKcStFUwpw+4xxduHjX5vk/6hIdy5ijH/WtCvIpn1Sppbm
         Nqi9REUSr2Dzks4k7Ud3BecijFvAiPTsdpWJ54hpKbR+R+rbPk+DyprklCWDf5phYWUl
         u3DwNQ1q5VMR/2zICHGeX1WNUAzA8fWP96dW4wyqNjvBACYptK4rj3UtO32Q120IolNG
         ZUST3UeHDvWPuMO1jQzO1VBKLk0LA2EOq7MxKamZerDlx+EG5OFf8ppq41Ekb5n6L4cD
         l8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142885; x=1761747685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmNUOtQ4rCh+WJGfL6eSc2bLlTQ62NRBrul2RcvmvE8=;
        b=P2wWyoZQ3ZD8QDKzz2DcspcMkxadYHnpxO6tp8bEAwoY7ORVidL9AfQEXBUCZB+YYX
         RgCpo5EorZxpO7Bm3cs+uDwZNLT6YsoszVQF1T/U7vnxtbWxd6j8Rx5U+56ezUIw78W0
         xEo2sHcTYsU70ZhSNIS5y4mpw9EKDDo2cykTdy5M0ITECSIQSqSP/4vCd0NA4wUwQAsP
         am/hcwNWmZ2WjMod4Ltl6J0jDu0XdH1wngOIKSJ0HrHW1QXuIV/x4WyIUyyR4qH3m5R3
         cOnskV1Aty7Ub3aKSd/5R60trL/yZ0gVDsP7SPeWnCC0D13Ga0a7v2ao+g8UasW99nS2
         Fsyg==
X-Forwarded-Encrypted: i=1; AJvYcCVDhfGz9WK0ZsmghHd2p9Xya4JbaYCrNP1cUJDPFcmcI33nnzGpIfQlvaBwFE1CfwqOOPPU/gvUhkUbNTiK@lists.linux.dev
X-Gm-Message-State: AOJu0YypLdKfyMKbC/vbV5r/f6JGrl7G0hfBhJ22BWP6HfNtAjZQXfOU
	Dr9uKO0dzhrxkPPqjroZplKal9m/5s6xVXjZlq3UJZpthECXsQeY3jlZ
X-Gm-Gg: ASbGncuK4+a5DRa+oDwsxNelaE0ftYirx+tRBEYUjugTBCARF3CcK0wM6PLZRsl/MbK
	+lfUyoIMxSt3NwqS4OjaoTVX4ajL1/93TDo6fXpnivp4zDMCFUwRpQ7SS5WgGdKmDQoz4NAJ2pL
	cYGQrvxktgMXy9pL+raOXayLAuMCoRLWMdA1ZWUm7Xo24/koHKMgJRuQo6ir3sJkyHDeAB9vwUi
	VHBgBgsUu26155cCxK16LvkvG92a2or422JyABRA/h/I/hCKN4HGaKFNNWmc4bVsu8AyY9ZM1ry
	u77AjEpaPPH0rrZYU+G/a8fIwxAa4qan4a5jMQFeehmKIApq/2rEKN6L0qAMX16TiCjc76NSXtZ
	Swy7IGcrE1YX9x9DX2tTlYUygH/mgPb2MX+g9DIM3+BSlLXrPgIf//5mb7XlHjviZoY53TU2x30
	nmFg==
X-Google-Smtp-Source: AGHT+IF+iyqQFlhVTLmCvQbpLS2aVQnxyzk3d0rKY7VNU8mSqFCV/6A3jAne2kQV8+YJl7PYL/naDA==
X-Received: by 2002:a5d:5f48:0:b0:426:ff2f:9c15 with SMTP id ffacd0b85a97d-42704d83d04mr16164305f8f.5.1761142884403;
        Wed, 22 Oct 2025 07:21:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 01/23] clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
Date: Wed, 22 Oct 2025 17:20:29 +0300
Message-ID: <20251022142051.70400-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSUS clock is a clock gate for the output clock signal primarily
sourced from the VI_SENSOR clock. This clock signal is used as an input
MCLK clock for cameras.

Unlike later Tegra SoCs, the Tegra 20 can change its CSUS parent, which is
why csus_mux is added in a similar way to how CDEV1 and CDEV2 are handled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra114.c |  7 ++++++-
 drivers/clk/tegra/clk-tegra20.c  | 20 +++++++++++++-------
 drivers/clk/tegra/clk-tegra30.c  |  7 ++++++-
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 186b0b81c1ec..00282b0d3763 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -691,7 +691,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_tsec] = { .dt_id = TEGRA114_CLK_TSEC, .present = true },
 	[tegra_clk_xusb_host] = { .dt_id = TEGRA114_CLK_XUSB_HOST, .present = true },
 	[tegra_clk_msenc] = { .dt_id = TEGRA114_CLK_MSENC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA114_CLK_CSUS, .present = true },
 	[tegra_clk_mselect] = { .dt_id = TEGRA114_CLK_MSELECT, .present = true },
 	[tegra_clk_tsensor] = { .dt_id = TEGRA114_CLK_TSENSOR, .present = true },
 	[tegra_clk_i2s3] = { .dt_id = TEGRA114_CLK_I2S3, .present = true },
@@ -1047,6 +1046,12 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA114_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA114_CLK_CSUS] = clk;
+
 	/* emc mux */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..d8d5afeb6f9b 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -530,7 +530,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA20_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA20_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA20_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA20_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA20_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA20_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA20_CLK_BSEV, .present = true },
@@ -834,6 +833,12 @@ static void __init tegra20_periph_clk_init(void)
 				    clk_base, 0, 93, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_CDEV2] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "csus_mux", 0,
+					     clk_base, 0, TEGRA20_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA20_CLK_CSUS] = clk;
+
 	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
 		data = &tegra_periph_clk_list[i];
 		clk = tegra_clk_register_periph_data(clk_base, data);
@@ -1093,14 +1098,15 @@ static struct clk *tegra20_clk_src_onecell_get(struct of_phandle_args *clkspec,
 	hw = __clk_get_hw(clk);
 
 	/*
-	 * Tegra20 CDEV1 and CDEV2 clocks are a bit special case, their parent
-	 * clock is created by the pinctrl driver. It is possible for clk user
-	 * to request these clocks before pinctrl driver got probed and hence
-	 * user will get an orphaned clock. That might be undesirable because
-	 * user may expect parent clock to be enabled by the child.
+	 * Tegra20 CDEV1, CDEV2 and CSUS clocks are a bit special case, their
+	 * parent clock is created by the pinctrl driver. It is possible for
+	 * clk user to request these clocks before pinctrl driver got probed
+	 * and hence user will get an orphaned clock. That might be undesirable
+	 * because user may expect parent clock to be enabled by the child.
 	 */
 	if (clkspec->args[0] == TEGRA20_CLK_CDEV1 ||
-	    clkspec->args[0] == TEGRA20_CLK_CDEV2) {
+	    clkspec->args[0] == TEGRA20_CLK_CDEV2 ||
+	    clkspec->args[0] == TEGRA20_CLK_CSUS) {
 		parent_hw = clk_hw_get_parent(hw);
 		if (!parent_hw)
 			return ERR_PTR(-EPROBE_DEFER);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 82a8cb9545eb..ca367184e185 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -779,7 +779,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA30_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA30_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA30_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA30_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA30_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA30_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA30_CLK_BSEV, .present = true },
@@ -1008,6 +1007,12 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA30_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA30_CLK_CSUS] = clk;
+
 	/* pcie */
 	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
 				    70, periph_clk_enb_refcnt);
-- 
2.48.1

