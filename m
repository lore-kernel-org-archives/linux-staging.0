Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCE3FCB
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 18:12:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id e15so32427526lfr.10
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vwz1Flib1olsdeaukDInX/oFq46RrVNNMLIcTSXb7Po=;
        b=d/8SR5QIcgc+jDwTQtsdPq+k7oz8LN8nm2hKa44BYP3xKD8eP1xglsSvu9u2Z8GdNw
         9ZYFSyWuKyyddfmH/XVzXertBV353KFlPLDtR5BQ1ZXR9lpYbD9JZsLWw4x6TYp4OYYQ
         RthRZAWri7TgAxJ9G0JJDZDISsLbF5IlP83Dmxa4mDtQsXwUTne3oXuFua5neFap1m50
         h+MqIvMgVMUBNxmf5413tepjwHAvxmGr/OuqAK2KUCScWzjcXUEHvs+wbBtmsZ+Lef2g
         YU66RBpbkuXxcLwygeobdrtPVjZDSlCXjK3IUHxkzPjPh+Nr+Uj7qc475Uc21UZJZoGv
         8cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vwz1Flib1olsdeaukDInX/oFq46RrVNNMLIcTSXb7Po=;
        b=TNSSLZIczTVbm+h37XuuBQ2+/M+ipBb0hmONj/KRp+4+l3nHHL1JVksl9Q2qLlCu/L
         pkSZg97AfN1b0Jy9q2y9ykAtRmrdEZvjn9K5ZiDYyNNHc5GWxJClj+aQu9WmQmAckwPC
         G4WgsB8qkH7GASc3KfRGgjEE2wyNIxHUff8Mb6SAmL24iOvaVIE6nIz4PIHOjfV3Vw8f
         dB85+EuNpEop3ntnIURPUidKyCoZMG59uKxBi+DM41Tt8NWXpOFI10Qm2zmNf3X9IU14
         myDPoKZetCGrkLmju4a4RtnP/kp5WqIDUzK7I5k6YKSsBJLxgHHatebHnS1szCgyj+0A
         1UdA==
X-Gm-Message-State: AOAM5309FdHhZhzwxJLVEI5GeXdQ0eadxQx/AMlev73YmhFoIm2i+FKv
	xnEBHUq580tpbqv72ps95JU=
X-Google-Smtp-Source: ABdhPJzNPlq6lQF+IFC+d1ak283Ur0/ZIjKZaw8UqSG6j6aTEX6i01IVn+xu3KeRoB6jLyboTMrPdA==
X-Received: by 2002:a05:6512:2348:: with SMTP id p8mr5974751lfu.431.1632161548573;
        Mon, 20 Sep 2021 11:12:28 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru. [46.138.151.206])
        by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 11:12:28 -0700 (PDT)
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
	Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v12 23/35] media: dt: bindings: tegra-vde: Document OPP and power domain
Date: Mon, 20 Sep 2021 21:11:33 +0300
Message-Id: <20210920181145.19543-24-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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

