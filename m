Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F3970
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 03:32:47 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id s19so6675540pfe.8
        for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cU46aoQaP3zsCAzQqoMqrX6Zi5wdFXKEcbXbGkFJHJg=;
        b=Py2UV9AnBv1/ncNmbnmTRHpSvk0WbcHX9zQmnaASFi6ATMOgoSsXAsOAMjegTa3vBH
         rSzQrZOXF17nMS98S7SoQT8kLVR5p7G2AO3hetRK6dTeHVG39sNdYXxI+CtlWUkeYyr/
         Q3f0qNRvqK8fB91FNP1hi7W2H4kNHynfovvdtyyI5CgkZ+BYskpmwAL/wb7qHdZf2TQa
         6HNF5dHPDvIdhT5z2GKZzC3p+KVaulPugVp+nFtz9LJyHTwq6rZqiJ2gAqf/FXIGAE2L
         vlaiwOmWMFgS938CHSzTrmujuMoYlX46SOKpl88ba9j5NTuBIHSY3pa0mIZeiE2/R2Z0
         i5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cU46aoQaP3zsCAzQqoMqrX6Zi5wdFXKEcbXbGkFJHJg=;
        b=RJMS6U56iKFQGHlpf/foOGCnD2mokeHiBq5TrANAfNUEAWDrDWfaLVQ4OVqdGxIasx
         ouWkWeXLrLtozbnz2cO6jMlAjoktcU7m9BhgFljldAFIrQaVxqwJyIePMKGhxqMRVcxD
         tCQs9/EGKK58FixgRBEsef87YdTYQMXRj+Joxrv4GFgBAeT4KV45rec7luQ5LS0HmRTG
         RZznejxpCRma1SAALOXi8P2Lxn3blxcbgef0VFP3D5cj6Yo7S+oovAzLkQIPMOWsyaPK
         VyOMxffM5Z+PqdWHVxf2ZhL/BBtb82PgzPUbhnLqlwfpcnOoa7N1lxleuUfHMOm2RH0p
         4jTQ==
X-Gm-Message-State: AOAM532597sSfSB19yz2GE88nS2TP2EOCWInJh1BWyRV9lbs1omYA1pO
	G3Y8fGEvenBR7yKmFs3LwL8=
X-Google-Smtp-Source: ABdhPJyg3qe/ZpL5oLW+mOEa0aXvCaTmjpc+MZIEIy7hvq34/CDsFAbCKFaESSa4EpddYj5LR1b8sQ==
X-Received: by 2002:aa7:88c8:0:b029:2de:7b37:7d23 with SMTP id k8-20020aa788c80000b02902de7b377d23mr5902108pff.59.1621395167152;
        Tue, 18 May 2021 20:32:47 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id g13sm8244587pfr.75.2021.05.18.20.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 20:32:46 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/4] staging: mt7621-dts: enable MT7530 interrupt controller
Date: Wed, 19 May 2021 11:32:02 +0800
Message-Id: <20210519033202.3245667-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519033202.3245667-1-dqfext@gmail.com>
References: <20210519033202.3245667-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v1 -> v2:
No changes.

 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index f0c9ae757bcd..093a7f8091b5 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -437,6 +437,10 @@ switch0: switch0@0 {
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

