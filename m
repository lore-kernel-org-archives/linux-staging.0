Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98381A
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:35:31 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id o12so61975213edb.9
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fl8uW/bQJEJTin+QIg8DWseVdDDVo44lOoVAOeBzPc=;
        b=Qm6adxrvZNiyIQbLUCsj66urFNjR/BgPWPxUMP16ivYCXpi1zIYeSQe3B2yITeMI3u
         +AuwNDUqk1IB12ZPyulZha3fwvbO0M3KCw9u45yMdbfZHe+PypAHHybYmS7QqV1X2Mz9
         gp/AhXVhWCpZb0l9wBU7lQjQgYrYuWGo8Nr/y/ypJcFe3lUgCd0gMSFHQvmSBhryxtmj
         l7bZ1pn37/vkR2VS0HK8TdOWdFro+H/2GMrXTc95U3EZ72b9x9SGYvp7nANgg5HbSi9x
         4lUkHhKPuF50dmL+J1rYVJXtPVxo2DVnahdjWzVpW743ojRgB/LWD6wiynXWGrLCLqkE
         eDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fl8uW/bQJEJTin+QIg8DWseVdDDVo44lOoVAOeBzPc=;
        b=gOSJeq8T0WtT0HCzzqC4767nPpF8sNVbpMuE5zFJJftSpTaR85Cq1WGsJWpwSjcTWF
         Nrh86MLQR53+exfC6wfD4tdIUxDLFs5cbJOjeOtsc+75cl4LUCa/Wf+ysIR8eexy3mJF
         IBfqJjVmx0EAgODi3zyuVo9T0QXqThknSgQc95cYxqA+MwH1JnBsTKXtVWhMT7vt+roF
         ubfOPiU8cadmNtQLn8elUWU7u6SYHMdzyPCKvlddvtR1b73BtMKQrMKIhQgWxK8llC2k
         T++J3MAgb4tpvIM8RZQ92BHuKjphyh9OamO5wVVhgaW53IgZHppVE3ZNNS+EyQklsanY
         iHtg==
X-Gm-Message-State: AO0yUKWuDOV1dDyTCfm8JDewxn+flU2X7hw+EbeDECubPBppr/30+gcn
	iioA8kRCSDntnCNdkDzKQt0=
X-Google-Smtp-Source: AK7set/NFf6G0tf6b/6ZRhaWwjmnNrR8ydXanCprah2G3RGIl8hZqeFlEBgXKgqA6/TtHiX34T82dA==
X-Received: by 2002:a17:906:fe44:b0:88f:8a5:b4cd with SMTP id wz4-20020a170906fe4400b0088f08a5b4cdmr19309704ejb.1.1678260931239;
        Tue, 07 Mar 2023 23:35:31 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:31 -0800 (PST)
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
Subject: [PATCH v2 7/8] dt-bindings: sound: nvidia,tegra-audio: add MAX9808x CODEC
Date: Wed,  8 Mar 2023 09:35:01 +0200
Message-Id: <20230308073502.5421-8-clamor95@gmail.com>
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

Add dt-binding for MAX9808x CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-max9808x.yaml    | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
new file mode 100644
index 000000000000..fc89dbd6bf24
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
@@ -0,0 +1,90 @@
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

