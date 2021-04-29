Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213012F82
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 06:22:12 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id 20so30247596pll.7
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSIa7cBeJXNMWSKO0g+y/qJaGWxsHGcVnf++n7k/uXw=;
        b=BRiQ7/DW5YHwWO7c9iXHCGkrjRhxLKv9pg5hGtzg+gFnL9Nvlgjnkf1yYCu0SW5yzJ
         AUjvGQyY3l+d5rz7Ctg7S615v/rQYvfgcRIKCFMXFpGPndl+wZ/EORLtJY4B5mn2QsCx
         UGzG8fBwRxkBDtHatHgiZuG9zf2iIYKdUCgvtvjKOTzH7wz1MQ/ngQo/AnKKFOcIWeKX
         4nkA+T1OKeAf8aoVn1IShyvoyJKyGhDEok2cmttnKyDIlr4Md7Rsp+NDMA34Jdp61HA+
         qrl8FT1SuRMiTMzD0oZYF7sDt3VUkCbS/74b9+NTZSB0nwyfjIeVjio6OoTpTBYFuJZs
         ZBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSIa7cBeJXNMWSKO0g+y/qJaGWxsHGcVnf++n7k/uXw=;
        b=LPTKKkULsuRB/TFlXh4jJDMRTN/dLiTReHxWxIoQTA+1fw301URm4Z8VIjua0ErNRl
         oSXGCN5bhKtuSI7KWKxrfShhENGSRI5C6LO/jZ8pRTqiBrZx/Y8rIBrJTzXYYcxvWRpT
         DkOSdBYyuJfyM96Ae3QQFTK5nNDkg1G3UAecMxX/CnOZ2HH9paUT4XnNiISDQwpfW1D8
         iCVsnH7lSqga2Hy2F8JxYCJDSuqCukGRGoHunjmwP3drDaYgMc1z+J2Jx4CvPsPa/2n5
         R67CficBXrTEEhghG30OrI0bUtzRomWL/veeUJ8LagL16LcTcDX6xtqPtfmoSMaO98Ru
         35oA==
X-Gm-Message-State: AOAM5328YemvXz9vbQs1CqAv0khOLmgVsyQmZEa7WbBHNLi4LFwd/mfv
	lDkVGh1fI6KzmP8EFebR3r0=
X-Google-Smtp-Source: ABdhPJz78bH+9TBRL6WkYhA1HjaOrdEk/3am69Dj1OmvsxGayn11HtBOKdGvNOoxsDI1jcc4AlHTUg==
X-Received: by 2002:a17:902:a582:b029:ec:d002:623b with SMTP id az2-20020a170902a582b02900ecd002623bmr34077406plb.36.1619677331784;
        Wed, 28 Apr 2021 23:22:11 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id b7sm1431008pfi.42.2021.04.28.23.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 23:22:11 -0700 (PDT)
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
Subject: [PATCH net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt controller
Date: Thu, 29 Apr 2021 14:21:30 +0800
Message-Id: <20210429062130.29403-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429062130.29403-1-dqfext@gmail.com>
References: <20210429062130.29403-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC v4 -> PATCH v1:
- No changes.

 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..0f7e487883a5 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,10 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1

