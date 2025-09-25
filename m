Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B78307ACA
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813459; cv=none; b=rnRH6W+5exm5BoQ+01kH6a0fKBqSoCj38QLTQYdaoh64jveyfjlB3kypJhikdlbnLZDQee803vMiN5RpSOmRogmQw8j4GvCN9jdpQiETK0UX4rYc0jtEOuIZlIc+tOzaHQCcsyTY0MwLc/NrX+BCax6JSQbPAU1ccfhtwW4xBow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813459; c=relaxed/simple;
	bh=J7izVaKPM1ps20wr6OTScdC6fJEWehyUv1o5AkzlcjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmn9VjQ1jGduB8uludc/8W/WQhnGvxncXKMmMi6f4Ss0FaOeBKm/XW302fFj3Tl+bdIE7/s7ldgoMh0Mmgy9ldLV68qa8rF/YH6rIHaXIVnT0D3BXkQGEjVZp/psDVWdQ/7lTHEP1l5VrG1TBbxmjL/FU/uJd/Wa2C0x+4zbVtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8zcrKcr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8zcrKcr"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so1102707e87.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813453; x=1759418253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3BqohOGg+vh6fUFPn6hdSt72tlOBF+v0LkjnbZ1rhI=;
        b=G8zcrKcrxYSVQA9RUXRuRoedFk5iC4a/uN+ouatHOK5Z8biE+T5yggHYk7p4tcleXL
         xBX90SGEg7qH486+/2o/8yS0+aydXC5jipLZCDzJa1KIvBLijngapmW+++mWT+3qu7oA
         zA39eIIVD6vRz+He3PCHF6uKC+WlvTpfIlAFHJkCe9KMGt6zBPoRqG9NKnGpmTyy07NX
         F9pH2vBsCMycBz3I1K0Vf/39Ssjpy9joXBfjtjn6eWjUMUAC9L5y5YSbx08udmu1YnlC
         P+4EVH3QcYZaxSa2ChWO3aIWKQhKNRGJKScQcXn43vVoLRKTkVDlSpvN4x01x92tj96L
         89YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813453; x=1759418253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3BqohOGg+vh6fUFPn6hdSt72tlOBF+v0LkjnbZ1rhI=;
        b=DnI6APof81YkmmO6sW+Tj4WNvt7/FFb1VHsw9VPKhoEidlvp0Cx/DUKST07KWkD89/
         tKUMM87fDa3NNHdisYRpWfpwuv10qDxemJM5TJdgiBjBrvng5QiOAlkznPrdXB+rScqx
         9M/01Xx0OolC5S2Lb3ZGXbvs2XA4XFKahzNYx88BJg4XDiW5FNqW/ecBl8VlSbOFEq8j
         PZxxN/pXERRq8p+zvloTFp0b5jrVaAqPkH3CCuexRml0AVxcq2c6BeKIiZ7fTo2Q6AgK
         gBbp9bVcY6NAp8/rs90HuqEi9nBqUgqqAJdg2ZY9YfIeeiQYDo88x4ktCXhsy4EMTRFh
         Pi/A==
X-Forwarded-Encrypted: i=1; AJvYcCXx347933HOYMiQwpLIgdhBylbls3AK6XaTDBZpBPBZlL9JC7J0tucTmPMS18mp+Atm7Jy26iPhwFtmyeEI@lists.linux.dev
X-Gm-Message-State: AOJu0YwFEL7N1cOLGfB2faA3odnyyaU/ksc6DYXh7eypgvP7DQxEnluD
	2is0rdX/8FsGi5xdNZ9wkBB65FrRL5ACW0K2mwGNwuYrq4vJET/bHZzz
X-Gm-Gg: ASbGncvkxgHm6PyE6SqD/5GTn1LyO1ZA1RfV50zKn3pjBq75xRrB8qh5D6Y3nj0WtZ+
	d3ZooWMDUdsiDIQh7eoKoAGdjI+SyNyFdPGfQIqCL5trwj1yibh7kVVo4B/Gzouky6B/gLh2yQA
	wYL7PuezKaSSGglWIInIXz9+lsZlF9pwuh+vCvJO25bf+oIt9p7ehwJhkeHIswZgRYfaOt/DJrb
	fgkFfQ3cydJbdNG1019BNpNWvZIMS9wJRVBoRmmKyDGyJKg84H1LJ4u8CbnAfoGU8HBhihDCXxU
	LbtwZYhR62lGb/46FXTCQAxDpb8w5l0F5LGmIJHUA8zmKSs2+qIfUcyFzQM4uxwl3XIiFt02VEZ
	4V1WLuddwmSckRw==
X-Google-Smtp-Source: AGHT+IGK++i2dbsoBub16rSwg8Y61Fa1WoKo+NmQGOT7b2HQy8IsigN1Ldy/HuzqUEX4JSs3hgUwJw==
X-Received: by 2002:a05:6512:6188:b0:55f:49ab:884a with SMTP id 2adb3069b0e04-582d12fde4dmr1009677e87.21.1758813452520;
        Thu, 25 Sep 2025 08:17:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:32 -0700 (PDT)
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
Subject: [PATCH v3 12/22] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Thu, 25 Sep 2025 18:16:38 +0300
Message-ID: <20250925151648.79510-13-clamor95@gmail.com>
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

avdd-dsi-csi-supply belongs in CSI node, not VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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

