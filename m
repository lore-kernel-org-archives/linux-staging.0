Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FBF313E1D
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813474; cv=none; b=do0v/KAHtJgZz3mwAYtBwqNM13ZarLXmY/uaRUh3tLH5JGI9BMKSA1IhJKU0i7Q5G5O4SxwOYF19YnNT+rA4xVQv6fDHNy8izmLn9q4yMHkhpcqpTod6Id6HL5JCZ5nF5+ve6lwvKgbrO/8E8PpIt3J00JRpwsWOj+tOk4F4OJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813474; c=relaxed/simple;
	bh=iiHfTmqTpfmKU38rkhczSgtC8/xhyV+ts8JmJCC3QqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8bUmFGTyCfy+7Kqh1dmcs1d3jKqmE9jCm+4tXgkmm/WJtm3PzxJLBOH4KJizZ+oFZxremm+kixrDwLjH1aOiv/e9rfsc699j/Fo8QO5vuZHQUmkyfeReU95c0kdoAdZoXBGo/laDyUMBiqcSXzGaDRkPzr89So906ApZ6TNrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzSgXRTx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzSgXRTx"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57db15eeb11so1313574e87.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813468; x=1759418268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=VzSgXRTxGaZmbZThOhL8wDAGTX5vY7IcHfy2ZBVADQW/1DG/2h80k/JexAsVtNzs0/
         YPGnr4MVA8oMRSdoNWjoqlrF/+nbML8xrz+wVTfWfcEC49qr+BlgI2habjmeGryN8KyQ
         lAFH87YgVfY625wXz+F8AO4G4v3jQ/cGLgLWsE3XLtFsCsjuE5Y3upDpSVWimay6e4FZ
         LLd7xs8Vkz/R1qOTZUxI0p4pkTnAfIBuTy9GOqwmHe6AiiPKa7VvVaoIvNDFDKtDQqeZ
         77Cqrf+fqgvTunCepHryh6urfUBplwuzl7Qh8Vmf6KjvOsSpiuBWbqafRlR6nn4sgXBV
         Sv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813468; x=1759418268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=U6YGQU7lPXNMUKfIR4shkZDieLWZWTT/k+Voo3R0kPetQ5VIEgpUcE0rxhkmXfJUwq
         2HTxFlRJu+zHWh4j73n/3z42QF/i8SZarm95PU6kujhQ5t5Jhm+Duha1NRVIHkgN+H9S
         4hz0uFt0CAqyuf/UE6SOgUE1398NsIt75awNEuwYL2Abq8n8EEbXpN74EM8Fvzi8RAOJ
         hLFRvU9MbrglMUZ69g11zMHROAG2SJycQwKDsKDtN9o8PYvHmz2NZ565H6NmGeSodiyH
         7OC1g3QW28+xRqRn/YQQctROTGpiE1vhfxxZrzk55SUVKpaf2ZgmoblZQKhuiHzDyytQ
         fmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNX/5XSAu4+wWTE8+boWFvi27aA4E7FmLmCX1dj8J2zrplOyStjseqlj1AoVdRxqetKZiRlW/p+ZybqVLR@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4PwZ7mGcloJMB65w/hV1g4m27qQdAfz9AIy8wd4Lz0gUF/J+m
	C8+R5t4sWpm0ISXhEu6+R+uOQGUFzqKB/f063Cog6IGKoDVahAWLxeyH
X-Gm-Gg: ASbGncvn8892MGAWaxlGP8tnu9FvtmrPesXp89jWKPD0zNkyuEA1i5f6bPdY3ezRZT9
	9wPXtqBNQL8uRrkeb+2BdEMktzm0H8h+FD7q2A3o7u8lhasfvTRF8DHhu8LFp2RodzTD6vZjwg+
	BrJ9XRkLQaK/lFLqod3pGOmyO0dFNxcK6a9YPaCrBt2YaXcaT92iTPbRYlW9rDClPFIcq2Tdko0
	9siEECYd7zyhBPL4J0e/+qcT09FIMsLN1bbkbSfiSB559zSHkdttJGR9pSaJaQk1aF/7KjkfTUC
	N+omea3TC0RFnD3aibX52BeQTGgvqkIIDSLPfLGsgrDnKCPP4MeWdWiWWHjEkQAKwOsx3XMzAMb
	bDizb4vdSfSrkfw==
X-Google-Smtp-Source: AGHT+IEgIvTgxxL5WIN2ZRYvGEcMitZUM+cSp6l2oZhWq93Lx+b6iM39RU57IOUk08HihxonasaaBg==
X-Received: by 2002:a05:6512:6193:b0:577:35c5:9a41 with SMTP id 2adb3069b0e04-582d3ba0826mr1107436e87.53.1758813468072;
        Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:47 -0700 (PDT)
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
Subject: [PATCH v3 21/22] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Thu, 25 Sep 2025 18:16:47 +0300
Message-ID: <20250925151648.79510-22-clamor95@gmail.com>
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

