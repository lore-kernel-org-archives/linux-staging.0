Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B93126BC
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813472; cv=none; b=sVI5IRSyp0L7/mdlZkPfi+gRL1j9qFh7uh8WpGJUKOKbRnCROzniUG6hy3GZHFFWuO0gtNGFmqHNMYNcXTPR50Zyl1gNzkGUnYCx+trLQ6RMCxASMktpRQj3kQxU4eijyDo5xoCU4ElrMPPFV8Iia9gYGi0lg0c06nOmKDR9tg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813472; c=relaxed/simple;
	bh=gpoDHkJKaBLo4I5P8qTwM5e7B7PwG7fYx3AIUNIrLrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfxxqSLKz79pd5GukZ5mpIdVaLFNg6XT6o4aE18BOy4ttTUBVFwcCYoeMtqE75nEmOvM0UuFOficWIR9YDI+HlesW4otu/M/zuP1L5vMly0lMmD6rZ4qjxxB7skJYOlyyTt9loW0xcQ16ipb9oAtCMI8jpFWL4Zdbe06jOxS6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRUqdI8I; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRUqdI8I"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso1156015e87.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813467; x=1759418267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
        b=GRUqdI8IIHd3isW5qIHdXn6nlJ5YfmKtori7jAzORjksKlHTpywPQw9/p8RjLV3oFj
         Va3ZtVRWuXHzhGDVj2VvK/nP7gJdOsT4Tkym4DzMhE1hx+mikNJjft0TRRoTiXA0sJz9
         qRUM1P0REpqq9VWLX+erlgQ9trp/L9iBuPT0vXutBl10IT5n37/mrLtaxZPq0qAB52tJ
         sCw4+Jrlkv4hC/7Zk4uY0eU9V0p903nhKilCatIktLbwZHQI1Pcy5hctORTqsp2mFbIM
         G4APdRWhjIsfggcFHMc2dgxUJAJ3AbC04mwX4icc5xYeyrhGHICn50qEp4/BXMW1xONF
         yTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813467; x=1759418267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
        b=ZkuAApoiD5fihJYYloHym9IVAgALh4tRpe+ojtbo/jkuEM8dSrS8dqKfb/A71nBLoL
         cuguQZYRVtW7CQHYSxhEpbej13XBkjNSCsjsAlXqT8rMeTTkvzJl0s9af6JakqfHqiMz
         907cDtUGHc2P3MMysNbC/Xs7a9jCNskNSJXc95cJTdeku+5kZ47psK9YUxFBw8KR6Kas
         hmtn36BxSV76Vm2KjJePd1rzGbSpEsCeLg4wRs0oBgPRThv1IVG9BN+d/5emtIMq6scI
         +Mg/LjASp2N+S+xhatdsDxHMxnQ7+SwswdUDcdDjACKpwu+1DuDTym2zn0Ni0E5x/dJH
         h3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWI+0JQL3nLte9AJZNpDJD80B4N6aNPUsmxAJUpsrru2z+X12EgTEKN17TnVqF3yuvBev7EWImImmPqkOSW@lists.linux.dev
X-Gm-Message-State: AOJu0YxBCse0ZWJQTOaCZnobeeExuloRkYlKuNyyGyX0bfCWFgEsNvhL
	qkjzW+Dstjy+fGIGuSdk46z9jpkVOBXCrz3YV3NryAKS9rcRsYX69qHn
X-Gm-Gg: ASbGncvCK3gUzhdRLh1H0E1xu8zQ+rR091h6sCP/HVCwqhh/nbtlKn4SrkGVGJIYFKQ
	OdbjCTQcfojlhXqi3FICQqv5dtN0l11wMW8PbgqOI+CapD8erd258uuNXCPiqjMJi9p8hCFSLGK
	g4cr2FzFL4zCuxou5HPRNZv9ra5elStKAeTKhi6ClDZ/YUrEXhUp3dd1WUhhvhl7VyVQ2RUyVGY
	EbSQ8eVWiwYwhsvpFbtGi6EewvmL+Pyo4aP1+N4yWeEIbJC7NnBwTVrtA2J4VhlDuGqJ/FSJkDO
	gYwoI7/bITda6WPG0PDSCseA5fDbcMCiypap6D9cmrlqkeF88RI/7BzEC+3Y4ag2x+Ff8++7oCK
	9gqqVOsoZEaJJiQ==
X-Google-Smtp-Source: AGHT+IGed0vIRa+md+egWvWqgYYl4XwnX/bKqIftOs7kK/BC39V/DrV+l1FBmmZSDKHaohVTfkYJWQ==
X-Received: by 2002:ac2:51c8:0:b0:576:fbdc:e3d9 with SMTP id 2adb3069b0e04-582d0c2a3e0mr1199445e87.14.1758813466370;
        Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Thu, 25 Sep 2025 18:16:46 +0300
Message-ID: <20250925151648.79510-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

