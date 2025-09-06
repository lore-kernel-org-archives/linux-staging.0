Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876D32F2917
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166849; cv=none; b=M2IBROC9grhuMfW9u0E0LnkkvLhwPCqby2oEFG+3u4phyjmpZbqhpeHSDIawv2sBZsO7NcPFrT/URT8FekmgZyaQM6QtAIjfHi2yubvfrsb91KYKnAC7r2it3pA+rlkukmfFE4Vxhadx3mXxS8mRw9/PZmdMSvzsC413sWc3Zo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166849; c=relaxed/simple;
	bh=DTVJGgUVK8J/aDUZywIXHZ83XRXlyCGjDKvYC741knE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkVsv4m+aNw7trhrJ2AhbUVU2zyws7XRovYvUqAyi+/O1xtsd4+Sx4ydFkUDeIn6X8zHdPQHv6zHBQaa5FD+OxacBeKdVUGFz3iVD0lN0Tkg/1DVphTdaprDzGn4R6l5zUtWfRd4k+gTX009eUfqtFMf4smVyzLdim5/Q7f8p1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrx7Vsvx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrx7Vsvx"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso2848601e87.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166845; x=1757771645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wmFPnjEOhtHe75Vr1hkySKhaOYSvurifERbXhZkjEA=;
        b=mrx7Vsvx/Jq/ibtxuBxAVProcQjHC9MeCKvsQ9D0fFcT1sW9a30rXo82IkN4gvCH8m
         6LeNDULceuNOUtk3W1S7IojjTBn+TvI2qLSW52UbkYa6RG39ybHAVYCQAV9gkcUXzsP8
         QmjBSQC4X4ZE5OYRd2CDb3pSXvcnZR9Ba0mRg+LAjr1hkDEfYMYKbioWtz2gnT7RtXBG
         5wk+ovJeW7jKPvlWds2DS5Rr+3oyaHIgf+fWeeuLBXGGN6DDKBzXdX+f4P9u7cN//CuQ
         l6Sf4UnMrPU7SljAr+9WjZx+50BU9hFA98zp1n6ECV+7/Eho8neO9JQbHJtk+bpTwO1r
         qxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166845; x=1757771645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wmFPnjEOhtHe75Vr1hkySKhaOYSvurifERbXhZkjEA=;
        b=eZEf+/JFvRxB0MCEfSaYsTEpIMkgDilajRvFPEXF13k9+BWMd/nJRadMAheQoj3SIG
         FAyj4LnX57+Cy0squV8gaYYY1kRVet8CJgXdMsk+DMEqgfaUIg6duQ/vzrrlLiosxc9j
         uphDPRjCg7iZ9AGYpAJZShXtSussOkYmnpxUx1N2gpYUbABkc4H5cdkx2Gf95BjL5v7M
         0TKghK6dK/Nqkfo140z8VPGtyr4itpKulJFUxD4Vh/X6c8wFRcbTD8Cq5nBk/X3JyATG
         H5NVyeZvnYpnOKMcrwaphyIlB0MNesCg7d5ph0FJRBqOwqnLG5QUDCdq94+Z3hxAt6nz
         N5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUK/5Gw9p8JSTESUMrZfVnKle74PVn5yOBw9Rr9dARIw7gpl+bXVbnQZbqqu2lsB1GV25NtuICj9NdsimJe@lists.linux.dev
X-Gm-Message-State: AOJu0YwZyoUKGLHHJTyKplRQrtpwu4gRLiVulkL1eUuYxIpfPR7CxOAB
	4R0Ng/X3WjbnwggUBpe+IDHlBnnQB3ab9v6nmPgKpMhxxdWXb5PMw+zx
X-Gm-Gg: ASbGnctvWz1wK69uBnIwJzq917ZthOFGVK3fAhDm8fSpqMHlP/8kr2LANfiztFgpIF/
	4F2rd+DI4wM5FoiZ4G58Iztkuug1O4BUTKY3HZsi9yd69/sYNNGQh+ZEXBUYsEzXiAXtsFLVU2X
	tKIqHNICAGutyMpVn2ppJePptFoH2gjXQlrCENA/tT1qDobxNO8rovV40f8YJ06PXkB/zmMlp5a
	DBRuk6N1vAY2BYnk50aNSP7iEvBcjnm5T7tctEwOoDjzBkJlaIWjaUZwg9vDZLMxqEq4Ul89s0j
	Fhm7RTEvHbrGWiVrlgR/ut7CbZnh0riG6q0u0fsyTAXLC5NNAtoHx69D0PFO2zK1kOs0/f4G/Rv
	uAs6uKUGGfhuavVj41f0wrJH1
X-Google-Smtp-Source: AGHT+IF1oIuD7hAEOhucs7ujWwrMDLFuXJtRrwVwRJHgHcWW0EsIpJZ1uQrHmNQzYSIeaL4YgL0RTA==
X-Received: by 2002:ac2:5687:0:b0:55f:4ac2:a5a8 with SMTP id 2adb3069b0e04-5625fbf0b05mr589085e87.13.1757166845287;
        Sat, 06 Sep 2025 06:54:05 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:04 -0700 (PDT)
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Sat,  6 Sep 2025 16:53:23 +0300
Message-ID: <20250906135345.241229-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

