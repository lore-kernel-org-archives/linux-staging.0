Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6142C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 17:02:10 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so566554wmz.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0H3Y3uO/s/r8ysABt99h8Ah8DOWdDP7a3rvEdW2NVck=;
        b=GqzDZbFNESz5s3nJze6trTIqqEw7vVhvCjMHoWMx6jKQHw5uHWCYvKQKy83jQNj4jV
         xBHRIW2lYISI4vbg3VtjZgY46r6udnJrDKGZ8dYMelTjhgLlri1yvJD9v5fdAJqP/nTB
         TF1oEnTgJJlZ0/D9lWSRP8uHH9inyN+LTVWUVBMBcUy6o3ZqrxZpK0A9MFz6l73fb++m
         MFzpAt72OekGCGovfV23Yj5IXJ8pe/4gLC4CWxDo+UNyRQKAkOvTFdajCCaETgMW0Q3z
         0iQJgxPv0+BEAbQ8MFQGHAM4ohVl038k123LJ1QVpi1v3LEeY9ymoneCH5ssAaCuUhw3
         FinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0H3Y3uO/s/r8ysABt99h8Ah8DOWdDP7a3rvEdW2NVck=;
        b=TPV4G5FRo3IlAcc13T0m7IjD5ujpky6k5pJyoNkti9k74WAf7kAQVsHKBIIDlv6/GP
         7VnorE6OWzQhYmRWRHGgDRB0y4pBclqgvT8jmQrZUPcHMmEl2p0ycPJA1XMrMFpIkwqh
         IyAePVmZNXg3V4h5JsqsTpLUTQ0ZmRGDfeyhw5DbKvrQpeU6Fi+f9dMP+YX7wtjtTwvh
         OQrn/z+vNrdbY+qkKEf5eqXKypdATWCwqbiW8tUoMifUtJ+8FDdHDIOyXFSQ27ZDVcxQ
         +Naw14M45jSRG7cXtvpj5uXBepdWgLEKlTDcQeoGPiky4UNL6Wy/UGYjHJSpSbH5yRLt
         78kw==
X-Gm-Message-State: AOAM533B/zq9WW1nat1OOymDVL2tQVhoKLjnhKm2YklOeP5EQFX70gcO
	UqTuyiFi2roaYbBXu3Uappu2q1C8Z98=
X-Google-Smtp-Source: ABdhPJx43bJ/z3fp1sl708FNJ3zgy4AZzGpUHNGE5nwmiSxWjcGefQAU7C6qrShA7DhkoMoVgkqy8g==
X-Received: by 2002:a05:600c:2104:: with SMTP id u4mr22616wml.195.1634576528287;
        Mon, 18 Oct 2021 10:02:08 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e15sm12879703wrv.74.2021.10.18.10.02.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 10:02:07 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2] staging: mt7621-dts: get rid of nodes with no in-tree driver
Date: Mon, 18 Oct 2021 19:02:06 +0200
Message-Id: <20211018170206.11959-1-sergio.paracuellos@gmail.com>
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
Changes in v2:
 - Properly rebased on the top of staging-testing

 drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 509b4883f42c..ea9cbc6b92cf 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -100,28 +100,6 @@ i2c: i2c@900 {
 			pinctrl-0 = <&i2c_pins>;
 		};
 
-		i2s: i2s@a00 {
-			compatible = "mediatek,mt7621-i2s";
-			reg = <0xa00 0x100>;
-
-			clocks = <&sysc MT7621_CLK_I2S>;
-			clock-names = "i2s";
-			resets = <&rstctrl 17>;
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
@@ -358,20 +336,6 @@ cdmm: cdmm@1fbf8000 {
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

