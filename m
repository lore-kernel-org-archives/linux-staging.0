Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19FD2F25F4
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908681; cv=none; b=uON0MGnuW3SrP1QcxEBcJOzft3VwYGMzoB0Need3J297xM6s1LXrkKOsZ36AQqPvSajHQE3b6rZSloc49dXO+fMbqdGmppFh1g4puZ3zQDA2qt1krfgzIA5XV6b+iVdY5oV4HXWbX+ZZpUO14vC5K30mn/xH+IziJpsHa6VS2JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908681; c=relaxed/simple;
	bh=0GRT6eQI3Cm8XV8zCUtY3dryPx2rZvFnN6HHzwrp62I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vveto3bOFrni9A4ssVuJQKp0u8qJUUnTIcnVyxDiZ3XeNjlo6ikwOiTfRP5jWPlubG9CrQjfIQuctGnghNRD94V/rTlpudsW9KtgudFo+1qtgSrTAOqvfHbJ/7EQlh7p5RSfvT6cZXf4QNhRgGqyQMss6DIOuRJXPvQ1xm0cnVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdrnGDnB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdrnGDnB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5906665139cso1801268e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908677; x=1760513477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQLFTxrIKtieldvIvL7WZTPqw42YlDTw8nNSn3fA0Wk=;
        b=BdrnGDnBLt3T9J8S5YbaCKHVhWlym3Na7BwkObO5cL8b+VygynHZPc+SilsfiCyza1
         8z0pXoTIX1yUhyBeIn3QrT5LeuPmn/LTEdVUL5Ql92Wp9o3RHAUXywbfi9GFlo8JQNue
         nGZquacnrb1RZ2RrWBxpkIUCuuR9bYO1Qjyr4j31/f0VcEidA+w6IcaZPa4hWhkEY02x
         fNtRqH0EtNnUMx4PrN55IHK1QMrxrmU1IJXwobqrG5Ktcuj7IHF8NfbEpRx0EljHcRwy
         2X3g0otx7h1C23HLxNJlWWXMfW5bay0HrSyjVD+3PbCwQrj837YDAlyphfvKbNcWasZc
         kLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908677; x=1760513477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQLFTxrIKtieldvIvL7WZTPqw42YlDTw8nNSn3fA0Wk=;
        b=R1HPym1WIo2JzH6i90WYCo1qvNfFAX54ok1AAkjvgOk+F1A7SJ101x5T+5MQ1nZFvA
         O9mfgnLllBAFOmiY9uHNpBMd2eu/NbHkTKJaZWT84Beb52SyGgX3ZIfNrobKt0FqnW8Z
         rcAxHIx4Vmtrx8+EZROjAoSVb6P3BH8/9pkjOpq5GaW6Ww1srWYCcScMLCwGqz/a8YIW
         /5OZhZADd5yTdf+qo5GD18rTBDOSH51AOSoQHUEICoNBFsdyGyawVuFfnGxXIOCBNLeD
         5ix19wXLbX94NSL8zj4+J/PMUqLarwVSBC2NMarkvyMGAICE44Y5BbMEVOgxNiZDaAI8
         elnw==
X-Forwarded-Encrypted: i=1; AJvYcCUK008R31qGM1+c1gzQbDsUk0ouEtJef5ukaCbbJtExLphvP4PTxqwaqcxi+9EUI3CZ669HgptKWmQz/6yv@lists.linux.dev
X-Gm-Message-State: AOJu0YwyoWW/q82PBzj1wIq0SnoQXavFPBrlbQPitYmYXavqROuzLDLY
	wob8/kF3CTCwVWoTyn1brJu4BBhfnQdhvG+GdSmaZrGgnRT2rolJ2yms
X-Gm-Gg: ASbGncuLwz+aVFveTrnmsan1gen2yr7h7ZEZpTIFusxqNKw/KLhYwk0FVzgVyACEzMY
	bygavaSTUNYHx2wp3F92C1P7ilwr6FaY/Mco79iOLd/wP2f3Cu9bd/HlJCmg7ExantTlq0jmFnL
	0fm6mtPgi5OMqajofmiQVhtp+zwstkMAOgtr6bOE/Wj18LSEbzniOBfOPXp9CyUKJXUzqWV0A2b
	QODj8hQLqgwYiQOxqJiACgSqZYo1Siw+1pcITUBgtSlPmVVPokvU37MpXAdIFZPmtnhrACtFf/T
	ScsGxFGRUl17H7pGX1hS2ZJM0PXnIgH/h0hOc4BG3F+nZwYi5HE5jJzzGXpB8zlKa5eSinhu1TF
	edwAcvqb3ftHcW4bhzlbMjOA86ktxBKsbWD2E4g==
X-Google-Smtp-Source: AGHT+IFpUSCjmqWlypk1jhB6DNeYarmmHYoM2rml86MGPw0PJqxvr54S+GMFfAgFpZaGYlwixjWo/A==
X-Received: by 2002:a05:6512:3045:b0:577:6e42:3718 with SMTP id 2adb3069b0e04-5906db0365bmr662412e87.7.1759908676756;
        Wed, 08 Oct 2025 00:31:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:16 -0700 (PDT)
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 02/24] clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
Date: Wed,  8 Oct 2025 10:30:24 +0300
Message-ID: <20251008073046.23231-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

