Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C12833A026
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605806; cv=none; b=FVbQh4U+AFLDbrz9E+XuO8RnP7PSD/a+WRF5uRFmncHZ8T2xPHH3+MUhRNeGUbgYZStJPFJKrxQiWjJy4zkiZVBWZtjb6VjNYvn0NJn326L1ymhAvCE6q4cezesA7K0Rb+N04ZpuJX+6GV1SM83z2SnAWFT/Wc0pdmGRrwMzq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605806; c=relaxed/simple;
	bh=jCks2FO351KgLe/fBb6hVWkS78U7RfPD0J2SavjybMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNYQPDAiDw0BOVzSbnQF4gBa6BCy0WSwMhsq3/vO8RmllBTekLs5OKZDxp5CLFprsPxpaQ+Sc3H59cYZlPC+7Pby6mGfmmzNg5gI3VoNpVCntGQVYKjKWA7klO9k488UBCZK7Vclct16dCQfb5nH7Z1xCOyHSFIcerKrAXvCtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdP1krpN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdP1krpN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78f5df4so858910466b.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605803; x=1756210603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/oKOTJz58St1gTwh/bBKNgiqYHP+xMc0H1/D5ORgpY=;
        b=kdP1krpNksr801VNqWy71W5Jw4wPpZmiaiHP87SLDGYfe+AxmkkWO7ncS9EDfLKbBP
         +NX+yzmzvYEQ4BF49K1OjxlRSrAokLpYttYAxgK7nJ0pC/su3tmpdhJBF4vK7VYyHBLu
         sB6Rozvab5teJudtDEMI4HvSkzHBRB7jyzXApPfu6cNbK75tl84mX9CAm5saZEZAM3Oy
         yMDE3oVl/e+fC0THaPPM83GcXk4ajyBlSmpJWZmPFeBMkrEqPZZjdoM8okxcopV7cRQC
         IIreiVWR0I1ULuWw2R5tppYzZhLe31uP5DehITXxJiiviKvF1TQTXZc8hxJfmI0BMT/C
         CnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605803; x=1756210603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/oKOTJz58St1gTwh/bBKNgiqYHP+xMc0H1/D5ORgpY=;
        b=qIeYzWcq/oF3IsJSQbtg5Qtf76uQtzaZ2aNuvfz7lHVNYWYf171N1qacz4LYCeqiIN
         M1gvRkfrc+phEW9H6b3P3VThB3YQ+U+cWklzdG/2ymzQrdnGIZMYsczn7DGbSjZdbf2L
         qr09rVsdn/ehkVK8/6kRY9ju9B3Ni09Q3l6I6Fbuw5VYey2ILj4vZ1iCQTK/UNYyb3yu
         zTwyg2tYImI7YFc2KjmGSzG3YQCqToVOieq2OhK1Gbi197BEwbQdZjiQNdOgp/xOibPj
         hMmKM1zZNUu5bEtEZ+x2OJKwW2TNUH8VoHDJhWljiYgOPoR/RYRp2MuaoiE7jJz4QIcq
         Sg+A==
X-Forwarded-Encrypted: i=1; AJvYcCV45wJW6a0Iqeo3RDSgFZJ5eNY4urkEo+t0+EySR08lxw78B0DiFPCWY6F+F6yAVU++DqC/3KmdQXidgk2p@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9VivNTm9ftQ8U2cQsr/O0hUjLUP4KsJLc1hhUTDOleqcK5Hrp
	sh6x4PE/vnpAymDjlJlcWZZlJ1YYZqX0n7M+xP3O/DaHenV6h3yQbB7j
X-Gm-Gg: ASbGncuYOuHKmQ2oR7sfMhJKkemw7uZysW69AwpXwPWtFL+gnyr0OGTkB1WHliq/ga+
	Gv3cRxuLf/FGO+ZLajs3qukXnTCVbaisgCv1JJZNKko9LBEeoogzPwnuH3qeKknXneNVaCJThfP
	MQgOy+EvJQ08uVX+H/L2GVAJ44C4zMQFn9UJwq2/6Tt/ZhBXWlryIABAoZKI89tuj/fmV9jtVCv
	OtWAbi8ZzgRrc41MXLJCQ04qQYe+S6Ba7iEiJk7DdQDEfszqlGP/o3PF0vBCsc3gQ6k2I3iZIk6
	58a89f5Z1PCDb9gd81INoP2QQRNdbJkXVxUC5jQb9VHURmoPKjbOyA1zVoMHlf/uWH8TPnL9zo7
	on0UlLku5gWbC6w==
X-Google-Smtp-Source: AGHT+IH6gI4Wt9MTamNQRuZI3BgyK+3myche9xoYOBrZQHy1Q90e/zgSuCy2a+6/nFauZvLKfIttEw==
X-Received: by 2002:a17:907:6d27:b0:af9:71fc:726 with SMTP id a640c23a62f3a-afddcbad953mr235796566b.17.1755605803433;
        Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:13 +0300
Message-ID: <20250819121631.84280-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CSUS clock is required to be enabled on camera device configuration or
else camera module refuses to initiate properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 1 +
 drivers/clk/tegra/clk-tegra30.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 551ef0cf0c9a..42f8150c6110 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
 	/* must be the last entry */
 	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 82a8cb9545eb..70e85e2949e0 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
 	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.48.1

