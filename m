Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3AF34C807
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142892; cv=none; b=E0xfhWbjIcLUu96put0R9wiPkDUQwA1RQxi+AVRnPaf2Afp1A4PmbZfSv1bi9oJ7BJSRBKyXdghmpn6qDHScxz5lAnqLoPNiJF6TaoOqCwzkVMY+8thK/aDl0YAIOHWjQpwExaeEGA6j24877aA4jTsyOL8uE38GFZ0XlZazGGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142892; c=relaxed/simple;
	bh=7dAHRT2r7ftPVN1rS5b3fLL9XXBwlAPnHlEMfM9TlgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InkRa+numYwzgkyHHFw6IRWo6L+PVjq2KLE7MDrW483n831ktyp2XlMBOuFnJzV3sKON5FUiA18ZQGAL0HF0DL7zn9UetBGqvXKRYLykZmAxve2hgsRR3bQ6ziOBiC/Qr1QHNFosYK55gMpPNfOPURphLDIiRk1GYxQTOU7+M2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gmjd4LNR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gmjd4LNR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso6524961f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142886; x=1761747686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=Gmjd4LNR8zwLUgEBPy06FMs5P0aAix0g3BaL5T5DhpMhZpkIjf6fd+4WACIrO7+ui1
         zdgz/DxugZpRm7AROVLkrrozL7mRQYCTac5B+rUGZRt4pssNnhSXiAqJTDF/USdomSE4
         43Nfd/c9ZoI/HwhCPeucXDtDlbtqxo56c7t35B5yBAQZLnSjFD+Szp+pss7xz2L5FGZc
         0+U9eGbtSpbzoA1simafRvyyrXny26H6FYXlzjoI/bWT0se7vXOePNKCx3vrWY7jmFfy
         vMEzQiuLvGh4ovOh8AWCKCqYtZeSRmTN/x6QL1pCFv57LEcEzsTaVm0zaO+jgCQ1JGDr
         sPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142886; x=1761747686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=ByqMQ9AxSQNkxQail3xcJF8mgBQFPBgdKxzw2a8SwmxnT04cQRFzFlTUAMtF1EAOqG
         a8hZd1O2Nbnr9n7V5PLe9EZsdQVk0heMbafp84tHYJ75JOcuIKOv2shgN1Oo+0N/vJIM
         mpPEknqozwSj1e66gfhmTVE+rTwyf4EAfbETjrexbXSaabZR+Jwl0bV2K1L5mNlJzw/G
         ufVg5rR1uxEW1z1l1S58fh6c4oKRVb0zEpdb5DjzPh+RN64W2Aq4iFx9PsvA7xZhtF8u
         lhnJ8/oeFnaFUikQjiSt2cpq+g4Mil5eM/EblDhJYOSkFhPsFyMVeSrIjKu3UVcR/1AH
         r7IA==
X-Forwarded-Encrypted: i=1; AJvYcCVlb8wisWlCXTnibnRYhQs22W9hBJsN8ESB9xYnVRRrQGOGXQzU3HTQXixP7CWCXRWUQIqt2F6+9UYgXHNz@lists.linux.dev
X-Gm-Message-State: AOJu0YwBfqLGbPUby9gS2D9u5YLXet4mWCgJfLQDrIKbkntzx9x46AKn
	AF9XlyIf8cW3Dlfz7QPg70xgaUov8s9ZnRTBo1ILzw3E4XvkUCdIYdhV
X-Gm-Gg: ASbGnct8PgcPC5koK1+6sItmXAXbgiaDNPijxCFvkG1n+l+4Bf4FLIks6CZUnB2GUPD
	hM5ahxC/ECb765P/vwuuR7DuGKzzi0WmysemfKiZJTvVoEY70OVckMtxc9M0UYkkkdx3XipH3/8
	ZUbXld198pj5nJSVEHitmW5Md4az/K8ykZ1gTk21oNmpvV5VoQAD7KcJeZGH9jxOUqOguehvQfL
	vnnMFImcndTA3Nj507fgzut4eaHe2ynN5ERDTFsFyAxDq6IBoytZaU5Twqxxk/I9ac/iPbnOz09
	QqT6tg9OCw1QEAjMGvM2PT2kxZL/sLIjIBE/oI/qrNGIVJKQyq2628nOcpRk44JOtI/8iTJHBBj
	2xt6ZkVuJr43FjTfj+fL6fqFCthZzAGneHqtVQAJeTrzeHMnSIMTWSEp8CryqMXZ3yggt01fArB
	MWWQ==
X-Google-Smtp-Source: AGHT+IFCY+Sxhr527k6+OJwXsM0mYpA87pB8vo+egXovwmlWxMOKiHZRGcuNGUJAN41+XF6ergNZUg==
X-Received: by 2002:a05:6000:3113:b0:427:7ec:ea41 with SMTP id ffacd0b85a97d-42707ecea7bmr13107185f8f.57.1761142886167;
        Wed, 22 Oct 2025 07:21:26 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:25 -0700 (PDT)
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
Subject: [PATCH v5 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Wed, 22 Oct 2025 17:20:30 +0300
Message-ID: <20251022142051.70400-3-clamor95@gmail.com>
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

