Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDA71
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:52:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id o127so6352505wmo.4
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HcVgM2vyvgzDYevyg/QfJoz8h0kWR0tPVu2/nxnMK08=;
        b=fHmva84B+WM6w350eDqTkOl8FhXPDtg3gQ5ij5heAEjBqaqYLXNqQN5dO1WgFamQbs
         +k00beVVVRps76Mbh2kjyu65rGMjX10gdZVeRe0KOPBSA9EdOmMB5F5tEQoUv8jtPa9C
         4k5qWvlFDFMuw/Nz9BVvidJhnBG8KoDv+1DiWlrXTktjkbWm/2enCyy8+Xto3h2/Y921
         /aebEBFYS1YSCUMqMR2qr3Cg2SyyDNUwWdcVQYKlWl93rs59LtfJjLOXb8gxYHn92toB
         7dTs9hW2KMddOLDUscODrpvQYCwWgwF475QzX1h9+/M9g9TsuD3QQTdYYlbFCASuFqVl
         qWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HcVgM2vyvgzDYevyg/QfJoz8h0kWR0tPVu2/nxnMK08=;
        b=saqpwQ52A/itQdQras+t/VB3XE+WlQxaVOzEo8vrPHVMPM0PgcW/GNWeeSkzl2AJAw
         hC3TiLx1uzfZhmSPn3hoBmABAESLJ+tzY+PMt6wYavjFncAJ+O1gkzeaxtnDD95dNtMN
         gHcRNJxv05Lw95gonN/WYHNIgW4cjSLpnUK3Ctn0Nv9nC2iZ9W0yX3LnSLvTsVFBMYWy
         NXsqkoAIQWjrdoDYX1jQY0eRXq+1zhwCUoVgbfIXVtV/RUrH7yahRPIu4JKpJNWCIYAg
         RQxttzeYOE7u723CV7JenNykxQsRsoshBmlsOt0DhjCauJKcG0b0vaded95UgTlzf28t
         P7pA==
X-Gm-Message-State: AOAM530OnrsmHgth7yArhGkeZTjKbxnqPhD67fGBZBpVbZTtDSrNVsJz
	7n0rxIpQj0WSsZwlvfRjeE0=
X-Google-Smtp-Source: ABdhPJzTLLM5AeDPLomNArvDRyEqjwe2fWIWNeSysSiv1Jwx4GEpVY2WfenAYWcZ9D0dRaEgoGiecA==
X-Received: by 2002:a1c:e387:: with SMTP id a129mr14667277wmh.61.1620456757203;
        Fri, 07 May 2021 23:52:37 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id b12sm11638010wro.28.2021.05.07.23.52.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 23:52:36 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH v2 2/6] dt-bindings: phy: mediatek,mt7621-pci-phy: add clock entries
Date: Sat,  8 May 2021 08:52:28 +0200
Message-Id: <20210508065232.4882-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
References: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 SoC clock driver has already mainlined in
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
Hence update schema with the add of the entries related to
clock. Since until now things were not properly being done
we mark also 'clock' as required in the binding since this
will be now the only way to properly retrieve frequency to be
able to make a correct configuration of the PCIe phy registers.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
index 0ccaded3f245..29d4123323c2 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
@@ -16,6 +16,9 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   "#phy-cells":
     const: 1
     description: selects if the phy is dual-ported
@@ -23,6 +26,7 @@ properties:
 required:
   - compatible
   - reg
+  - clocks
   - "#phy-cells"
 
 additionalProperties: false
@@ -32,5 +36,6 @@ examples:
     pcie0_phy: pcie-phy@1e149000 {
       compatible = "mediatek,mt7621-pci-phy";
       reg = <0x1e149000 0x0700>;
+      clocks = <&sysc 0>;
       #phy-cells = <1>;
     };
-- 
2.25.1

