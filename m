Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71882C81;
	Mon, 22 Nov 2021 18:47:19 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id e3so81198078edu.4;
        Mon, 22 Nov 2021 10:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A4ae5Bs5ryByKDn+40799WBBmSQ5YSDOpHEJ7DwRPhk=;
        b=aQKe1zew8KzTyZPDYHDfRldGju4RXm6N/NULLgQUkFXJmsrVQcqZvRgy/13a3L9JIV
         +7Q7KC3Wa8f3eXxuQrDQUNPOQtNvQjxp9QKilSv/J1dM0yAIsN4gT3ZTAsu2bxTTdi5m
         psPbelagUacq1NI/ChW2igDsMQuEk3iteOO7wIkiFodt3Yi6pO1IOMCG9KpnkCg89PpE
         KPqvtXM0Ub6Kkd94Z3TenRNYGALPQXl3o36mHSCl3s7L2w0CySaePfM1Ut4f0oaIqZbV
         /8D1j/4jsU3CU8YyXvM3p8zrHK8veTHYEfx4AX22xhL+Baf4ZA0DihRiIK7TvInBUUAD
         KoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A4ae5Bs5ryByKDn+40799WBBmSQ5YSDOpHEJ7DwRPhk=;
        b=n/IzXCuqBT5J68EEAtEg+HJBpM8E1SEsFrZNsmZ0ooF6hfdywu6iv+GNJv//weocAf
         Ywtp7onMtt6Qncp13LxOyAZMUVYfaPkvkLMJ4XPeUFwV07rTp6xhiKZAg3rbOodI2PVz
         9yE6IUBkt2oZEF/6W5m5SXc1Xb9KNh/CQsDU5md0k2n71e1DIrN1Ye8RVstc1ahucuZa
         n9V0E6cTrC+esBPvO7ag9cbMQFU7om/xmEtFQAqPrH1jhwazGaCoen0g8sADzF3ZKJQK
         4Hz50KmMInFj1lp6hnQWWPHbQiHk4AxZ/f0lvxYf+TOJ6TIUyIQTwO3LDGYa+RoszLNd
         2BKQ==
X-Gm-Message-State: AOAM532ynOpOhqBgZCFzaQkEZ3kRvWT5VNes84M9kW1ZO2KA7R5VC3Fy
	m8+dwJOa/rLf2PWZ6Irp/OA=
X-Google-Smtp-Source: ABdhPJw234qk+H8u1V4KKQN7BY00PJiFvcfrfhoLFVaBXHGpDNuMEOKtFIDgZuJomIdStFViYyWcuQ==
X-Received: by 2002:a05:6402:169a:: with SMTP id a26mr69251064edv.292.1637606838118;
        Mon, 22 Nov 2021 10:47:18 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:17 -0800 (PST)
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
Subject: [PATCH 5/7] media: dt-bindings: allwinner: document H6 Hantro G2 binding
Date: Mon, 22 Nov 2021 19:47:00 +0100
Message-Id: <20211122184702.768341-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
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
2.34.0

