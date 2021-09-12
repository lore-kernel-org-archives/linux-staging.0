Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5F3FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:09:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id i3so5130743wmq.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
        b=ijQ9VUVd3E+yAzhUW8LN+qmTp2ecRP2mmWkjTl8uAZSPA/zpjjwrm91O4PToKeDqC4
         vFO3mTKegg4IVvavhdrn+MbBPEpbxDgUBdh7DqlctW88vqJAie0ybyRePtB0ZKvhjjSg
         b/7a3Q6HAWJrkVAy2fywVfzvbX+UyY+AJRdulaqhxB5JkZguuPBwEVKs9rq+R7MQ8oTS
         T2lYnk8I/S7QPhedjPhkp9y79Iqn8sPawMmPQZytgNJCLQ1cquISSJH4xb8LXTpwJI//
         DMAae/2QaieRbscwgAfhPwKD2x6lrNKA7L32d8Qadur4oH0Po7NY3LnqcOAePA1x9BPV
         5e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
        b=QiUzshxECVW8L8urh3i3kjeYZBfcYq5yVvOeRQ7TfWL33bQ5RZTpVnJXL0/J2Y/v1Z
         YlYWpWXLbTWZ/RHrXMwp5xRONYLt1WKb1VMX2bFYLDa+T93+Rm5RWme5MWSRTfBdWfyL
         Ldab5GxNyW6C3TmJoNINNcUu42Ha42BQ3WJatiJA7SUU+Be/TNQZayaUoJuYBM2hX8EQ
         OuzRkqMCzaup3fwS0Ty/aj464ThIpSj2GAEfJ59m+WZkR/DErNRaBtGEmW1HNiGE+ffM
         XayH45E12FUgXIJbs4SUM5XhMEzDhRokKttK37rbK6+bOZsNObqnZOhFF7PlqHB+hzR9
         lWiA==
X-Gm-Message-State: AOAM531zErBxvdxlHoWZZ1ibR1pVeBWinRvNQ5rcORauVJIXMDuc3DxA
	rDWTHKR6yWsePSOPF4zk2L8=
X-Google-Smtp-Source: ABdhPJxyxUlin+TcDC9SzEGP88oLSNh0QPSkbXUWBt5/tW6RXe2v6I0t3nNYmR/wNfym5p2nWbp1lw==
X-Received: by 2002:a05:600c:354a:: with SMTP id i10mr1537846wmq.77.1631477385110;
        Sun, 12 Sep 2021 13:09:45 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:09:44 -0700 (PDT)
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
Subject: [PATCH v11 05/34] dt-bindings: clock: tegra-car: Document new clock sub-nodes
Date: Sun, 12 Sep 2021 23:08:03 +0300
Message-Id: <20210912200832.12312-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document sub-nodes which describe Tegra SoC clocks that require a higher
voltage of the core power domain in order to operate properly on a higher
clock rates.  Each node contains a phandle to OPP table and power domain.

The root PLLs and system clocks don't have any specific device dedicated
to them, clock controller is in charge of managing power for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..f832abb7f11a 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -42,6 +42,36 @@ properties:
   "#reset-cells":
     const: 1
 
+patternProperties:
+  "^(sclk)|(pll-[cem])$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - nvidia,tegra20-sclk
+          - nvidia,tegra30-sclk
+          - nvidia,tegra30-pllc
+          - nvidia,tegra30-plle
+          - nvidia,tegra30-pllm
+
+      operating-points-v2: true
+
+      clocks:
+        items:
+          - description: node's clock
+
+      power-domains:
+        maxItems: 1
+        description: phandle to the core SoC power domain
+
+    required:
+      - compatible
+      - operating-points-v2
+      - clocks
+      - power-domains
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -59,6 +89,13 @@ examples:
         reg = <0x60006000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+
+        sclk {
+            compatible = "nvidia,tegra20-sclk";
+            operating-points-v2 = <&opp_table>;
+            clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+            power-domains = <&domain>;
+        };
     };
 
     usb-controller@c5004000 {
-- 
2.32.0

