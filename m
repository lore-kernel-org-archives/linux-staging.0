Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2632C80
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:07:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id s198-20020a1ca9cf000000b0030d6986ea9fso5651821wme.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJQ2Svt44aVRU7mmXuvsLp4E8kMwPUVU5OvRMEQZ2is=;
        b=Gs0notxgowpBUc7yjKnU7np5WLNl6gQYaqi63vOxk00LVeyXZFyC3ua8tA2IVchyU9
         qxBSrnyAxD9T+dQ2DvTf7/PndVJcfpbtfSKaqiPN88IlaAjW2Lp8ovV9g6NIux7INWYD
         SKC5Vrh2W+aLMObCP5Sy2elIwB55GD3MXP5LASowRLGZ7VPTleno849kgleFgwlxgDPe
         5ivxS1nmJS7BadfciOLbmU0be4/jpTR4xhV9G344vd2R71QlDc+8bv2eQfiaIbSWzqEi
         6qnFANMbPCSpE7uqmcAp/m1ZJiz7y+DnH5ijd3HIRlYthvwTegOj5raJ+oayyO5IbPGv
         EJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJQ2Svt44aVRU7mmXuvsLp4E8kMwPUVU5OvRMEQZ2is=;
        b=dlacUQiz+i2mOQd6BDCtVJzj7ts3I0q2PclGl9msLKf7pDbrRMIOfIvavW2L6Bdx8m
         ohPFLpIiVz3UaYNQ0DDvy3V7NxKMOYLpmot6LqaqWtq6Z6ZE3UFVkBPytty3zjSIFMlL
         Dq54uIp3frfzeB5Naz6jODAyPZn0S7YTfIjJxA2mNJrM/VHRJQL6ysKo6lwZk7g7jAoD
         BuAgXYJkLeBqMoQ9FLrfo0iI/oCIYI490vbKo5CUCS6MzZyBQJL9enbkN0qR382RT9pt
         elBrKz2nRVmDwylSZh+zOrDfnfTTU5LBBi+dpoBvxkGeACmOODp7ktdY9zfANt/MjEr+
         6PrQ==
X-Gm-Message-State: AOAM533cPxmhzkIOJDqLH7gFVPOZLOgXobGQvNfJljYU2N8tvJikqTFj
	XaqDwsZqnaKmb8Zr46rchxMOzogtLU8=
X-Google-Smtp-Source: ABdhPJxzwTQfUnR++UeHf7W1uqGWakEa3YzHcdwPUJ6omXf56H29MWs6VOaIB6ZPUhkymPnbhFpWWA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr36978566wmb.140.1634454418411;
        Sun, 17 Oct 2021 00:06:58 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id c7sm11474271wmq.13.2021.10.17.00.06.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 00:06:58 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 1/2] staging: mt7621-dts: get rid of nodes with no in-tree driver
Date: Sun, 17 Oct 2021 09:06:55 +0200
Message-Id: <20211017070656.12654-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes for 'i2s' and 'nand' have no driver present inside the linux tree.
The normal approach for a dts file to be mainlined is start with those stuff
which is already mainlined and get rid of the other stuff. If needed it will
be properly added afterwards together with the suitable device driver. Hence,
remove both nodes from the device tree include file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 72b99d8b4647..fd4ab4006ed8 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -102,28 +102,6 @@ i2c: i2c@900 {
 			pinctrl-0 = <&i2c_pins>;
 		};
 
-		i2s: i2s@a00 {
-			compatible = "mediatek,mt7621-i2s";
-			reg = <0xa00 0x100>;
-
-			clocks = <&sysc MT7621_CLK_I2S>;
-			clock-names = "i2s";
-			resets = <&sysc MT7621_RST_I2S>;
-			reset-names = "i2s";
-
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SHARED 16 IRQ_TYPE_LEVEL_HIGH>;
-
-			txdma-req = <2>;
-			rxdma-req = <3>;
-
-			dmas = <&gdma 4>,
-				<&gdma 6>;
-			dma-names = "tx", "rx";
-
-			status = "disabled";
-		};
-
 		memc: syscon@5000 {
 			compatible = "mediatek,mt7621-memc", "syscon";
 			reg = <0x5000 0x1000>;
@@ -355,20 +333,6 @@ cdmm: cdmm@1fbf8000 {
 		reg = <0x1fbf8000 0x8000>;
 	};
 
-	nand: nand@1e003000 {
-		status = "disabled";
-
-		compatible = "mediatek,mt7621-nand";
-		bank-width = <2>;
-		reg = <0x1e003000 0x800
-			0x1e003800 0x800>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		clocks = <&sysc MT7621_CLK_NAND>;
-		clock-names = "nand";
-	};
-
 	ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
-- 
2.33.0

