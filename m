Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2038C0F
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 18:32:29 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id cq23so20730208edb.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 10:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mbS3PQtaiGcPdHVmHK5KHmqLpEohCcTweQJ5EgXuiY=;
        b=Ku08TnoYik5za8z9qvRzVXLT6c1xZUixmrWodB6t+suqVat/3n0Jrtzr2IhboiCRAY
         5FMHqXM69Wqmuv37UIZs9hnkJDlSU5NXr8q/eTdNH6ijCZ14qZDxT5F0MjOKYzrCqedA
         ZgN/y+y2CWqj8Dvo0DImcvd1Cwzz2/uU9y22Coi3WqQPRw72Hc07WlrlD6Xu4ESJznPF
         53etHxCFf0ql6+sX4Dc8LbjYpRLpFA3qEdH6Ca5ytApvCVqCXWjN7OTBrGS9d3jahpq7
         EoMseFH8UTUkyIFmVLW1cA8Ae76cpFEXGNlY7Yo4U14vWM1R1Pke0ywsLllqLCT5uNSF
         B/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mbS3PQtaiGcPdHVmHK5KHmqLpEohCcTweQJ5EgXuiY=;
        b=YLQTlwZbTMgmRXqLw8Syb9HgWK2a1JfrbRimWpJvKbCQjNN8hLQRouq/g8B4YaFVT4
         oIJHg3MjEBGFgPaKTvu1S6SMsI7jUf2iQcQm9Er7x8A1PSGwnJSR4DEUSyp93MKtmfOw
         sUtylOhDuXkRUAlFpvAbl0jQ/f3uCOR3lkiwZ/5zWOrWquIKPEVVLNs/8Lzqagu8EEpo
         O/4pfGVy1q6/IQfs9mbhhkKbCBtllTQ/TSwMUc5Y0fIYijLYjMCFvRSXtWfnLDPaB6jm
         aABWnXNau7vqRJhHYE2KKe2ZcNe/xYs6NSABI3znEifAR0ZDeS6v/P5R6twEmkwPaRjy
         elCw==
X-Gm-Message-State: AO0yUKWPYFceDbWNQxPgB+lkXo8wFKhE2cJDVw7F7RZbYXUhsXc2crMq
	uPXekuXxZU+BhfYJo8xROy4=
X-Google-Smtp-Source: AK7set/LteK3qpbAq1LKdw+rlpbLWNJhpurzLhgxg23pB6vb+FQgCIHXqCxN3v958CVxug40jX9oFw==
X-Received: by 2002:a50:ee01:0:b0:4ae:eb0f:892e with SMTP id g1-20020a50ee01000000b004aeeb0f892emr5579895eds.20.1677004348983;
        Tue, 21 Feb 2023 10:32:28 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 05/10] dt-bindings: sound: nvidia,tegra-audio: add MAX9808x CODEC
Date: Tue, 21 Feb 2023 20:32:06 +0200
Message-Id: <20230221183211.21964-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for MAX9808x CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-max9808x.yaml    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
new file mode 100644
index 000000000000..256ca4ad081e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with MAX9808x CODEC
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: nvidia,tegra-audio-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-max98088(-[a-z0-9]+)+$'
+          - const: nvidia,tegra-audio-max98088
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-max98089(-[a-z0-9]+)+$'
+          - const: nvidia,tegra-audio-max98089
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the connection's sink,
+      the second being the connection's source. Valid names for sources and
+      sinks are the pins (documented in the binding document),
+      and the jacks on the board.
+    minItems: 2
+    items:
+      enum:
+        # Board Connectors
+        - "Int Spk"
+        - "Headphone Jack"
+        - "Earpiece"
+        - "Headset Mic"
+        - "Internal Mic 1"
+        - "Internal Mic 2"
+
+        # CODEC Pins
+        - HPL
+        - HPR
+        - SPKL
+        - SPKR
+        - RECL
+        - RECR
+        - INA1
+        - INA2
+        - INB1
+        - INB2
+        - MIC1
+        - MIC2
+        - MICBIAS
+
+required:
+  - nvidia,i2s-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "lge,tegra-audio-max98089-p895",
+                     "nvidia,tegra-audio-max98089";
+        nvidia,model = "LG Optimus Vu MAX98089";
+
+        nvidia,audio-routing =
+            "Headphone Jack", "HPL",
+            "Headphone Jack", "HPR",
+            "Int Spk", "SPKL",
+            "Int Spk", "SPKR",
+            "Earpiece", "RECL",
+            "Earpiece", "RECR",
+            "INA1", "Headset Mic",
+            "MIC1", "MICBIAS",
+            "MICBIAS", "Internal Mic 1",
+            "MIC2", "Internal Mic 2";
+
+        nvidia,i2s-controller = <&tegra_i2s0>;
+        nvidia,audio-codec = <&codec>;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.37.2

