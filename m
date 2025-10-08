Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C302FBDFB
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908716; cv=none; b=d2MsFyr/KwDVJ+VdqkwdDMoytU7qYo/EhT4iMZsVaDVZGYgdlqmEFYlYdVmwDN0CVxgkbGVs/mdxjX4xP8ptLHRQ0ULbnM2PAYgc3kgq5H2KjITzC1rId7XAjE/U0X7oFaM+iMJ+50lMgwjE29NMw8Ggtf9+opIy8jJ6Mjg4zWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908716; c=relaxed/simple;
	bh=c2pf6RUA6JS/iU2qUlSvT28AQiDs7K4PthlzccZwX40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYK7wv475MohBMhrXWqewPexQdD3docJQz0WfVjxUMQ7FEQJ5jBK0mNsvQwHkP1EQIYRPmgmKOaqgPzKr9KNAu+mZOalvN8UaCI94ycgtAEgbUk6lK2CpFqa+O8GrbAcNyWnpNEg8aWi1I2PKG1yl8HATmse3sb3V388XgK9MuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN7yibAK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN7yibAK"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57933d3e498so9758318e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908711; x=1760513511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4Sd98a7JjnJau3gJskbN1AlGmAjhGwkl8sNjJesON0=;
        b=KN7yibAKeJth1mHDOucl06S0PMEbzr7KCpDknYB3K6yzK4nEkulAIk76ZqPW8ktZqI
         xZDoN3zTF7bE4jP17xtBDpFcw4KXGYFfRGvL+3ggp4LzetWXbnA2Igds0GPxO1sNH0t6
         fdA1ci2k94pCy/t2ugdnUSAMuZ6i5n0Zuq2damEX2Z+8d77LmCxDygzQiF5J/RMAEQvM
         VRSBxBWcqJszZ5nSFwGhn6VBmpFNcXqHgxzaGGfwpn1rYzG24ZILODFSdAl7uyb0Q1Is
         4t9zlUXCxtJgSVZ7knri+42HDtmDsxw9+vt5ij0tvUeapLHvt53dboBmrxds5UptFaQZ
         GAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908711; x=1760513511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4Sd98a7JjnJau3gJskbN1AlGmAjhGwkl8sNjJesON0=;
        b=nXBVlxeFTDVq4Q5qfL5UEMdKF5sMS0u2HLQsLo32aOESYkUlZb61N3kE390/C76bKN
         AmpV2niyFI16SZV4QM7hTJXASDjJ0uJjvogDkWIHP0s54G/DSXS5wdHXeF61Gd144N+r
         wWpwtgGiQV4AE5sHM68h3AAWXfhhXM75/LJBVIOZJSpi+40fWUT5HaqEnDJbmo5rWamW
         KX2D5cR7DZnm75EzZ47gJryo73d6afEttMA7dRjfqUK8DwkX9TvPBqokdAzBBaWKAsiu
         97SKTLbSGlcgMMLH7rds2YZx9qXGxTk1AvyhPqeKCdSotyN5ONc0fH5ql3ABzOT+MRUd
         0uDg==
X-Forwarded-Encrypted: i=1; AJvYcCUsDqADC199buiGuOVWm2GdgkeDvr3i5Bv9BRaqw2WqyfPedjzGq/yiH5vcNpDE3DgU3k/k2UkHN2kX+ckN@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7jlya+iegOE/bMmHXO3QZR3tf+gwOIkKU0uocSAx86f0mZvCq
	v6o82rhw0kbpKuobyjaiondv4MoarIjhbctb6I5AZ8u6VerDkcxOM59X
X-Gm-Gg: ASbGncuGficeml1vlS0sArXau1D+ZzZUnMiJqiqQXnX/H7LBC1zqowqEHZSL6bgVkE+
	ahxqEhFum4GK7y0R//CdC618fQGJ0OkmoxZ3n186Yr6/esFnn+XPCQxpjr6yXZAKQz/4wR0NWIW
	uAQFKWpd5HcoEpb6lj0phPzq10gUTbsVpwMIjRAwWWZBuAvGXgdoQdNbhFIl8Zhtn86mDdCySTq
	sxlZ7qv3C/SURto1GnfaOaBESESjIi9j78hwouRH7psJOBqCc+CSX78iZu7kxrx1eRk3MxrVPr6
	cyl6s4AvPiBZLOTrvSC+/9yB3YQEVmrnGau5hMI/FRuceWlVlq7gaOJZVSo5W5Rz/c1K0lFgJFU
	AiS6SND/AlASGZ+Wnx8t8oHl79pxElIdVQV22yw==
X-Google-Smtp-Source: AGHT+IG6FlNISKtPx2gRqF9MdRRkmvlkKIifRDzcNapSupdgygQ65tibf3VBpyfWyT/MoNFC/LyfEg==
X-Received: by 2002:a05:6512:1055:b0:590:5995:6dda with SMTP id 2adb3069b0e04-5906d896c12mr674942e87.7.1759908710509;
        Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Wed,  8 Oct 2025 10:30:44 +0300
Message-ID: <20251008073046.23231-23-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI HW block found in Tegra20 and Tegra30 SoC.

The #nvidia,mipi-calibrate-cells is not an introduction of property, such
property already exists in nvidia,tegra114-mipi.yaml and is used in
multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
mipi calibration function and CSI function, in Tegra114+ mipi calibration
got a dedicated hardware block which is already supported. This property
here is used to align with mipi-calibration logic used by Tegra114+.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..817b3097846b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,135 @@
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
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks: true
+  clock-names: true
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description:
+      The number of cells in a MIPI calibration specifier. Should be 1.
+      The single cell specifies an id of the pad that need to be
+      calibrated for a given device. Valid pad ids for receiver would be
+      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
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
+        maximum: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pad is used by this CSI channel and needs to be calibrated.
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
+            required:
+              - data-lanes
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
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
-- 
2.48.1

