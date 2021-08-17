Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CF76D18
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z2so38240858lft.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1rOuTQcx9Elf9jGsA5Ck42tuk06UuZfodHaWyKuopa4=;
        b=nLg7hn8A5q/Vx/CDPzbsu0UZcMhezzX4poGP9+aJl2GMGcJhQYqkUnj5Qjl2cn36JS
         TRG8tU87zTvHq5zgQXHaUfSGmd+O/0lOIjEqYc1BrK9zX8G0pOagT0C0wooOsAF5RN7B
         yK/7WuO8b06VawvO6kBp681V6kBFyVQi0S6F6onYaebnZX8T/ICfdcFvXSYrhsgVKUYL
         K9LhVT6ka2mjmSQGZXodX88ijX4Dp4wQUWAkjBdKY6Y5GWYluTSb3kBlJweMyYfHhACG
         IxdIRBbwpMCTUUHhK75ttkWtdcgq0pw9a09WmdFz57TCTIW/Tn8SPuEy+khxI9rWUJ9M
         eM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1rOuTQcx9Elf9jGsA5Ck42tuk06UuZfodHaWyKuopa4=;
        b=fd6zWAUd716/yT9P+DEzIPuieaIN36evOICuKCnox01h1IJK5MSxXExJo9j8vJ9pcZ
         cdhw0bMHq3A2z0/Od5wsawJSvQvhnbVPwICrT5H/FTzOQW0xjEbp6hHmrVolumsrvDZs
         N80+0LuogLN0b+o2m9IB5v0yQZaBL2gMRPQKddnWPlNERmft+PbdFNk3c+oXXp0bE/zd
         csdNiC7kWvmOQ60Ae7PIg/AmrUgKMZMRMq/ukl/e19qvEUiU7y6txYlnQTh/c0rKavJo
         NURxpdB3e/rwL6DYiJSa6+FvtuxYQm7TDb21SBRW5BkpjnakGk2h/fl4P0Rgamk5sFxN
         t6zQ==
X-Gm-Message-State: AOAM531aJ15Pjg6GPciuOx9WtjN5JkV6n2oeq+raY1kJQED2bGFK33zI
	ufl95tG4wUOLLjTbHKeW8n4=
X-Google-Smtp-Source: ABdhPJwYUUWzqvmh2TbyZ8slt93fpku6uQ4CmSmfQ4fl39kgqkYGTl90+c9np45vo/m/xAMOfWGCEg==
X-Received: by 2002:ac2:43c4:: with SMTP id u4mr476965lfl.357.1629163808543;
        Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>,
	Stefan Agner <stefan@agner.ch>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-spi@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new tegra-clocks sub-node
Date: Tue, 17 Aug 2021 04:27:26 +0300
Message-Id: <20210817012754.8710-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document tegra-clocks sub-node which describes Tegra SoC clocks that
require a higher voltage of the core power domain in order to operate
properly on a higher clock rates.  Each node contains a phandle to OPP
table and power domain.

The root PLLs and system clocks don't have any specific device dedicated
to them, clock controller is in charge of managing power for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..7f5cd27e4ce0 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -42,6 +42,48 @@ properties:
   "#reset-cells":
     const: 1
 
+  tegra-clocks:
+    description: child nodes are the output clocks from the CAR
+    type: object
+
+    patternProperties:
+      "^[a-z]+[0-9]+$":
+        type: object
+        properties:
+          compatible:
+            allOf:
+              - items:
+                  - enum:
+                      - nvidia,tegra20-sclk
+                      - nvidia,tegra30-sclk
+                      - nvidia,tegra30-pllc
+                      - nvidia,tegra30-plle
+                      - nvidia,tegra30-pllm
+              - const: nvidia,tegra-clock
+
+          operating-points-v2:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description:
+              Phandle to OPP table that contains frequencies, voltages and
+              opp-supported-hw property, which is a bitfield indicating
+              SoC process or speedo ID mask.
+
+          clocks:
+            items:
+              - description: node's clock
+
+          power-domains:
+            maxItems: 1
+            description: phandle to the core SoC power domain
+
+        required:
+          - compatible
+          - operating-points-v2
+          - clocks
+          - power-domains
+
+        additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -59,6 +101,15 @@ examples:
         reg = <0x60006000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+
+        tegra-clocks {
+            sclk {
+                compatible = "nvidia,tegra20-sclk", "nvidia,tegra-clock";
+                operating-points-v2 = <&opp_table>;
+                clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+                power-domains = <&domain>;
+            };
+        };
     };
 
     usb-controller@c5004000 {
-- 
2.32.0

