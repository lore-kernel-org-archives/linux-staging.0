Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF732C0260
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908679; cv=none; b=TxxtTHWhSBQLLmw3gMIAIMcWX0UEisJm276LHdYAPT3/B6EjVIYRmZY+ygTy/BqI6K/QSIubVix8q4Eh3xI6QXiYb//tH1theRdP5t5h7Gv36LS7K6S1YgcRbqwkOhEyThhkJRRbpZs4OkKddQVkxYJAdcAMuXZoMEiHl4Lq/fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908679; c=relaxed/simple;
	bh=Xtlv0T4/g1zHgGtcSEMBQYBsYKA6gFss+0qpYkk7s1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkM5mob5M2Pfo37JbZ7D8lytOAGBlL1mgw6sjNea8hqXZXGdFNkaw6/Gaw4ppXzQqKLJ1TQEf5SpbzVbwpHbO+TUJADmHl3rxzjYFqc01v3l1IiF8hTsbK9AmN1FDYTm2rINIz7ElgRfn+tReA2s+4AJTb7FeK9zwwZGcnl5KwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThsOsPJb; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThsOsPJb"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57a59124323so2274590e87.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908675; x=1760513475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
        b=ThsOsPJb3qD39qxTAKv0hMgLjg8bo7KtkvIuUQwnsIHpfoqZnk7htxHLZs5hb3mAvw
         6r2bX0Y6qstPAF8uvdwRzam3AxtySQ96wFeWIK0Os2IELj6b4XAv/oWArHI6GwWqURzc
         3eQ5R1t+iybCr1t3Be4kQVLpF0glUTpXY1Ps9zatCNJqB8JdgUSx9WiQNbFAI63eRot7
         MARAB0NMscO+uWYbaFjrDdfGr1q478o8//ZwZhdXttuq8hNLHD7YeqtivdWrS0qXz33W
         zRcnbl6oaTdHVoFEFkvr/vZAIzQ4lHyRr4Eqxw3+twN8OGVr5usE5LSBrNphxAVJ9zZF
         t8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908675; x=1760513475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
        b=YmvBqZspUxmCJGWxHhsuYFY2qcTLRw5z8gH631t2ooQxKfADXDDKv4zMIlb8cbFqT8
         PPkYbvnoNz+Yi2YbEzxxzwD+arOXCaMocHWTKYfkQRdvrn+gA8E+YoO2ThuR6tslOnQK
         slXs8P5yQ+m1WhDAj7g39NzkjPsU7ysu2ROjxiDgJbMCS7TcWZHo1SkSe4Lft2qyj+50
         179BdutXhAd5ZrhZTJReLsWeAVbdZvrNbu7y0/pWT4rwR40sDPpRThZk+BIj6PL3rcoz
         t6TS7TtgNv/fQ/BL9errf+sqzAGJ1qaBIpyxhp7MLrwdJWTytuL1wTqxqoFlWlHLk1m/
         ioYg==
X-Forwarded-Encrypted: i=1; AJvYcCVVkJE3M1M3f8h0E4JZpg5KVlhrUhzuogN0T7TGxYFxXtS1vY9x6Pm8AktiDlifta9fFNm2b5iuR9QyLXkp@lists.linux.dev
X-Gm-Message-State: AOJu0YzbnftGDFMCU9XscjTsZOWM/CDofq/r9w+u6e6KTPow5DCoVQa6
	YaaQbIIC8SaQCdlH6O0fHZvSlDX9ilN581kNN2s9eZldOJP+4RMcmkkY
X-Gm-Gg: ASbGncuJPh4QivC+RsTm9+e17OrPGRPNRnUY+QNuId/DG+vCXtALsOTIPsZfURhBg58
	NtWtyh/17/XkOExdyaxChSrYDY/GO4Z8or3S8jc2QsU/aoaM21RKcJMda1g4HPr8M5Vl1KVcQCk
	lCZggnu4tKw5dPY+7RAriibraGKz5+Jcu1fGuJA5mhvFLVFHJy8bKBL2IOzVCi/8ahU+dk6sWN3
	c/MndEHXaUgC8AfbKzTBCvaOX1R/uiNKRiAFb36nFyvtspyaoSq85jF53HF3cOzbrFOUQdZDniL
	Oc7vhBUwgzMNpCz5AGB0iFEnT7tQiTAkxVf57gHPQjwtzTOcUplXLdJAwzA2fmL2XhLvrEpBDL8
	YA5Hl14xycJ8W2ABw4clEBMIrBSE9OGiKd7ZSoA==
X-Google-Smtp-Source: AGHT+IH4w5wUowLiJI7hgdEtUtkCn/YDDLljjRvew5jTKIWe64MrO+dc17yhYkOKlcC57NaNakIcLQ==
X-Received: by 2002:a05:6512:4028:b0:57d:b8a1:832b with SMTP id 2adb3069b0e04-5906d89edbdmr712455e87.24.1759908675110;
        Wed, 08 Oct 2025 00:31:15 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:14 -0700 (PDT)
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
Subject: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
Date: Wed,  8 Oct 2025 10:30:23 +0300
Message-ID: <20251008073046.23231-2-clamor95@gmail.com>
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

Add csus_mux for further use as the csus clock parent, similar to how the
cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev parent
name lists to resolve checkpatch warnings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra20.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 737fc2000f66..1a1758fd7def 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2222,14 +2222,18 @@ static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.drvtype_in_mux = false,
 };
 
-static const char *cdev1_parents[] = {
+static const char * const cdev1_parents[] = {
 	"dev1_osc_div", "pll_a_out0", "pll_m_out1", "audio",
 };
 
-static const char *cdev2_parents[] = {
+static const char * const cdev2_parents[] = {
 	"dev2_osc_div", "hclk", "pclk", "pll_p_out4",
 };
 
+static const char * const csus_parents[] = {
+	"pll_c_out1", "pll_p_out2", "pll_p_out3", "vi_sensor",
+};
+
 static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 {
 	struct tegra_pmx *pmx = platform_get_drvdata(pdev);
@@ -2239,6 +2243,9 @@ static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 
 	clk_register_mux(NULL, "cdev2_mux", cdev2_parents, 4, 0,
 			 pmx->regs[1] + 0x8, 4, 2, CLK_MUX_READ_ONLY, NULL);
+
+	clk_register_mux(NULL, "csus_mux", csus_parents, 4, 0,
+			 pmx->regs[1] + 0x8, 6, 2, CLK_MUX_READ_ONLY, NULL);
 }
 
 static int tegra20_pinctrl_probe(struct platform_device *pdev)
-- 
2.48.1

