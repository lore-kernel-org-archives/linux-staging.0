Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020370
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 16:14:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y7so9947559wrh.7
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emwizER++sdhckxDEjVYBRRwRXsvJ7cj8phwruuKBuU=;
        b=si5f5TKPJYvM1DrGFn7Wrd7HDqAnCcOelYDgF2vUXps0HTXRbAR8L2sMU8GV8yiXEw
         U9AmoNjoi8Ocy2zDzXozz2ivC2oCLNKUnYezz778erk4vwBzte1KljOBPZYZmNUFOY9X
         z9QygXibahYFz/XAIcO7P09A9t74UVGu7C8HczfID2WYVw+s+9fGe461YsCsAyzEA+GE
         WRgA47ldboRJTxn0/LZJ4+n+gwef/eztPv/moawsm3aS3oPXTwvqWxgCEbHT9AuU3hV1
         pKNsNRu7wINF2UiATnNDy5z8OXLqqHEOYiGgs8PncVm4shGsAioYG+PVMtGQ4DF91K/b
         gW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emwizER++sdhckxDEjVYBRRwRXsvJ7cj8phwruuKBuU=;
        b=YqtOpAdGuZiFuwxVCSXTqFh/07XR7yQhW+X0xeJDVOLC6BuFbwc+9fuOJx/GlKUBbY
         DG2Jf4Et6LN2o+TR7Or5KayZjP7XAnbdfRRGpC4Q5d40Zw4bnQITie491nktR19LLqaG
         AdK72TpbMIMglDTShgQdufA6JXYojiGPjMhzVD5qqvuL63kJxhiuAx+7pgsaI8pse72s
         XW1xLcY56i9hkgM6+BwzMatWXk5MT6P0kOyqILqOa1Gpu0ZFDDCZJ1qD2SCdZ2Q1R7/b
         qZNxSKCusz2eQ2m6jS1qoTksw0mmTWal1MhEs7Eir/7qPv/IYn8ZCqd5gGyYwM1EKI1q
         F/Gw==
X-Gm-Message-State: AOAM533aMIBaOQ1w3AAvZMmNHsLfDZBleK8PgVkiPYuHciKIHlXce4wa
	QPkJaVR5MevINRdUkhVh7/9NSKndXSscQw==
X-Google-Smtp-Source: ABdhPJzeSqN4gKpWDIU0TPgmQndOZJ7+BSa89w3xfSmjF4g9kPq3ysIi0pRkPX2YfKApRv8NHvU11Q==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr13476651wrv.109.1622996044593;
        Sun, 06 Jun 2021 09:14:04 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id n9sm11724427wmc.20.2021.06.06.09.14.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jun 2021 09:14:04 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2 4/6] staging: mt7621-dts: move some properties into root port child nodes
Date: Sun,  6 Jun 2021 18:13:56 +0200
Message-Id: <20210606161358.7114-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
References: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a review of the bindings 'clocks', 'resets' and 'phys' must
be moved into root port child nodes. Hence, move all of them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 840ba0c3ffed..ecfe2f2cf75a 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -500,15 +500,6 @@ pcie: pcie@1e140000 {
 
 		status = "disabled";
 
-		resets = <&rstctrl 24>, <&rstctrl 25>, <&rstctrl 26>;
-		reset-names = "pcie0", "pcie1", "pcie2";
-		clocks = <&sysc MT7621_CLK_PCIE0>,
-			 <&sysc MT7621_CLK_PCIE1>,
-			 <&sysc MT7621_CLK_PCIE2>;
-		clock-names = "pcie0", "pcie1", "pcie2";
-		phys = <&pcie0_phy 1>, <&pcie2_phy 0>;
-		phy-names = "pcie-phy0", "pcie-phy2";
-
 		reset-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
 
 		pcie@0,0 {
@@ -519,6 +510,10 @@ pcie@0,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstctrl 24>;
+			clocks = <&sysc MT7621_CLK_PCIE0>;
+			phys = <&pcie0_phy 1>;
+			phy-names = "pcie-phy0";
 			ranges;
 		};
 
@@ -530,6 +525,10 @@ pcie@1,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstctrl 25>;
+			clocks = <&sysc MT7621_CLK_PCIE1>;
+			phys = <&pcie0_phy 1>;
+			phy-names = "pcie-phy1";
 			ranges;
 		};
 
@@ -541,6 +540,10 @@ pcie@2,0 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstctrl 26>;
+			clocks = <&sysc MT7621_CLK_PCIE2>;
+			phys = <&pcie2_phy 0>;
+			phy-names = "pcie-phy2";
 			ranges;
 		};
 	};
-- 
2.25.1

