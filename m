Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC4B34C14E
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144585; cv=none; b=kXTHo089JY0BsMvwswILbBDKP96a/AJN5q18zb3fnXH2GzbbXd1UMzDW5gNIMljTl5tbnfc/CoVcU4DDUI9wuJqHXV1YpwxbSA4Ooxm2AcMZNCQxDhFu5d04YAsY89f6sYsZhml49nXXWzHwk9W1opUFGbhF5AJzIebRVIgxuUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144585; c=relaxed/simple;
	bh=DxarD8TnJr61kRFsvLf+3W5F4BVamSRc5LKPNeE+jqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdOrITaQ9JmGHheWOgGKbVZgfHU+74nomBYjJ8a4IZg4q4pwIQaf8a0kZLtDd9lsmabubomFb+LqINfpug2p2773d0AANknwUzC7ol7l6MnjHccRPL4tVSnFVLwC293c0th9S35NsEoByO5Q5P5kOV0NLF5A6qv5JjWtLE54v0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY27xm8V; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY27xm8V"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso51504105e9.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761144580; x=1761749380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
        b=KY27xm8VCsn9Gpnd4rqTS0SBZpshqfkIUnOf0hmvpUVmi0+l+D0/U3do5qzjKtqXxJ
         6mNJHCyjqAI5KDpVoE0V56AoS03xnoHoZxgapn9GtRxw6nhp4sb8zrMmDrKy7EDEZ38E
         XpFRtEYPOVhQpz1jKqFcaTjbPj1b1GybsioFVGhddc22u3rT126WJT63gnxWvLSc4pFl
         4MBeaR1vbtwavtHg56ejSLn7zbfAyVt2/QEkalyEpa+EXXr86vrvCIT9eMCdPy93Ys7h
         QdSxiE1+hoHSw9iHvL3orHmwJ6nJsj1KPOZ+E7V6PsMjInTJ73y6duhHR2H+9XxmY5ka
         +2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144580; x=1761749380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
        b=tSM4FsmbjqiystsfHAxfxfaNy5jzQYqg1waJd38q+kmiBF8klpAC0GGOpUP6WC9Bvx
         +DCnOWoJYnkICv5iKN4tzXXcJFWyHw4axp2vpjcq+rz6e8bJoaA/1zMlnQqo+n8in01F
         +KzJNHFKzfo5C7WTDtjz2ApPiK55ryo85NRj/MtNMbCHRl/jjNPD5GkF16FdVPbHb95/
         3uyzKmBWULkv5TGZOG2gU+n6PBMRX+w7U1fJjlCaA4JdJVcKCZO4NA3D6d1MyqjEAnJK
         G9OXXmBMxZPwsMVhIw9P5UkOZMNgqBx5w/yN/IOXGo5Z3WiY0G5jYAnXONOtBuMbKMf1
         RKxQ==
X-Forwarded-Encrypted: i=1; AJvYcCULjucVD01YD2bm6USCQBxoEQ7zuxZOeejN/esQLreWKGqkiaGLx+Czidq1UsLBcr9s6vBcRrPLyDW5PsT2@lists.linux.dev
X-Gm-Message-State: AOJu0YyKuoV7bIQPYI5lDXCC1F3xsEx6MerJVh7RGhNIc8oHBnQpdpST
	p2+GKMDKVq3PFytNKc45Rmj04cjaUzDnIVqE4NcJb3EvKgyhtqGMgLQo
X-Gm-Gg: ASbGncurm59WfJC5S0mkG+x3AZlVWEk3+tv5hsVoqKJs7oriPiyyw945+roGSyN9aY0
	AiEYMjpTc/mL79DHCcSVyGgXaOWv95FMNC2XZYkkhzFYbyOTllAFTec4ZR0ZuVVxOTsl3LnK3Sj
	HkKyZRN309yLxCiu0snQK2ni3u0OJTNmpHWqA9gahSh70Y9btDkfI7n/f/U9A6Mf38Izi9CYXQ3
	eU7z6V6ykaFFxE8z0RdkvnjY5Vjf4nvZJNDMMxjdh+dw+EGiKLsBNqt5OZJK2la0F19CVzrMUEo
	ZA7bS0bSi27Z1E8RW337DdsN6jMFAd4ZJD5c6CvEpF8QTmFO1/XW2OvQHI8xqpgqBa8V8xtRRaA
	xHxWeBPHjsxAXtqM253OEy67CK+/f5RnOP51qHCcp1ne7N1Q9dyFnPzsV82yxbM9L2ws=
X-Google-Smtp-Source: AGHT+IFQPTCWm/+rvvBIUt0UXHZaN56MajrHW+8ZDd5b9VAy+C4orsub3LKR2q3U+XbF/HSoJxwJiw==
X-Received: by 2002:a05:600c:3488:b0:46c:d476:52f3 with SMTP id 5b1f17b1804b1-47117907a6bmr159176745e9.26.1761144580197;
        Wed, 22 Oct 2025 07:49:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm49956525e9.3.2025.10.22.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:49:39 -0700 (PDT)
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
Subject: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Wed, 22 Oct 2025 17:49:29 +0300
Message-ID: <20251022144930.73272-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>
References: <20251022144930.73272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

