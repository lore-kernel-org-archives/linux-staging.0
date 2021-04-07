Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E87670
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 04:51:14 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id g10so8703434plt.8
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 21:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V+6L2oYqEs/QSzIuajaQppBr7eHY4K1Hd4WvlAlIz/c=;
        b=UeAdH92teKX9nqcjZrk6pjPXGRY/rZBLvzZum7GHe0oWmKCSm4tAQ4eAOvRQAT5pgy
         PF7nSdVhu89VA+F1sjXLLRN9YSm8CeaAXQm/HThDqjJ/5qxZTBR0FRr4iPTXGv44eaAh
         mn32RaEya6zyckqOH+zEUfmh1v7kWe2tPpGev7txR5rly1tFsWI0fsbXkxy2kYwdtN6n
         rJEZFeVZV7hA743py53NBrlmr/2FAbsMfrg0Y+ugHTzfLkphin/HBXO1pEkySxvaYL3O
         Ma86/uJ93tkIAFC9A8krTtyTUfP5xZ9R/ZuHxTfrbv7ljpg4SB2C+Y4kOLzRpAWdVssR
         rg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+6L2oYqEs/QSzIuajaQppBr7eHY4K1Hd4WvlAlIz/c=;
        b=E/oAf/h3aJbcAi+SvimGYbBwS/QfA5EUDl47b1UOwlPbeGxODsUKDcAjxH+IHdDnoj
         YwaBzUUgoYqW9a4eawuIdVtxRiGxbbrxGPBt5TqCoHVGW7i0FHlDXwm1ZzDq3tAgJykl
         IClZYLAEHwUw86fcJJKTgOaA2XH7eTPC+xFy28VKswbaFrs+nIxLbdH2zp0HnHWix51b
         U4yVu+NSQRwivSpXOxFq0lI8ia1wUYqLYgXJd95LrbY49pcXf7r548XNiI3yAGtQNdNE
         w3QriP/Ywr8WOUsI5gKEGAMZMkqP9Nk4gmL6dLW6MQgUPyas/hJXd06Em5dykiY2qMxb
         fyCw==
X-Gm-Message-State: AOAM530Xgc/kPtPcgGOpIvls5AO4P6bACvsEUfntci6vNWyaQmoIWHCm
	0t5dW1HVpJFMRhGedcqYffc=
X-Google-Smtp-Source: ABdhPJwwV7+KRnS4AYoBBARd+AzL4vj5vm1mLsxuvTDRCFHHfrgCqfllBL734AbDkmtPtKYUoSdcVA==
X-Received: by 2002:a17:902:ea10:b029:e8:e2e9:d9a5 with SMTP id s16-20020a170902ea10b02900e8e2e9d9a5mr1414313plg.22.1617771074590;
        Tue, 06 Apr 2021 21:51:14 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id n52sm882679pfv.13.2021.04.06.21.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 21:51:14 -0700 (PDT)
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
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [RFC v2 net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt controller
Date: Wed,  7 Apr 2021 12:50:38 +0800
Message-Id: <20210407045038.1436843-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407045038.1436843-1-dqfext@gmail.com>
References: <20210407045038.1436843-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC v1 -> RFC v2:
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

