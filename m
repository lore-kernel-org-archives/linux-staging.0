Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D32FE042
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166864; cv=none; b=ABDORyWHDVrI41zjvS2xGwh/uhMxg4+PxnVB7h42oKN6bYusleTC57b9S9QwMbeVKUSKam/lYe0snfcy0T9rlOsBkwrRFd/aNPJP4VsAk/Gw2rlgu3B8u2qtCyG95rEl8H/d0UaRHriowTeMjwN8PdYVyLkRbQCprsxcGQv+KgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166864; c=relaxed/simple;
	bh=Q8eCWQA4kRYAiOY5WTAmChp+rUv8YWAs1rQB5H19Lbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7cJVjkQgh1FC+uQ/4NcTjPRasrJfSnHqMd4V8qdnGPC52okB8xqH0r+tfsCZA2O1zUbw8rLdQfe+ET22WclPjvRnwzkulxc3KmMlrUGzRSGKO+Hte3sf2dEepbKcu1Y4HS1VnX1PgcJGDgPFhLblJRgMJKDPh+CoTJV5TisP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM/HYCfm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM/HYCfm"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso2848691e87.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166861; x=1757771661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IxAZoNFqRXhhMhpvmVHUSqaQIDxBjYcwMBDTUotPdE=;
        b=TM/HYCfmn62oIZHjrNPHQADopnxpJHRuQ30+fel/bOrXT2pIA6Qufi4bQ02XS0lwVN
         QGzlHeRtg5hPpyiv+md+wV7W6mU7Qm+bMbJbsioB9CcctoFKZ5g6OcZgUb3oF6R+83WM
         wt/2X3Pv/5tcrkayxPHFeO3rvIAnJqdsJ5T1p/HOzQinPIjvhP8jsjftJdpxhrE7Fv2i
         tplADa5484tgqvGlIcb/L0vZw8awyaSkWgk/U4E7E02nIflcgvvTevup2oFFNNXLS9+E
         wdZvduIVKq4Oa3HN2a3Jt5LMaI4lQek113THu0RxS0TijwimLhWmEAM4+XSREHuiBwFu
         g5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166861; x=1757771661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IxAZoNFqRXhhMhpvmVHUSqaQIDxBjYcwMBDTUotPdE=;
        b=rk+KA7qOXAzXTnctYMimfSouXLBhbXtxrG5u05e+h1/6B7pAkd1nQwvn5cTh4GtTiS
         Ke+ueuosN2qM3d0ysXGX58n1cL9xebLP7LH+Zkzx3t/NqilPYAKdo1utVeh8KTP04CNA
         WlqtT4q09zsnVpNl59eXt2j53pd+/KQ45nxZCSpljYZJUR9HwpU0mcsliV083QOEwjbF
         4SMQKydImSWVEq0HbWRhBBvd3Qtxtwn8zAHBgeVVN43TxWNnXhWRte/W6Z7eYu7jgckn
         cI01ORPqBTHjOTiWF/pdF0KaRzcSZv4FptOviAAi5xVpRz2PjTBsNYIWXkL+x4zz0pct
         NS5w==
X-Forwarded-Encrypted: i=1; AJvYcCUrFMiUZ7y2Js+nXcg6zibCTXrr45C/MoF3MG0GpRB2d3PVRSRNXEXe/L3j0LNnuv8AM8OISsdQ/c+b91mM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+Zyu/D4R3h/UEE/8E0swr+4vhRsqgrMzHXieVa5SwdoIsMyPn
	+laQwx84yFIEN3ysSJ7/x1LJWVjWCn0TIGVWQVTSXGpB/FfbX4HRHaJI
X-Gm-Gg: ASbGncvt24r8rMdPCe1XwivLfK7S0EQB15mbcENCshBtecDnEotfTp7wSnyJqwjQozg
	M/udr4xBI0jPwjKI6fgRmpN93URNzJxYaV3t2BnydEwyEJpPfkzBJcu6F1yRU7Q/j7mtNBdiIhZ
	ED2H9qQlN2w3C0tpTjDC6t3Ap7kSLpJzYlpZR6VMZLTDS9iA9dGPFqEUj2ygiCcAKu7Ls85hHwx
	bpHusVRTvy/zkI8RNrIZNXLwSY265pu312rxEbFgeuFaJiadX/0jfOESM4IcuUoVQfYem6tWBrc
	1jmon4ITi9ifi+vrUo05Zs4oCAeSMtOBLneKi4E+W4SSjOzqYxBnEBaNBK2dX+3m0pmVMs575F4
	S53sfoMi0rq3qMQ==
X-Google-Smtp-Source: AGHT+IHrlNGovAefOUdofD05VkXnyiP4PSuVmL1cFj3ZUmCUQ6U8TDmFSCBGRpnbBAUWYquvhaaN4g==
X-Received: by 2002:a05:6512:39c3:b0:55f:6a5e:36a6 with SMTP id 2adb3069b0e04-5625ffc7e17mr829513e87.17.1757166860926;
        Sat, 06 Sep 2025 06:54:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:20 -0700 (PDT)
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
Subject: [PATCH v2 12/23] dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
Date: Sat,  6 Sep 2025 16:53:33 +0300
Message-ID: <20250906135345.241229-13-clamor95@gmail.com>
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

The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with VI,
like same supply is used with DSI and has nothing to do with DC. Move it
to correct place.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
 .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index dd67d4162884..bb138277d5e8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -75,9 +75,6 @@ properties:
   ranges:
     maxItems: 1
 
-  avdd-dsi-csi-supply:
-    description: DSI/CSI power supply. Must supply 1.2 V.
-
   vip:
     $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
 
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
index fa07a40d1004..37f6129c9c92 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
@@ -37,6 +37,9 @@ properties:
       - const: cile
       - const: csi_tpg
 
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
   power-domains:
     maxItems: 1
 
-- 
2.48.1

