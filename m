Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1788F2E0922
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813439; cv=none; b=EkOUfHiMFAjI1i1YXqdhkO92+8Y7FE0XXvbHJJMs9VuOr7qdMo4A/sj06OgdUxjnbZYrZAfrhWCwLB58zPAm7Chm6bQX2uai5JG2ORU+FdcfA0TZ9iE+Vubsd52eibrLG+dEYBMayIY6RLaadkzMGLzshhTwmI2ix5oKGBYjRmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813439; c=relaxed/simple;
	bh=7dAHRT2r7ftPVN1rS5b3fLL9XXBwlAPnHlEMfM9TlgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtcBZbD1ZUzM00OkhlS2DTHf4TuMGIbO5QZA98YCrsUwpECRLtvtCbwwmvccz/Hn/CpaH+wejIyvsnhqN+YoV973jQ5v4crEyrcoAvLPEbXMbqVpDX+Xg63m8YbcMqioUjSGMYdLGXeg1vzhtrBvHWb0sfhVSkk9iOkbJL5UdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZwA3M9b; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZwA3M9b"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso3061166e87.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813435; x=1759418235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=OZwA3M9buKpGvUN4a985CLpNfYXl5INX7TtCu6MCd4JcWxKPc8igXWEvUDWgEZt+Zt
         c1I5gvV2u9Dfsp1C1v2P4k89xjay929NnVbBHUajqdUy+FfEjGas3nw5rUgekxfhNjJf
         of0G6FO/omujniYdwErPrYE/TESHa1XU6nQ+8ePZT9kZbqM7zJ1IY19TMowEXPqyAdgj
         T27C4LOPTLN+f0wpLifkZGkvpJ9YEcWarO5uS5BHii2333R7/kJuwzuSYQ7/VXkBVRds
         h1XNFSXxt5YwgoBi+aXwV/gUXNYLeB/PZ8NDNkhDLjBEFEnVeD5+w4PZj+UKhN+cea+5
         2OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813435; x=1759418235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=p+qTlPJuXarhoXzNWNSyNRjsLv9Pds1Ov5S2SyvU6nl2ioYyyZhhfqzsIUx33eA5Iw
         oeV82RMacUo17XZOD0/cuH/UBrbZKgATpKtGMPS9rPz3cim1+7fvm6cbLD/JtGDJoDWg
         tInrkW+9kdIBx5R9/Wx1BAGEHMQeGDdgbkMDG5ijl8DrsowcRfEtbTC3zH9DvXnHDpqk
         fg6JvIqV4zAflGjH9z/R+pDfbPSw47pqStjBXIUPIaq4aLtF7P4VrnCgtSw++wrFXh94
         BaGyitZSIrfbGzwSAp2d/6aLrea2A4fRXSH/2pnn4D4cm5JOT85giy5ZOoOB3PHaXGQG
         yolw==
X-Forwarded-Encrypted: i=1; AJvYcCVkScRzixJwDNS/O4tfewloCkbqWVdMtdCAtSc9AGq/V5b1XToLq+twC7Vqv/6VHQh1hz8Yl41ljxMZwI6M@lists.linux.dev
X-Gm-Message-State: AOJu0Yza98td15gT1l2LpBaCYNb+/wsbndYxgQBO7WcIzXImXQt0d/A4
	liRPxyd0RRW7sb/v2N/McauObC5Y5TgxoFWB1LN2hZB3eWEQTAVuuCUj
X-Gm-Gg: ASbGnctXNf+6ab5KlPT3KNjc8VWWb2+v752RhRhKu68Qi3JFfvmrfBJ6zcOIs+Y/kZL
	XZ6wz2f4GDsvEWe5DHONm1t51ZR6B6plrLYf0p1sinsQCLB+bLtmbO23uN38j4jlpoRFUtBPx2T
	4i4cZNwd4cnpAs1Ytp/AcR2Z1m7dxQ8VVuUtmBzwVJHOZ+or7CMUh0giN61Pg/0LbntEa6UNcID
	bj6mcAme4g5U5ynkTOo1k4R47x+ZDbMyC7bAMcMi57BXhOpWPfDois9TkfhZHcvFFP4yyCpf4E5
	FgNddcC55r/qNDX1skht1JmeyKp/D9udlNYooDwyMqPrRZ6XuclAKv2mizyTchKsq0ZHg2SQ8jB
	SAibeYzgjijYO97wM93mGGXBO
X-Google-Smtp-Source: AGHT+IEZhoVTWc3JU2yVQQC2NvFxzQUmxQf+nrYtPw/ltnEPLZ7YBlNqTjchqSYHU9qwgFPB+3ThRA==
X-Received: by 2002:a05:6512:10d4:b0:57e:2f8e:5f0c with SMTP id 2adb3069b0e04-58306406032mr1045775e87.15.1758813434918;
        Thu, 25 Sep 2025 08:17:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 02/22] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Thu, 25 Sep 2025 18:16:28 +0300
Message-ID: <20250925151648.79510-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
clk-tegra30 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/tegra/clk-tegra30.c         | 1 +
 include/dt-bindings/clock/tegra30-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca367184e185..ca738bc64615 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -53,6 +53,7 @@
 #define SYSTEM_CLK_RATE 0x030
 
 #define TEGRA30_CLK_PERIPH_BANKS	5
+#define TEGRA30_CLK_CLK_MAX		311
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC 0x8c
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..763b81f80908 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,7 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1

