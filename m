Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CC6D0E
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 12:40:00 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso1291288pjh.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SmFnhaRyZGKmhh6YeRu24XJccjOmUgsYe3aUSqwEOJM=;
        b=sdrEyJmGy8XW5Tzk4vxJNZ8GlNfQeQ8WXFXrGGIx/uGcosQHu/5191zepwOkcbLF+i
         AOruGbLsMv4y19ByxfOYte2JeWh0dGSamkX9OMk8nWIeaZLsN5y4xBY3ZsfEtEuvCF/q
         Z1eDnT73strNZt2ZmehAlPjFXSQ3acTrOAFqi7oz67pNod5+7/cqpJes4zjp6yULS9wc
         0mDf9lWINdxUfp/4HMwcR9bZAh1KWSidqFYKdlxGGSsZ2sruUIgWn1j9WE3mjSsgrmiA
         Xj4fOscrKjbMUbKyNdHkRyCs25myAKjiQ2RmU2uJpemu1q3gXFyYUGGkOISY9k50vINO
         OT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SmFnhaRyZGKmhh6YeRu24XJccjOmUgsYe3aUSqwEOJM=;
        b=RIDjmQmnjK28aDYOogxBSOIWzm+5SdhbJkBBKjCG5rNlBUiRGsQUgAERxRWv2GZjaE
         khjPDffTUAmC1/g5wfwZIgv1m2AHq4XoHx7pkMUwP4VNGdHxwZI4MWs6BONAAJLMXdvI
         AfB3LpxCqg6BoN2ShYVkGfZMxsA1TQLhft0osbNGZ8QuF3rrOjsI+uanAIbv9PafVDwp
         KPd0cHACFwj3tiNRFk8GNM7FP+TR/R+TFp80cMmbWqo266+qnBsqmN+3TZz/Fx925/Ji
         VeTR/tgx+CszIuwVo9qQaoX5VbRvfDIVklcohBoTE1IZKKwPcrtf+TUOtgWr/4Ws6/Zc
         Y+Yw==
X-Gm-Message-State: AOAM533KUvt8hyHGlPXiA7zE86wKbFXmHlx3U1E1QHHmg03Gz1eqil1N
	BMp/K1Fp3n3VQFo5AqQ4AyU=
X-Google-Smtp-Source: ABdhPJwek5HN1INa68+/CiKVytrivW+Z1sTojuAw8HeUS+/ee91/803ebFNmLRdXTFarQLbaJDtvbg==
X-Received: by 2002:a17:903:185:b029:e9:9253:5328 with SMTP id z5-20020a1709030185b02900e992535328mr2507786plg.58.1617885600491;
        Thu, 08 Apr 2021 05:40:00 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id e65sm25831311pfe.9.2021.04.08.05.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 05:39:59 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [RFC v3 net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt controller
Date: Thu,  8 Apr 2021 20:39:19 +0800
Message-Id: <20210408123919.2528516-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408123919.2528516-1-dqfext@gmail.com>
References: <20210408123919.2528516-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
RFC v2 -> RFC v3:
- No changes.

 drivers/staging/mt7621-dts/mt7621.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..ebf8b0633e88 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,9 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1

