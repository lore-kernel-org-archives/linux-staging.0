Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF12305948
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166880; cv=none; b=YHhCyzh4iDLPtZ0vljGY+jCVHa+eoWnZfgb4Ra3UAMBuiDbNBYjY4tpd33AUdHkp51AI96jqISL8oKueAq/auCAo5VzhhSEQojmS+8HTVBF2PFKr7NJ6Fr2aNXRaatwZGcuaX2vRv9/sQaImH/hwGSiJ7RVtWq2gbiVvC1DY4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166880; c=relaxed/simple;
	bh=iiHfTmqTpfmKU38rkhczSgtC8/xhyV+ts8JmJCC3QqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOUvXqqaPb97Lhj/8zR7O72VNyhAhwXwJzSC+84kn8xEBBDXTUuMH9GiSr/1DAwRg9b8BvMlKcMT851G1+RtdNUC6chHnTn1LizUxHpNN4WXFZ/F+z6Gk7nINWL9TtWb6uHOoScpzh63+g2OmyMb2m6q0DHaFwtSFnjz60CKWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBdbmtqo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBdbmtqo"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2745634e87.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166877; x=1757771677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=ZBdbmtqo0ZOBWkdX/xZqVUwLaCvv8ZJFTiWOaX9S4FvH0VoAY6Q3IFMZs9coyhSQ8v
         g99ZchUOMiZhEKghkBI6O1Vp48wTzTjmnY34shTKOp/LyQoavhYFjUpcIuGFlp5AAsx3
         hzQzGs8e8zXZFiFV6XEwa+vyvMftfrNu810uP0dAl6coWZD/5GnsD5h4AppDBInCawv9
         mce2kbqs/SrjPNM5kdVKJqKzM49FnXGf4g7i/D10onkkvoQWOFbvvdnZ76N3YJ289psF
         kIYAknMOBim76nXgQHo5aPe90pW8lJxD1EUOJ0OYSbBaSqRvl69TjFtG85mMuaQyXdZt
         dZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166877; x=1757771677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=V1zVgZIJ6e/CQAXohkn6xNsDP7dUlpZ33+Idx+l3cHxAeelhSZQkrZj5ou3WVFM3xS
         PCvY9oqxerkaz8vjHHmNmcMkPBtk2BFa0lO1G0be1k17B6q3uAVJqtTKsmfKkoAE4Lye
         cJrrHLTB301SPGRypCI0hdKn90ihWBLaFBYZv0iw7KQLZj99XxWryzrHF4g+xe8XkckG
         dvHMVC7dHES4aWPSUWFMwGU7hZ3PGNfa7Q6B4qTDypBJ2++H2/0VsBVESict3hdqqRPj
         c0mXhYgiMw1fGrApD75uR/Gkt15FgLNaFiAI3ebyfZwdz7lDJdTa3lwp7Ua5OtUcYFSm
         rCUA==
X-Forwarded-Encrypted: i=1; AJvYcCUCmQZo6U934+9H9civxxYQ+p39eioGoEKJ9mbH5qLJBxRzrRB57gR+OHzSPX/Zf+NUAMyf+pMpkni4Cs1O@lists.linux.dev
X-Gm-Message-State: AOJu0YyoiA0K5U/hDXQTYIxBFAm6LaqCR3guZVOO4cKtW0RRMKFDZQqf
	OD7SVfGbh1lOfhVeV2A2tBi3kiamfoXTTVzea3LlbUocgHYPjq7GCChh
X-Gm-Gg: ASbGnctr4GKUG4vAu9HDF7sGPqsPT7nb+/C3c+kfIznZM4uFDwCjBZ5rTVeIHG1Ub9Q
	VA/hjOHuyIq7AuRNiiyNesaAlav79qe04lM/7v53veqR5f3DwbKmF7Vgt7NUel2i3PZfv1aR2mA
	JwDDTWJJxUXdH2qCoUT8jRIFTyUgb6gVeiWJ+txL6fdKnq3M1B6uJ0RpunwmI7X5QSHhEWN9zsz
	5k0Il5NYC/CqW5NAurXEPvidpJK/TJzDzJh2PbPOS1B9207JSG7aW5eP6jZwqfrMOXU9XP0WEwV
	cD9k8NALopQEe/bBcTHJxGc4rwcl0NqaMla6TdLHktrYmU0U/amh1wEoeWCUJHgQsv4hIZu5HvK
	sd5hryjbGkro5UQ==
X-Google-Smtp-Source: AGHT+IHatIGh8G0J1UikQfxdTFIXqQbQiWvindT5F63RkEZZAi8sPudRZamp4DbTR3zgvoJJlfk9bg==
X-Received: by 2002:a05:6512:1455:20b0:562:d04d:fa0d with SMTP id 2adb3069b0e04-562d04dfb1cmr352888e87.30.1757166877046;
        Sat, 06 Sep 2025 06:54:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:36 -0700 (PDT)
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
Subject: [PATCH v2 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Sat,  6 Sep 2025 16:53:43 +0300
Message-ID: <20250906135345.241229-23-clamor95@gmail.com>
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

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 6ae07b316c8a..5cdbf1246cf8 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,23 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 20b3248d4d2f..be752a245a55 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,8 +150,8 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,26 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia-pad", "csib-pad";
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.48.1

