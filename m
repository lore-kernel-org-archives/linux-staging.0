Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645967B
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:35:29 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id j11so42496706edq.4
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBcnq48gZafulICVd9tvrELT8WaB8t4pfISzUK/pzOI=;
        b=LtOCJHK4KvMX8bwTtHJrl8sZHkh+iEgZz6I87FKs713yXXegtKWTWcWFc/1P5V9pzf
         3uY+McYYdyOoCIzWMZN/E8S7P226CMZ9IOdn2mjGDHGkVxhkMf3rW5KFJaSLlBL9654V
         y1PqPvye6lBWlzcGm2qHm/B3ECEH07bWwXAKuc32lJ/CkfDb1kSVmODkVoVVHSnWM1Ua
         VU592RmHtzHhiVi/XRlwqqmbsN6WI2OA+EimSNlXcN2lb3nwUSI/2pzvGnb42sZ+zTvg
         usP2J3osvVH8ExlHymqazrZHFPd2jryxCbmCMxDygSxQlrVZr/yP6hgm8W3rx1utFwFR
         sLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBcnq48gZafulICVd9tvrELT8WaB8t4pfISzUK/pzOI=;
        b=hjF0KlORkutPvfxrAJ+F859poGrr6K42kebFJ+oiE3tS2BWuBl/icQzUoltfhDHP1W
         PYdCtbovjqA+tFVS+ctXZI1DEqL38V/gzEey7MI+OVWV6aPdKjG7YB5Z4FXvFjSAbgm+
         As4rP55vz0eyYySlmbF4b5MgonCOijbd3IhtuLIAdP0dlG6A4IO3qSbUWF5UqJabExHO
         4pDc20Y/o7af+l129vOewXoFHDzLq7Lmppu06RbW3Srr2ywNBBDrXSDOfcim4Xkf79C4
         FW5zLN0o3SGlL20WryIlj+RDu6zRFrHP2Dwwp20jxmOsy0jmCOKKw771LlMnTXkjWpUC
         ys1w==
X-Gm-Message-State: AO0yUKV6FKd0uhBHXX+x/G3URgvjA6PRi8L5cA98s62oOq6eDEqsmHGn
	dpdihjrCarwvZ6Npok7ei/g=
X-Google-Smtp-Source: AK7set+zGCxAlpvDYOch6Rucm3mfAoV+frk+zkxD07ypTa4bSC5gYI3kTWWYePSU4FynWRc4Obe4oQ==
X-Received: by 2002:a17:906:2db1:b0:7c9:6e0e:1427 with SMTP id g17-20020a1709062db100b007c96e0e1427mr15342605eji.6.1678260927608;
        Tue, 07 Mar 2023 23:35:27 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
Subject: [PATCH v2 4/8] dt-bindings: sound: nvidia,tegra-audio: add RT5631 CODEC
Date: Wed,  8 Mar 2023 09:34:58 +0200
Message-Id: <20230308073502.5421-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Heidelberg <david@ixit.cz>

Add dt-binding for RT5631 CODEC.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-rt5631.yaml      | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
new file mode 100644
index 000000000000..a04487002e88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with RT5631 CODEC
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
+    items:
+      - pattern: '^[a-z0-9]+,tegra-audio-rt5631(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-rt5631
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
+        - "Mic Jack"
+        - "Int Mic"
+
+        # CODEC Pins
+        - MIC1
+        - MIC2
+        - AXIL
+        - AXIR
+        - MONOIN_RXN
+        - MONOIN_RXP
+        - DMIC
+        - MIC Bias1
+        - MIC Bias2
+        - MONO_IN
+        - AUXO1
+        - AUXO2
+        - SPOL
+        - SPOR
+        - HPOL
+        - HPOR
+        - MONO
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "asus,tegra-audio-rt5631-tf700t",
+                     "nvidia,tegra-audio-rt5631";
+        nvidia,model = "Asus Transformer Infinity TF700T RT5631";
+
+        nvidia,audio-routing =
+                "Headphone Jack", "HPOL",
+                "Headphone Jack", "HPOR",
+                "Int Spk", "SPOL",
+                "Int Spk", "SPOR",
+                "MIC1", "MIC Bias1",
+                "MIC Bias1", "Mic Jack",
+                "DMIC", "Int Mic";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&rt5631>;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.37.2

