Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CBD2C85
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 19:20:52 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w29so21755822wra.12
        for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 11:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8emgIDtuoDb/KTGuXsO2IrxOnRema2kfwxIq3fB8B60=;
        b=JWAJWIiWE6GODDWWpWSYO3qpXTP6AcsP52EWAv/BksjWUxutRXe8h0lmWamlivPSyV
         L3OBRS9Aexm5cBZjjpxqsx2pMYTWxwC72siNBdDC/15bAJK6h32b/LOxd0m4TluSKENs
         rkDNfX+AHWZVniCHAQzfLoUm3+Z3b5W7hTmf0v2a+2lUONCDm0g4QVVBfTuGyz6D/HB0
         GD2iBc+SqYVWBoOsEsemorNgbvS4WZPhkPA/nUICJbkp28wDUCCDWuQkf5umCf6GbUX3
         6ClihPeZtiCxYh0aZxzeWGX9ikOuR+5IHJ5anzqHjXBbaPZ+II1veuFtzIJjiz1bb8sH
         fApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8emgIDtuoDb/KTGuXsO2IrxOnRema2kfwxIq3fB8B60=;
        b=n0tJo4dgi7qq8cIMmVMlQgE4CPAFbEalNM/fCMJxqtC50a6e8UNssWYeBasl8bKAO/
         WQftlveCH4B6lUBhdud34Ul8/wFFaXsYUsovt7NHHTtw8iO/rUbSJwj5n2hiW5Uo7iGb
         oZwsTnfngMrBL+NaL5QRWTGCKib+ZIG1ER3Nxqg26cBaXrgcqA4r61o7grCn8XX4YM5F
         JnIebUhJE+cO1ONRbbFzWnidiZR0PWklkLqdWPHlxHIR4qEBqnLqfz52z/Oiq13PvGha
         kwiX3GBy3uCZrDr1G59UaPqelr57mPHHIQtFLh7QY7tgFKpeLD1P5fmXQTvLueOGykJl
         29bw==
X-Gm-Message-State: AOAM533L1p3TOJHw29vpRt5joeNAuqUtFasFYCxh9y3pw2+9GzPc8hbb
	pT2V1n5jSg3TmGoPpTdR+qEGcjffOCQ=
X-Google-Smtp-Source: ABdhPJwHaKbtsunnXcaf0w+tj8mTpOpVk4EDgnKPJ1kRc4SR029JSxUCdA0gQgwP+7nK3ifkANpzLQ==
X-Received: by 2002:adf:f0c8:: with SMTP id x8mr29435221wro.290.1636831250396;
        Sat, 13 Nov 2021 11:20:50 -0800 (PST)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id g18sm18530442wmq.4.2021.11.13.11.20.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Nov 2021 11:20:49 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 3/3] staging: mt7621-dts: remove 'gdma' and 'hsdma' nodes
Date: Sat, 13 Nov 2021 20:20:45 +0100
Message-Id: <20211113192045.32153-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211113192045.32153-1-sergio.paracuellos@gmail.com>
References: <20211113192045.32153-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers related with 'gdma' and 'hsdma' nodes are not in-tree. Remove them
from the device tree file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 38 --------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 6d158e4f4b8c..644a65d1a6a1 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -146,44 +146,6 @@ spi0: spi@b00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi_pins>;
 		};
-
-		gdma: gdma@2800 {
-			compatible = "ralink,rt3883-gdma";
-			reg = <0x2800 0x800>;
-
-			clocks = <&sysc MT7621_CLK_GDMA>;
-			clock-names = "gdma";
-			resets = <&rstctrl 14>;
-			reset-names = "dma";
-
-			interrupt-parent = <&gic>;
-			interrupts = <0 13 IRQ_TYPE_LEVEL_HIGH>;
-
-			#dma-cells = <1>;
-			#dma-channels = <16>;
-			#dma-requests = <16>;
-
-			status = "disabled";
-		};
-
-		hsdma: hsdma@7000 {
-			compatible = "mediatek,mt7621-hsdma";
-			reg = <0x7000 0x1000>;
-
-			clocks = <&sysc MT7621_CLK_HSDMA>;
-			clock-names = "hsdma";
-			resets = <&rstctrl 5>;
-			reset-names = "hsdma";
-
-			interrupt-parent = <&gic>;
-			interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
-
-			#dma-cells = <1>;
-			#dma-channels = <1>;
-			#dma-requests = <1>;
-
-			status = "disabled";
-		};
 	};
 
 	pinctrl: pinctrl {
-- 
2.33.0

