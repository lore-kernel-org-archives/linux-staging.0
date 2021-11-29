Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7122C9C;
	Mon, 29 Nov 2021 18:26:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t9so21857325wrx.7;
        Mon, 29 Nov 2021 10:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ttdy58tm+LmXBv1FcpjRYVHwwZt4Hb7jA/LU/P8ugo=;
        b=GT26leHjJpkOtelhjyR9gLeFjKdc7gTo+QE2VS7AFybVpDHwh2PozKE1zwaNK4QzDL
         3dJ/Q50TckmgrhdX20Uc3DNOOh+patKlwsoxAPFpxrob5PwZdyD7qahwm4ZSb11pYRdo
         VmXvg7DHyqxFhQ6vQM63ZmYNJUs8jacafS0cR1lLm6g7ikLbVI94JKwAyxXME52g8V44
         FAaT+sVskEjC3znsRBO/44prR8E29w4CSmA/PfNdXCyX7rRlr87YyOCotYtPHKjDZ0E+
         Eeb3w5YCJeGJSTxbcaYM+FiNMyOrZDhe+PavEpADo8mh+c6gPZON0MYj5PAgbUqs2YdG
         J4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ttdy58tm+LmXBv1FcpjRYVHwwZt4Hb7jA/LU/P8ugo=;
        b=V3hPFmtNn/vsIPbYEw80kHRnL4L/2hvCU5dGDDvgryVeGUYhJ/XvRIlp/6ARAXJ9k6
         /8hpR4ySJC978K/zJcdXpheTte/e+NNL8Icr8TbsmbQGu8MqiLFLEJQcFCOTCo11NIEF
         oQUvc1ku64nXdkUjka5WjIbqtCEfzZHU9ZHVdpEO/nkPFxjcuHlxOdeeF2rO4hqyvYwP
         JJZGIFqlPUNSQMJ1iVkWLTn/Tw0Pdw3uJyGjDR9u797KNZid+x0m2MwMVfMEcRQ4N7w7
         7vivAis7mqLzOe1lROuHG4jSNwnTc5/mnJHSNA7GOGaUmw+w3gbW3fDQ+jH+xUGlI/k2
         HsXQ==
X-Gm-Message-State: AOAM5304fTYQvSpqwqWc376oxHVxSee5wa5zMK2GNWOLq/NWTBIJosCx
	PL7Q+ZTyA5g3masH07RCxEU=
X-Google-Smtp-Source: ABdhPJxJjHQhsAjD+1u1olPTV9PDVp6oC2fPjSoeFCbNRtlMuQSFYOaki5HkEpUDwcfnV2Z955wceg==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr36102165wro.461.1638210408159;
        Mon, 29 Nov 2021 10:26:48 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id o12sm85907wmq.12.2021.11.29.10.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 10:26:47 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	nicolas.dufresne@collabora.com,
	mchehab@kernel.org,
	robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	p.zabel@pengutronix.de,
	andrzej.p@collabora.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 7/9] media: dt-bindings: allwinner: document H6 Hantro G2 binding
Date: Mon, 29 Nov 2021 19:26:31 +0100
Message-Id: <20211129182633.480021-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129182633.480021-1-jernej.skrabec@gmail.com>
References: <20211129182633.480021-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner H6 contains older Hantro G2 core, primarly used for VP9 video
decoding. It's unclear for now if HEVC is also supported.

Describe it's binding.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../media/allwinner,sun50i-h6-vpu-g2.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
new file mode 100644
index 000000000000..24d7bf21499e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Hantro G2 VPU codec implemented on Allwinner H6 SoC
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Hantro G2 video decode accelerator present on Allwinner H6 SoC.
+
+properties:
+  compatible:
+    const: allwinner,sun50i-h6-vpu-g2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun50i-h6-ccu.h>
+    #include <dt-bindings/reset/sun50i-h6-ccu.h>
+
+    video-codec-g2@1c00000 {
+        compatible = "allwinner,sun50i-h6-vpu-g2";
+        reg = <0x01c00000 0x1000>;
+        interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_VP9>, <&ccu CLK_VP9>;
+        clock-names = "bus", "mod";
+        resets = <&ccu RST_BUS_VP9>;
+    };
+
+...
-- 
2.34.1

