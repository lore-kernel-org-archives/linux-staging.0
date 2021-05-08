Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A522F80
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 07:09:36 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l13so11354389wru.11
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 00:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HcVgM2vyvgzDYevyg/QfJoz8h0kWR0tPVu2/nxnMK08=;
        b=oQBOEU8joU5LNoeSGDS2505fZ52pdijNw8EXDD8PUyl871qBQ+EUV1zHQGNwO0ZrGS
         u99bMzj80z7cRcYzkmFiE2eZFNDAXLhnG2BKMHfS61rBk4vDTBFWt2KjDwBGdOTXoTCA
         6yUeU1YB/04dP9XgL3i4u7p83VPQ7lc2zhCq0ZAmWlInVy1VuQw70Y7eFJILijFpFU29
         gc2pKGXAURTVJvZWp5cdPZGn9eY1+/rANSMJLHh6up28IIvCzhwSoERCvuNz0t6N4ygS
         Hg53jVkGXckGQRjzq/34ro2gU3htal2yfCibZ77ujjn1AxoZFp7swGtJzoX2rcBjTX6/
         rgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HcVgM2vyvgzDYevyg/QfJoz8h0kWR0tPVu2/nxnMK08=;
        b=CUnnFhEUB1/0WqcpTNaZkBfZQWIXl15TAMHvo2TeIdTNVrxQchrw+yHC+kt6nxFTQS
         ljpkaCH8JfQF8XHDTNVuPjisIbZ8Gj7GUDosDz+J3YLaUiRxCQU2Vc5hYMBesL6m6Xo7
         vmnSbIjHvaG4h51islvcSCqK+GYgFGLk+oFGGyptHfqjnLDnea6wllyQ4jUJudsFKPwc
         Eui0PYVpeZJR+NnQPlQxbkTPa+y6CycYx5ueH1PAYWNPNR9r1rZVp7YYRtC6RKLCcTmF
         zbRHyEP0uj0UWHBXZloOucFQe8DU0wP6bQzECV6DLXUz4QF10cIxKNy1//Em7XigdlTf
         vEsw==
X-Gm-Message-State: AOAM531cVP9e3OucKgeOP9LlaYmZ4ULW6dbC2caZXvEWSfbeDjCFHOcY
	LZ7NCleicxxeYB6yhnFW3Bk=
X-Google-Smtp-Source: ABdhPJwv2tpuFMx/ij8r4UA+F3GGnnHZs5rMG0ie4Q88HHaz7t2ijVZwXBdGKTtDzNHE2yUl+JWpfQ==
X-Received: by 2002:adf:f683:: with SMTP id v3mr17358197wrp.133.1620457774843;
        Sat, 08 May 2021 00:09:34 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id s18sm11740345wro.95.2021.05.08.00.09.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 00:09:34 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: kishon@ti.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH RESEND v2 2/6] dt-bindings: phy: mediatek,mt7621-pci-phy: add clock entries
Date: Sat,  8 May 2021 09:09:26 +0200
Message-Id: <20210508070930.5290-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
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

