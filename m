Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9949D34EF0F
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142914; cv=none; b=Opxol7yxHncoD2XBXBNHSWhKwu9/BXltjPeSLHMRbUtLzYV6c+3Nuj71NCQvsSBjJJ31BMR53U1WzhuV/XNjuAZGigfhMDEztgWQrxt9JCyz87x9Qkn4nKsRQUUBgTFyA1sHrczWk3uX98TAJZW+qs+1uVb7hk8RT2minf9kNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142914; c=relaxed/simple;
	bh=r7b9miz+zGlUHxIqeITYi2Gi+cySbUCD1AnY1/8Oj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AU7QsIE/OXGe5nKKgBsSyRxt0Jsu8DwA+rg2yxvBe/FCS3wK/G9cAqK8fRCp2WGtZr4QOME+6cfZ5C5XTkF8SK3IhhVB1X6sB0BJXpDnlnhYR92xWfRm27Ah4uFSxnHRZJ+LE2DPMWMltVcNbk8z5hyF9cqxRXzP07jA4/fh+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5MKIKsA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5MKIKsA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-421851bca51so5745851f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142907; x=1761747707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=B5MKIKsAfCgnUcR7Y0PowdckMHpBzI2dOu+BaGUN9C0ADTwMOM9NBavpdRt/4aXtO0
         VZ+eNtAJohbEv3xx0JtghsErUtDjeGjM+KqGaqJTM51AjPVnHf6ADEP3U4l/Z2OX1HXS
         lLMGlE0QDGCfJ/MwRfzT6YbhC+RK/VrhclHr3FFTtILAmYg2RswRFIKz6aUrDNRoFhoj
         GHGb7X4aF5ZdxdrqTOalxYUoZvltHmjnopbOaHhFYmSmKJlO05a31b/JsdiBCBtuOkYA
         8FK5LMn3kBqYi5Fl18wSMpIQwXaqcOi7djGvBg5WA6yQTX4rqyBDiEeYzRYZ0WQFLHtg
         M/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142907; x=1761747707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=V0S3Z2VHMubLOFgszEBfXl3/ePpdcfz9TPgrQL8QvkCvWIgo2Ke1Yp93ftxLHtLDsY
         JOMgvhedaYx7VUJpx1PHYwcm5jG/mJM+LpORm2Lf71I02q+YzSVfsPdpkDrAwVYxqZA0
         +sGLJYNJ8mqlt3bUgiKmuD8FnoyfoUof7K/VKR2EH3PbfbpovzDqOhQCu8HWCMPQJ/h6
         ++PdVlvuQOFQOFUtk3665p2z0p6fOpdcGJu1V1lJ3jTMIVi29dzRkhUUCmTZ9fSoMyBK
         u1Rg/Lg/RcvCcLt8p0KJlgmZ/Oy7MR6lSj2Thzv7yWgiN1Vp4hAlQIvhn2kHjVJM05Uo
         CNxg==
X-Forwarded-Encrypted: i=1; AJvYcCVkpN0OjEiHgYo20EVWm+X3knefpLdT8+aFuiA07fYcIqihVClvbny42mriSIXZ5vTc8Eonb7Evd06LgP4d@lists.linux.dev
X-Gm-Message-State: AOJu0YzALWkybA9ql2XwV17ldU+myYcsIEPiAcQrrD1n1uXiS4yvSasn
	sHddejbSP3EKImoTj0etFdaliJBze0sXxFbW57OepjZ/CALM0NXyTdFq
X-Gm-Gg: ASbGncsvmkDn1gK1/vz1w4s6Ttno6/95BmNW+NP/D5ZThagFC65rDV390wLZqh4MAlq
	U6m+9Omou35CqPXApOrxVAcEqiP1nUuWmqX+Wx0Mn7uTAcJbr91p2iYKvHBXT5isSldWK3qECDD
	GeltDmNlXnKvYs7cjeBB6YQjHNcmaOgmJZNsX9GPuO2aiQtsGDU3nQZSuAirM6OYsUuR1tKc1Ut
	+8v7f3HiKq5myah3nm9vOdoWG+s679veLiFznR7j9ZRl39hFe0RLn5fXvUDAiYnUPzlfOSaTAgx
	fA0SMdBFFQWy24R1AJNPpHJdfZk3OE4ZpM4XKvuhGPANef9VqKrXb6zbuNRO8Ar137Xw+PK54C2
	Vnt8R8NcNcUL8rq/5GU25qXNHCIYYiAQVIwVmEfOYd0w9y+Qijvs47lpL+oNMTjw1vqU=
X-Google-Smtp-Source: AGHT+IFuKTY+6VlzlctM2Ho4Y6ooXPbr1OkVqVQk/ddAnkBtDFDjaUEYC7CuSZMpeeIzVLphs/KiOA==
X-Received: by 2002:a05:6000:1a8a:b0:428:3f7c:bcf8 with SMTP id ffacd0b85a97d-4283f7cbeefmr11118870f8f.29.1761142906649;
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
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
Subject: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed, 22 Oct 2025 17:20:41 +0300
Message-ID: <20251022142051.70400-14-clamor95@gmail.com>
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

