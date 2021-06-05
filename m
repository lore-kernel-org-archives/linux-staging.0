Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B161070
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 07:30:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id f2so11422626wri.11
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 00:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emwizER++sdhckxDEjVYBRRwRXsvJ7cj8phwruuKBuU=;
        b=jtToQHPMKxjQ9qNDTqp0cLkbdIzyEe4Jc1FRsCoGxlJDRr1rH861ZvG6Nmoidgqygj
         rgC/yiCq2yBnO7ZiIUTlonoOVHtUS8SM0J5Kiy5fOFvxALlFFBBNELaMUcON2IYOhF2I
         gw99+DxjNuX1VAy0ckYKF6iYbtbeNDcULzDd69BQWI8EfCJnqSXcEdxpAvO35Va6vP5I
         VSa0n5qlG3UpU0HomMSxnfxbqDRW5mIpb3gC77NKIK7A7IkDd97C2HTuQPBVdlgVWWXk
         ordlryzMHX4f2E/moQhB3Uozs/dIgREbGq+a7qhMJ0a7zGEQGEwl0hMYs0SWL+ouvEY9
         FfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emwizER++sdhckxDEjVYBRRwRXsvJ7cj8phwruuKBuU=;
        b=c/YFjBEJ8YojmwPh5dRk1l7j05nvDR4hveegTE7oHgKvXsnT5LV/VF2hxQEN/afPOF
         uxOhl2fioony4TOvBP0aA7C9Fqchq3xSHi5WBbAF1osA9w+8fg5X32id3yYzcjro/yDd
         7Reby2gQhNoAD5SVLCAwZtuWDdDy2xAut2D0X6Gladz/st2ztjKsnWv/ubU26ulavjie
         qRmPyPfeFQKy5EjsctWqm3Gdwo4Dh83eIWye+frv5jkyQ355gfel+gFUyxtqeKLWA4qe
         XCpqNvyRtF72PQ6fRSvI0QFDiZ5bHJe96SF61Orpw1Y/ABae5EKy2QoollH7jnRGN9nE
         q69w==
X-Gm-Message-State: AOAM533AR0goxps+R/57s/A4zZBx0ocRVXi5fjC+THwx968SLl19afmh
	RZEQ7BAFvtIbLzTnxi3fIASanExcjwlCkw==
X-Google-Smtp-Source: ABdhPJxytbza3PXf00YIEZb/cXJ5hw+zSLD1E18eU8CoBVXtcbVRvh22cOUI1o4sm4xoaUUeueZjng==
X-Received: by 2002:a05:6000:1847:: with SMTP id c7mr7513031wri.368.1622878228085;
        Sat, 05 Jun 2021 00:30:28 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id l13sm781419wrz.34.2021.06.05.00.30.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jun 2021 00:30:27 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 4/5] staging: mt7621-dts: move some properties into root port child nodes
Date: Sat,  5 Jun 2021 09:30:22 +0200
Message-Id: <20210605073023.21435-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
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

