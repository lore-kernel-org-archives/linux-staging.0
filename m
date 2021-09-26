Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C33FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 22:42:37 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id u18so67075472lfd.12
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 15:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p6xrHF0JDm5yvfpc+kvah6ca7+v53gn0YbmmBZcvayY=;
        b=KTBp8TCCGq/owdZuVTDixCYSrDTCvyoPGPhnTXQZDuyWzz1TnDVS1NTdeLBjT4nZFf
         VFgQQq1+5AQ4fHNtht3Ss9wSyzSUPvewj0d1+bChvvdGBsW4NfmX4wac3oZu7lL2lgzi
         Ejg7kodc+O/JVWOO/B/u+OFYXGcbl10gKu3mynRYp6IvbsCg+pEc86qOeT3+lgtZz69a
         z02amcamXQh/vp9CQ20yvtkGytkZrhUdSleZ0lk69p5jH9GPM0Iz837+RbLJWQuyztOM
         0ySBuA7ZUlKBLUOBqdvMQ+RtBlP693qwqk9/ee0482ONvCEAQxg66CalLRktDkvsnJj3
         8TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6xrHF0JDm5yvfpc+kvah6ca7+v53gn0YbmmBZcvayY=;
        b=fet5kTvEeAZ3pNsCZ08lHU8jgOw769bjKd9XpZAk0qHdikI/fp6ZIEDaft/7LcUDPl
         9yNILq3MbfPu91vULR149joaxeowR/3gi41vfIj6w3jYODctXkeNRNhv036KdIzZwr7m
         iRd9avVLbMQreuD+PQF+0gN2L/NQh95AUVauxObB4KgUo2PY3kleVtM2LoPSMuvUP+Us
         Tpu6pRvxFz7apR7OJvorgPKVtpjjW2L2hmpjIRqpISX/Z9NdTKJjT9Ybyl4PcsNfKAQr
         GXzb8AEPFzLZ3X9e61/Kc9Q6eavbnN84ebS3y57rMg4qkJTRuc+q84F7wCZWHGE1y7CC
         QzLg==
X-Gm-Message-State: AOAM530gzOuQv1ZaKNc/ANQogy/kt/Daf6Sz43JIp2+vF9kPCxMG/+PV
	fCQjMSwAj/3zBhM/QR5BqI4=
X-Google-Smtp-Source: ABdhPJxubncUissBx4ZmD8hh1ZobZ1bSg2iuLfg7u6HmSwkWTeEZFopmJ73U5J0ZtcXnw31JdxV8+g==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr21099936lfi.309.1632696155401;
        Sun, 26 Sep 2021 15:42:35 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:42:35 -0700 (PDT)
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
Subject: [PATCH v13 08/35] dt-bindings: host1x: Document Memory Client resets of Host1x, GR2D and GR3D
Date: Mon, 27 Sep 2021 01:40:31 +0300
Message-Id: <20210926224058.1252-9-digetx@gmail.com>
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

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..e61999ce54e9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -19,6 +19,7 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - host1x
+  - mc
 
 Optional properties:
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
@@ -198,6 +199,7 @@ of the following host1x client modules:
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
     - 2d
+    - mc
 
   Optional properties:
   - interconnects: Must contain entry for the GR2D memory clients.
@@ -224,6 +226,8 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
 
   Optional properties:
   - interconnects: Must contain entry for the GR3D memory clients.
-- 
2.32.0

