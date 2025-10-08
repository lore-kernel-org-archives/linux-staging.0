Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38DE2F7AA4
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908703; cv=none; b=TSHZFs0NPc3Ub4Bp9KNDzHvhuzslZH+Rkk8algTtDZqeAtCKhFuFu0XvnHZG42f7zFbr96X42VffroVEBf359Ss8mAtcGCvWO+fG+vfHC6fg7MDylz70RFFxXzsMJp3bCVhzmum7t5sCQ16eTCI6CYSIQbo+1SntLGeCrxBlovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908703; c=relaxed/simple;
	bh=r7b9miz+zGlUHxIqeITYi2Gi+cySbUCD1AnY1/8Oj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3dRhi4jCFst64JSjM7l57nUpWJHPzqYjiaPfDyE34FjFVgw1oDElwRziJ4zPP9nPNtUO1I/tVmyDAPFU3PE/7BojVkygOYImIMHMSNb6EVTddp+3amiodJqEbaHnddh5bpll7yRJloCo6WZIYhZ14NFElWPYjRc8PV3oEEqEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezUYyPnx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezUYyPnx"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57f1b88354eso7113071e87.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908697; x=1760513497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=ezUYyPnxsROB7tQ1PnMffceM8W9Tdj/B6RI1kEf0jtY9PxVx3Ek4j7CZ0m6VbUGwxL
         Uez7Mg6DUdvoaiIdMwgHr1+DTvBXmDpF8nWwHQPIO1jiUZpDt9xURWIYxMnvS91NfeT9
         DS+tMnaT3L5D07RP/uCNAqXlSGhTfhC6ITrGgWzG4Ff0U8MyRHpLHNd+tCelhUwlRYcm
         llMVw0+ewtzArj7HclzLSGZcg7ffiJOv2cVuyHg+kiPWEgLMau/JDkOZucuJYj7gEOA0
         OysKA4zQFIKfnH9RiLRQhP7/VRH0wldpQf6qadTytlw9uyYRFq6Gkl/qtqskwBFaxwJR
         F0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908697; x=1760513497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=ZayCtePJpXeDx38WKEmulfkya5KgRInXvaXSr+SJ1P6bZsr3kPe1dIwSfpn1HId3oS
         +FPyKiY0GT79hjmDXt8kQ5eRKHfGk4AlRy5sW2SOAm3Hbp9jKBm7uBIVGX7Xim4jzrmG
         BfteJ7HIfVYyp7qG+1wBjMSplozNj+rDWlL6EGzxJz9oQvjAipUFeUoAfhL+9wOzCpX6
         SAmRH0ZhapREhunZZgkZcapSfZX7Mni9XqEj8EwOcycj/drgZaLBmmFOslTmyt5FHaAJ
         AJXCcHfJj2KpgfeFoT5VZ9n6I4EHlLS7YoYAwsLd+wAZCunYfZTR5qO8dl8dJc744l2D
         g7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUaI0AHg5K/VKjo7WRjEQ50kRVXRScy5vjcMFbQWhoDcXYqBIv5n9iGAJQJO0X1HTiJzd/1mJOPG2DNWRiX@lists.linux.dev
X-Gm-Message-State: AOJu0YwXlPcuvodV1HtzzG4zewlVFmv/UGzq/RNguT0g92ONwmHEdiJ1
	yh7I+cU46HSYdtX21HM98em26AVpJfs318lSu4NevzqNLSt3z6tdzyat
X-Gm-Gg: ASbGncuO6kO/rentgwCMP2GQKwOwGS1C1VFTyrHuS/zVZ6RXr2PR1M4VIlmdO8Uj+P2
	jrXPioczuIs+v09GLzgeH3ZLvSJjcP+hrqUeYoKdOFZEYF7t43z7PF2bazrW/H9uy8Xy+zWvsyg
	iuhCXwIlnkpBYqVdx6FRCa4NR4rLuqq1tgIiOwHJrtgs+sPv00X65htC/6DnxmSlD6q3Z0ZrGsk
	riXxCQyGfIwEoF9RW8FhXgyGvRhA2Pqi6FVtnUN6R3a4JN1mFIAmItVswdRaZfKo6vzsm+ISVha
	NpKJp1xPhAhnUfhTKGVmGHQWLPWIC8H6pfzRZJTvqCYF58cN1qMbQMVx0cXGIRaKc105AsG61nh
	5ppmE8a0W6L0SZ8Rd/iFALFU7pO1fVh0DweDSlg==
X-Google-Smtp-Source: AGHT+IEjBzSywNMkFOAbwPQ/jDGY7x/5cVSXXn3BDGuPeQ0omEve1y2ZqSoYQ22QYGSRP1UJUPETlA==
X-Received: by 2002:a05:6512:230c:b0:58b:5f:d97 with SMTP id 2adb3069b0e04-5906d896c1dmr693727e87.2.1759908697218;
        Wed, 08 Oct 2025 00:31:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:36 -0700 (PDT)
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
Subject: [PATCH v4 14/24] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed,  8 Oct 2025 10:30:36 +0300
Message-ID: <20251008073046.23231-15-clamor95@gmail.com>
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

avdd-dsi-csi-supply belongs in CSI node, not VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 584461f3a619..4a64fe510f03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -20,10 +20,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_dsi_csi>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef..f1d2606d9808 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -64,10 +64,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_sys_1v2>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_sys_1v2>;
 			};
 		};
 
-- 
2.48.1

