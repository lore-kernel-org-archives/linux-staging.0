Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC72B2F9A
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 06:22:04 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so6685741pjb.4
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 23:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dl1eNVmQIqNdeNFjNl1CzKrnIruzMoK7ySTcHQEJGcM=;
        b=Sm0Bv//igm4gX1nnNiHZ5xJzmlEYfBdAy25kx28ws2Xny/qTVqGaFiiMqE+EYD9UdC
         DLM00f4wXSr8z8STj2/Nyug7EzNlwTq7g79ztypk+9xE0F6GpfaqycwHejhQt9Uo/pIo
         YbYfgZkxdxWHxot602HCTCJZofgCZ+0qWaLY8rtZMjCXB/kkvga85OePVBzqMosz+2vu
         B7xJ5bT8cfzg0H3dQCzGBAgggrYgDH8v0LLd19v21fKY+XRx/Lhi+84Wq3qt05gL7jtj
         oxMdIqIvgzqYS49LTcMi9aNqZ8PYJq47lvl8C+2LLa8x7SXL9EBf/31Qko/swy63RxXY
         E+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dl1eNVmQIqNdeNFjNl1CzKrnIruzMoK7ySTcHQEJGcM=;
        b=EGSjakNFa3bTszJMzUlKsO6GF1X7FWqL4N6r0Ch9MEViAq+tWi6Zhu1S6PAEb/dntC
         FJq3JlFrlDiW0knjr+cfFCWrTV2W9IqySXDi9i210PH7PmK/gQLxScDXK4pHdy2iSET8
         HFT/qmzHQ7aHSTLyoiqBffWYJsY1bptXPY4W4RPVMiQjbkOOTWLR+1QazR3EM0Jo9+EM
         kkNboFlkkNCY+y/M+ECnnV9BLOh99IRmtpTwJdfFOOyAIV3Hc2Zt8EL/xkHSmzlm4Bm/
         d7ViOsScS/7zjLaTZTMd/dwRu1ag8mDmkFukxZSWOBaYK1GCabTp/h+mNMvh0QJAiFoO
         lfQg==
X-Gm-Message-State: AOAM533F8++4mKDOLxjcutMCff4dTFKpbeuzuBOUj76Afi03rwPnSMfF
	02p6svpACw+zRMCoTXaRTMs=
X-Google-Smtp-Source: ABdhPJxSVVIoZPrDAm1+N3SJiKuKqytLqnLpkSWd221i3Qh8thNIzaXcyykHLI6m1Obieeh/QSiRcw==
X-Received: by 2002:a17:902:b703:b029:eb:59c3:a9b0 with SMTP id d3-20020a170902b703b02900eb59c3a9b0mr32975053pls.45.1619677324426;
        Wed, 28 Apr 2021 23:22:04 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id b7sm1431008pfi.42.2021.04.28.23.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 23:22:03 -0700 (PDT)
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
Subject: [PATCH net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt controller binding
Date: Thu, 29 Apr 2021 14:21:29 +0800
Message-Id: <20210429062130.29403-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429062130.29403-1-dqfext@gmail.com>
References: <20210429062130.29403-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding to support MT7530 interrupt controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC v4 -> PATCH v1:
- No changes.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..892b1570c496 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,12 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following property is required.
+
+- #interrupt-cells: Must be 1.
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1

