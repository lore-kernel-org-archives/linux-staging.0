Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDB930499B
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166879; cv=none; b=U62ZsyDJZYmb+882c01eC4ALJVsgIbBapyPkI/i3Pua0h1C69vRB8zBqXS9j7Yb6Y2sMwsqRP5n1mln0Xm4N568Z+uY7jhCCzZLFP55D6xpRqUf/Hh+UkjVPVArrm6AcDKUMmBKYD/KH7LZ1P3zYYXG5SjT9iBAo6Wfv46KeRew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166879; c=relaxed/simple;
	bh=ydOU85KNv36EF+TC1gm/KkRvpDsWvu6EFttlQUKlBvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHAioK5bCNziJJUOAUQVUcvi/QzrD3OmVwc/b7grrCad5Jitvne/1bbUo5Mupzj/PNtB9aPcCOH9IBfI9/re2S4K2Gt38ue2UHwf1eLZ5COzTLFbmornQGMOvgul1unDmVLJ48Uu9HnHodG5ysMgkvI6sRhk1HUwuHgBiB4afLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rqnjpb++; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rqnjpb++"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f646b1db8so3437379e87.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166876; x=1757771676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qL0JUmWTkyFBMGydq+NFB1T+OALFnyaDwilHrorgTbk=;
        b=Rqnjpb++1cyPEpTNM4MLo5Vu1MtnpmOPXe/iKAlLDv0LGJz0zNyr1wzNYKYdMlK3z5
         +mIf0nboTK3iBdQy2No1Ro43VhHXSCkdKuaJO1uWZShLnr1po8TiH1cIVi9V71Eys26u
         NVAz1cFwzus552MEcFpa5pswwBVTjSxVE9HIZ6OcsP0jVrZnQ/ca8NPJdLYjk76sZs/W
         ptSZ6BPTbweGrxum5WxXtG60kg+5Js4rMcBXb2vPinrLqsULLAJzIPG2o48NSgc1Tds6
         wq/2A8ZUxjMYvaOBRW5zkYQbh6wuG034PbXT44xMCMD1H2vrfHkasJJEKTiGUkaQ1XO6
         vWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166876; x=1757771676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qL0JUmWTkyFBMGydq+NFB1T+OALFnyaDwilHrorgTbk=;
        b=XAXyen5uOIPsE4EXFO7HYXACOGoZu41uzFaP2WkFfQCqFSqwnfMtH/JWhxoWpX1Ws6
         D9ezF2eeSX3LtDENvAmf2/TLl6NXF0DvOE2oAF3gPuaDYdN0wX/5+TTe24IiH5kXCaG2
         PzNxC+E3Gd9AwiqPwwjd+cHl2bwQOYsH4WIZyJFaWz+3UUCXRSdq+UL0BSL71Ic0Mi7W
         uoP1/mV6xiHbK39+fnkUq/70zlvSSazTsNieBpXchLzYz60p9KhNZFFf1nCmL9JfUM3F
         ei41sLIT5UQo+qWGdYGFP3hUIRdcXvcB4pMnwy8VMArEPg4w5H2Vrysp3AXFlmUIUsQ/
         NFsw==
X-Forwarded-Encrypted: i=1; AJvYcCWog0XdAH8+7BaMPOuvla+Fv++bUfPRAwUNaa39VWVOdB/u7n7Wf5xGH2JGuIKnLZiUq1jEqSVUu4caf6He@lists.linux.dev
X-Gm-Message-State: AOJu0YyppEJvTNDrGMGMz+VGrodwneOHTI9aHgIDOPS9K45EXpgjDLKb
	syNOl0kByvEPPEq3GNv/9BZr5ivieNoa418xVXbqXeKZJvvt3bWeHjJF
X-Gm-Gg: ASbGnctI9T8egiwf20aZoStb3Jge9+23k8kmdNg6N3tb8Rp3b/LX1MBzOG9E3dNvbTP
	4PzPiNHzIVcPx184JM3dcbAirLSEeDcDTLgnSaydG1M5FBVXIjoGH5r1ZzVCXVdY5m72yTdetUr
	yL3T0J0j+4s88m9bl0bsn3nWU+QkkI/e8w6G7psm71M2caFkvzTwgH3cX1c/SOe7FPXuKB7iAmL
	0GjBgPaql+cDAAnWW7gqyjV6vGOiKpDsKrfAlTOmsh2+DWzoppomV8A48OR5pNqqw7PfuMyyYIx
	4dLxfMFs+8qcbvW5uuMJn+0ZfrHd09fy8N6VGbZmKV/wneWGLezuEGjF/i3F9MF3mdsTljRdvZF
	up6UC11NCtMr/8t2JdGUadA+a
X-Google-Smtp-Source: AGHT+IEsBVYNgu9fx/P23umpxwqcCjAFXjv8bzOpOxv6Igr/LBYo56Zn4CLcBlm7uEi8JgMOACJ+Ig==
X-Received: by 2002:a05:6512:6404:b0:55f:6902:c9f0 with SMTP id 2adb3069b0e04-5626310bdccmr579165e87.43.1757166875448;
        Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 21/23] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Sat,  6 Sep 2025 16:53:42 +0300
Message-ID: <20250906135345.241229-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI HW block found in Tegra20 and Tegra30 SoC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 104 ++++++++++++++++
 .../display/tegra/nvidia,tegra30-csi.yaml     | 115 ++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..1a2858a5893c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description: The number of cells in a MIPI calibration specifier.
+      Should be 1. The single cell specifies an id of the pads that
+      need to be calibrated for a given device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pads are used by this DSI output and need to be
+          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+        required:
+          - endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
new file mode 100644
index 000000000000..ea5ebd2f3c65
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra30-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+      - description: PAD A clock
+      - description: PAD B clock
+
+  clock-names:
+    items:
+      - const: csi
+      - const: csia-pad
+      - const: csib-pad
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description: The number of cells in a MIPI calibration specifier.
+      Should be 1. The single cell specifies an id of the pads that
+      need to be calibrated for a given device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pads are used by this DSI output and need to be
+          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI-A and
+          3 is for DSI-B
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+        required:
+          - endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
-- 
2.48.1

