Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA4C3FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 20:10:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g128so691457wma.5
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b4VIKmbdMAsFKCV4yDWvgLSko+6dlgzXMHJz6Zc9RO8=;
        b=WYlYCIHhy2AwhmX7L/AlwoRTFLRNk1Tw8KZ1cNf4Z2BgAk5gJUFFsDyiI8pBahl6s5
         CWTx8U8kQqpUC9d1Kf8UW3oIe3rg5dwKzaXaPmyg7lVuMXIceWpolx5f3LJKPUU87Bod
         3O7Lw+5Tjw2jpvqVMGOGBC9qMPlfztC63JbLV1QRppX1gNBIwTkmSK7wVXdpf2xO/RIR
         mKmyCaWGc1Dt2qQD3YL0XF5a3RJ5eAHEezXtRX5g508Tq82JkTJOiVmuZd4spjcZH8JY
         vwFG+NAvPyDBBTFXNnfKkQuETEecgQZy7+Tuc19oJuaNa11vCKL8YU+lmpseq99X/jCn
         Udiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b4VIKmbdMAsFKCV4yDWvgLSko+6dlgzXMHJz6Zc9RO8=;
        b=MMjaKzyoLaFxbIZaJB0rZBlYsREaY5zE/W2a+f+flZr7Gp/HW3aCU6/g6V7HiFnFbf
         SLT/+jQarRp/l5GlVGXYXbxvGnKHB57/tk9U8uCsHl5vpVbUAbsupORtKlhJ7e7De1vX
         6JqFCoNh69BECWn9aiBhnE4oZJNIae/LJi01dDk8vG21FP8/c7hHmKhLBrpGyR/A4yKP
         fDDyO/dFhED6D/gS9tqCOlB/UX+h1WThiW5qjhDC8sCTgtnsArn/54tlszkMPWvB5Fj2
         JpUIzPSDl4wh5QNR+/3dav1pK5gqqGQeawROmbs39vk9/Vjma0Ny0XFj1AY+aiPXBtHX
         ImGg==
X-Gm-Message-State: AOAM530ChfotiaCF0lE7SIt4rmamZ6U7SDp1zqCulIjMLMi64LQ8tEgp
	EbmNBlZJSoR8sOOYRPhqHpU=
X-Google-Smtp-Source: ABdhPJwilD7uMmHHQ3Z72aCq5cGCPEr6BZMewoEYkEkrhgvxyF+teVEQagLVBgnOWAIx7IIGBJO7+w==
X-Received: by 2002:a05:600c:4e8b:: with SMTP id f11mr7626369wmq.165.1631477429807;
        Sun, 12 Sep 2021 13:10:29 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:10:29 -0700 (PDT)
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
Subject: [PATCH v11 23/34] media: dt: bindings: tegra-vde: Document OPP and power domain
Date: Sun, 12 Sep 2021 23:08:21 +0300
Message-Id: <20210912200832.12312-24-digetx@gmail.com>
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

Document new OPP table and power domain properties of the video decoder
hardware.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
index 3b6c1f031e04..0b7d4d815707 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
@@ -68,6 +68,16 @@ properties:
     description:
       Phandle of the SRAM MMIO node.
 
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property,
+      which is a bitfield indicating SoC speedo or process ID mask.
+
+  power-domains:
+    maxItems: 1
+    description:
+      Phandle to the SoC core power domain.
+
 required:
   - compatible
   - reg
@@ -104,4 +114,6 @@ examples:
       reset-names = "vde", "mc";
       resets = <&rst 61>, <&mem 13>;
       iommus = <&mem 15>;
+      operating-points-v2 = <&dvfs_opp_table>;
+      power-domains = <&domain>;
     };
-- 
2.32.0

