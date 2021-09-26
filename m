Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0D3FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:33 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id e15so68609626lfr.10
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yMo8zD+Y4gBSxPVZ+67KkVYFkJ7TR9WX94Fb70e9izk=;
        b=fcIYQRh9XxRIRXB/80/nSQZZbSclhF1IL2Ysssmz6UKjW/8VpVzXFUvmz9grBShsTu
         VY5ke319Yg3BYCLYbFEy5O8IeLmQn9yib7lZ2ftgx2+fIKvsmLFpV0gXmKw3cSgiighL
         z44ewmkuBPt55RT3SFFzXQ3xeJSsGDr0R4F5fmCAgEZ3Efq3SxBDHo37JYtEBEgNhF5e
         sqYnRxIxZOHNZc31mQcCtuct8H5wSkbK0FZqVF2bFwuxog0VZwrjfcsus/XQPqBML4Qq
         L8c/AYAqg5mMqw1TOVr8DG9+zLXCh6uEPr60TGhx0UtzFD0QyNg5T/qESzi3qS9Skfa2
         9UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMo8zD+Y4gBSxPVZ+67KkVYFkJ7TR9WX94Fb70e9izk=;
        b=57clqw1LHRVhKnWPLiMWgJWd8WFd25/+7c6RDAEKToJ92+T5pEF4nG0YGY+m4hPGY8
         L9EK25xjhHCqucT19TgWkl1tj9G2tdAcx3h+F4JbxNiww9pGs5ai09z/7Q9wN010WihP
         WQ4jwVMRVv3vZMXSyS7YrotF1WnpV0IdzUdDl/9M5WeVcZ09wyiI4byo5nwOcdHu5ok7
         aZVdGyyP6aKQ+rVezkiG9KxeGGfbU61tqEy9Zy8y8EyQ37PoYT+4iipahedfWFseyZAB
         Fsm8nYqGvAxUE/efzpT/MbjiuLGCSOrPFIurE9CpQx6EIt7BAAPI5weliCVzdai99GZa
         Xqzw==
X-Gm-Message-State: AOAM530XmsFl0pNz2E9kzCWpv/W+o55EQrN8rbXbU8b918DWTB2jzSni
	9z4eSnM0j346pucrmw7kXos=
X-Google-Smtp-Source: ABdhPJxo7iqkV9l9gRrhuOVZ5G8rPWWXpZNjmUEhYykmnabkYmPdy6DxYveMBgNr9BLYgvhEo0AjEQ==
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr25245378lji.55.1632696151415;
        Sun, 26 Sep 2021 15:42:31 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>,
	Stefan Agner <stefan@agner.ch>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 05/35] dt-bindings: clock: tegra-car: Document new clock sub-nodes
Date: Mon, 27 Sep 2021 01:40:28 +0300
Message-Id: <20210926224058.1252-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
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

