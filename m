Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6C2FB1
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:02:00 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso2122859wmg.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emwizER++sdhckxDEjVYBRRwRXsvJ7cj8phwruuKBuU=;
        b=LGNeVE8Snc4ck5RnrWhyM3gj3W1uJGh42YNx4QTWx+2sPwkVcd0Q5sAXWOi+8i86qs
         YpQNs/6zo4jEgFpFdZS9/KBEtXv8/jH+cD/QCPb2FeA8TzIrhXfuR6jvRjCZpfriWZRH
         ijjZRsNaGxvLyGW/9m3DcLkKPq+HqhHd/dwm/7u+qYLlXe20k05e30Aix7PtT2h1AU87
         nCrjByPttHmgwXpaTEBmhrr34BVcmNiIH5FKa+QhkMqs6YMVLvK4+w4KB6r28z+QSRhq
         RSPGpV63kTnfU6bYx12OveII7CtZXeQ3uefVwivAbXGHkFtpYNHErMRLyWmCwDcteua4
         D+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emwizER++sdhckxDEjVYBRRwRXsvJ7cj8phwruuKBuU=;
        b=ebEF+oRhK7j62X0MboaZh+SV6vIMdGES0eoSI6tR6ZvWHM2Edq5+lQTxuqK6yHMeEs
         3j+/QLbNJI50yBiema/t/St5NaZEpRbfwqSbyHg6DC/NMGpzjpGYuFZx+cnSf7wqqKUl
         FSK/0HxPEjSnpDQZTwIueCtNIL68l9OpVJK2q1Exbk+WNblU4ZPdLHuG8s050Fg7N+WA
         8h6qXl+iGnJn/+Bi75xdc76RTf2zKwmUtT5eQO32VVdTOjzFg0vVEkJySxA6+U0Es7By
         ncX123xg6ZlyOa1zHQ/RwpHA4YHYuRY6udx9hca7cC6MScQKjS7Jmb49m0BNI3mNMXlg
         0wRQ==
X-Gm-Message-State: AOAM530Tz+65H3+OZzr/bYeeEzNg3BmCwy7rUxlwqmgpW1vpF5sqVTEQ
	zITUsiGQBZJsMzwGoZeKuVUBmOSLj5GG7Q==
X-Google-Smtp-Source: ABdhPJynAowL/EsLX9FiYTsCYmLoXvNtN0898xwKH9hXiVef/whplLGBc0t79Js5pgiuypXJXHwNEw==
X-Received: by 2002:a1c:bc09:: with SMTP id m9mr16961826wmf.143.1623067319026;
        Mon, 07 Jun 2021 05:01:59 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id r4sm7595408wmq.37.2021.06.07.05.01.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 05:01:58 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dan.carpenter@oracle.com
Subject: [PATCH v3 4/6] staging: mt7621-dts: move some properties into root port child nodes
Date: Mon,  7 Jun 2021 14:01:51 +0200
Message-Id: <20210607120153.24989-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
References: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
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

