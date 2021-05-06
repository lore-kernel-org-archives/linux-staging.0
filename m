Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF6E71
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 11:15:37 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n2so5220487wrm.0
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bcj0pWWA8nFHZcaEeJrGAFY0Y2i6kRxQp4Wf+dRkrMc=;
        b=nx33U0MdKytL2LeL/A3OBCQcElimwWw/4yEPpHFwZbFDqisrnuREQLuAZyx6jvlrj5
         58b3UFV9rfe94VikNAaI3ueEPEzBPPI+LdGlhP6ZOrbhn0oDAzn2XS6uyOGvYA+2NUb4
         5/wGOKqulsUeNdvxzpb+ULOH/m6a1ggvUUwRszekCdlmOPSxOU8HFgjoNrL8JRhlJ1Wz
         MBgWZ4VCPS70SSWsFZVNMqkVCE1i50s7huEVZEx40X2N5gG7VzNMJO0FJfVyfTpLvAt3
         6JrDRkA4VXw94kiB2n0LHLUE7Gywwcn/rSLvDehqTiOqtguPnMQ80xFnsF+znBHRqW6Y
         DybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bcj0pWWA8nFHZcaEeJrGAFY0Y2i6kRxQp4Wf+dRkrMc=;
        b=UUyDiWX1TnGjA2SlhcDaPOSOH62UZ9eqliMLeXN9ujgqyg7x2jAMoUUPQyGjqGraLZ
         UO2ICTo+tbrbZwcAJOhnPoRhfJ7/EDlcQxF4sUq3ChU0T/f4URabSNr+wVAU9QdsVldQ
         U0/9Cxk5mai6gbyxkLVuCKoQykM7WBx/7/fgIQf3Q+5j0cV8DSLo7lm9zWEE/sQ8iRMm
         2fqBs2zj4UT8++Ub1VaAJ3PlAdVFx/jJdREH6CUFRYJvuyas3HzaLJIJoatwcfdJSR3p
         Vnz3s7FN6FjNeFwW31tHN/O/siliuZ/mEO1NGHL794WZ6hCJs08NTIH7gt9DFSJRGZvP
         u+Pw==
X-Gm-Message-State: AOAM531IcBzBgHX8q8SelG6hToYT/7JyLcV6ELNOgS1oo23cP6SiCUjY
	b09hU6aLsJhdLW35dbKPQTg=
X-Google-Smtp-Source: ABdhPJxJ9grl1B/XxF/8opkBocpLHYlo2dk8HqNadhlsu7dvjNCfyEqecrxPRlVTxJXSiMy/6ZpGiQ==
X-Received: by 2002:a05:6000:1541:: with SMTP id 1mr4539384wry.364.1620299736213;
        Thu, 06 May 2021 04:15:36 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id u5sm3642433wrt.38.2021.05.06.04.15.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 04:15:35 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 2/5] dt-bindings: phy: mediatek,mt7621-pci-phy: add clock entries
Date: Thu,  6 May 2021 13:15:28 +0200
Message-Id: <20210506111531.21978-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
References: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 SoC clock driver has already mainlined in
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
Hence update schema with the add of the entries related to
clock.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/phy/mediatek,mt7621-pci-phy.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
index 0ccaded3f245..d8614ef8995c 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
@@ -16,6 +16,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description:
+      PHY reference clock. Must contain an entry in clock-names.
+
+  clock-names:
+    const: sys_clk
+
   "#phy-cells":
     const: 1
     description: selects if the phy is dual-ported
@@ -23,6 +31,8 @@ properties:
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
   - "#phy-cells"
 
 additionalProperties: false
@@ -32,5 +42,7 @@ examples:
     pcie0_phy: pcie-phy@1e149000 {
       compatible = "mediatek,mt7621-pci-phy";
       reg = <0x1e149000 0x0700>;
+      clocks = <&sysc 0>;
+      clock-names = "sys_clk";
       #phy-cells = <1>;
     };
-- 
2.25.1

