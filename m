Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613E2C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:35:58 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d198-20020a1c1dcf000000b00322f53b9b89so375962wmd.0
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dpCU4j+oM9YGOD4y3y7Oa6rUUpPPKjDrlLRmqOR36sk=;
        b=iY1kX6mrl6cxla9TSCmHDUJBj2kWmn8XKc8tumupoh9yuZRy0yUFfPSY6vU7wAk8FU
         RY47luJLZvCKrP0I/flzYZ56RxGaNUfvwjdw4TsnM2H7u3XfjoRCi/Gl4Y+nX5BuSWCH
         XuG2UyjdSQBxG1+EtzR43nuf8O/0M5sNcmcf6rjB6D9C0KXL34GJRVwYvJywJ7mcrdBQ
         0OTo74teJZhKzOABLpzidNZY6vI17U60YoNIJuXq3nK2o2HIFJF3bvWj1XyeE1CF9wpw
         Y5XE9fGHJg8a0iR1L861iCO7RrV6LepjRzmT2oK96P+HS3P7Iy/7e5FplZDMyA3ZsLQ4
         Rv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dpCU4j+oM9YGOD4y3y7Oa6rUUpPPKjDrlLRmqOR36sk=;
        b=V90h31uFmFQ8sERU1N7pGFRvOkuUdVNVoM3L54V6W439+g64ST3WqVZFGz/m05gWE1
         U/0+HMrhT6iOCQffo38sg7i++h1S8AbuI4cHPTPvTrxdH45tHIPSl+kbykJ3RYrKkjaf
         KydFGyqE0pp25CGR+fWiuC3LmHeJjQSy4AVPyvxTf84EDeThCDTd7idqbtcIT8mhy3me
         SYMA9KY8Nyc3qkSM7bvdKJhOKw9Nycc1wSxF69Bt2Yrx2NsiQgPkhk2DG6th1+gwPabj
         JWGcB7GGsHPxeuW/LTyCVIrTxfPtv/NpnS/Xp//h2Z06zWdq+eYOKdWFKfQBEBQICAOi
         6WXw==
X-Gm-Message-State: AOAM5339FJhEcdZ3+Hg/GPM70FvGbuweWNzmN8Ts/9ODA1GFRnlHSxTA
	0cb8/6smqmeuASWKKSsfSG86VLLfgnE=
X-Google-Smtp-Source: ABdhPJxGN8ENDISyV6q9icutr5TLjAD4tx8DNmo7o4nmtwdCcARbfGTBCup97jqW3QvQR4HP1y2Ajw==
X-Received: by 2002:a1c:2541:: with SMTP id l62mr45352324wml.11.1634571356076;
        Mon, 18 Oct 2021 08:35:56 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id w2sm12798647wrt.31.2021.10.18.08.35.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 08:35:55 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH] staging: mt7621-dts: get rid of nodes with no in-tree driver
Date: Mon, 18 Oct 2021 17:35:53 +0200
Message-Id: <20211018153554.10471-1-sergio.paracuellos@gmail.com>
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
index dd7d06c5f234..787220d4d3b4 100644
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

