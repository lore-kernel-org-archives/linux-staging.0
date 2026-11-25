Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606001;
	b=1F3X1pyCRQcEqXdxVFt/kPbnq/Y5RLSGs5NnFwtIbTQLA93xZrhQYlXtPD2lFqqMbQRn
	 OhKoPO8ky1oSPi0z/r2pL2Qvn3nj/JOYLVgeHC3S4GaTCIizAFM0sC6hus1NNXmbab3LH
	 AcXAyyDhOFT/BF/faSCAPb3haSmNmN8htyfIgcsbcO3umT+H54+oX3oiQT2SVTf41ctOz
	 9u9gzdwLR9BPBCipWaP3CMvb33Kgf+trU+neXpmCFuhGh4XlmYyQNmGfU9tjUxuf4v3fy
	 0tc16PI/zIclqUO+LaFnK/zs6DVa2kxbHr8qSGzPYHoAiJb7EnK5iE1yk9Qp25K733Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=Gf9jHUKKcRvw37CsSZvu4Io/B03sBgmWjqb0RQVC6CQbnSfNiO1aV6/tq69ZP4CV3rII
	 GPbj1DnowHyDiX6zXkNnXlihYV8D4VhLcgUoAC1tulgoqltUi5ExBTW5t9LmtRr9f4Q0/
	 s9s+A6MB0ET7U3RwbIZUg0AHqoO/mcltop7FBNQdiTDou+F9Brnzd3H3jtwAYryxLkOQR
	 THQ9u8IBy/EI7F4ZrdXGG0SuQzcwoIfpVvNn3+cokJFQctfbNgpF0LpbMlAO8am8xxPad
	 Iy17+Om0vvFk56RUmFvvybBiiA9+D1Vbr1l+UMDqlIkd5WhGTyCasxNbAlzX/e5J8mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8eaydrS;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840F060A382A
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 840F060A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8eaydrS
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so7237236a12.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605999; x=1796210799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=K8eaydrSMHsilwBDAoNpyRshaoVX1wcVSDlVfHMGjOQ8JHx2gGAx5IfRvVxWRH3j2l
         1y1UFqBZy6B2svOxcMElGbQ/vex+8YnSFPdj5pwz40nrgoxk2ra5pq/WPR0GwI9WSP+Y
         +Gqlk3iAQq8ztb/EiJqcn/pFCFvbpOL3VmUNNmAh8ykzB6e85LyEcFlqyW1Ed/rI6YOm
         gnJmQEQT8qdlStWwc0D/bqyyblgnGlSMQ/bc15gERVH0DpCW8PZbehj8G8mChhUSb7yp
         o9XkYWLtWno4ykNDX7ih1vC3mQTGVMrvdWxJHjcex/r1ftFhnsDDRCn1l01Km9EIKwuU
         EUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605999; x=1796210799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=f6NMdblX2RZc2jUucGW4yMGgu6/uPWtO+fLS9PvGtUS488MG1qJvWij8H/EL1UhrpJ
         IcC+gcrqDeBHUVzmihjnN15WUsgmjBD+iqbd4KSkRHxHovrzQhkNqr41gWpCwbU9JNV6
         2y8TtXpDj4uq8AXyuJRzvPYUfs6vpx3B50vQqexJdu5KgTyySYlogvo+ZwKZUr/29sdv
         xLug+Aftrha/SARLihFhFOHqRjV6HffO1E3Hzfaqg6FXC6O9QcysdQ3y5REAMw1lWsz5
         TDs239DUZHLUWfyTGeOWNm+UmrKd/gtBJc/EPtuMTRiu/bI4JXGyTnMlQM7Du2fSSm9D
         htZw==
X-Forwarded-Encrypted: i=1; AL+hErENOBLsbbZwBRr2jCMlqEa5UQQc4yrROKIkhydJXNSqSnZa/yRQ7n3Yaf8fByQxEfEtwP99ACfhHHYHpzL+@lists.linux.dev
X-Gm-Message-State: APuU4Z/y9su7dcmfrLRBclKv4cqNhUXFv4n8nb+YAiv8M+qpAZ5MeeYa
	CE0FaBe9X1+hVv2dxbTgfJX2G5Vp7p9v4S5oRrWipkPyeRssdHWAeYgr
X-Gm-Gg: AZFdTZfIZJEQ18bDYJHghYg7ED+JEgfoUQ+uhzXnh5reC/QTYIo+FnG7MNaaKtWwfEL
	+v9vGjO1cAwol3ajsRiXCO73a7DsX+J2D+Jc9dSea9mJYQBHa1gfwPijg9u81BjAHiXTxedZhoO
	Tp7ccm4Lnb8ljCr3kQoEd8BgBTpA8yX8y+zh8nrTS6EwR/MAdHz8G+3uV42lG/qlw2/hsjcSioT
	rE/HojJLopPFyg6MJzexXi5mxsCqLY3dMHP92oM+oQ97o6pg83RQHssYkaaIQwhxZ4fOWrukhiR
	UObTxOH/T7vNTveL15SbOUDYcFtcqan0ymCM/NgwaGmZNPtum3Rw5WVQKsiDRpkLA3ErRBBI5DV
	wPKcn2ziRniJAKpsIcNbrZdmineIctVfKtAPFp6yFpfik5j1Y9A8MFswMP3pNHb9ns7txV9TiJp
	gHzcD3fgbvTkFZY5XEvEARgQTgVJluSMdiyyq6BidB8wE//9+bPKM779gm6e+2omjcu8mKp0Jg1
	rMJ+WQhykNRFeWCh0RrN58IjrjyXZop1Yk3pj0HbtwkXU4Y3OjXNsMuQn4GtfpRyDByDue6en39
	HHoMcFRWNg7QvQZaVcChI2I/txo04scU5KzJJ6h0EcBABA9N/vS7b21H/P6O2QLjhaPt6Ekp0iU
	LJ8cdFelKWQ==
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6ba37ed9a8bmr12269161a12.41.1795605998897;
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 7/7] ARM: tegra: Add CSI node for Tegra114
Date: Wed, 25 Nov 2026 13:26:13 +0200
Message-ID: <20261125112613.237333-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

