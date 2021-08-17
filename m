Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7F6D22
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:30:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id x7so30211142ljn.10
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l81mhnshT1jOAdUmVwFRhCr1kUhvtG3KJjdpKuzou0A=;
        b=O20xXbpstS1K4NNNeIVcVXjBhGfcu2e5nNEJ5pDBYki1kIj4o5ZYIjru23tbYEGsyz
         r52Hf/+40WfMUNMEhvN72pmXl0XoPmEVNOOv8yUg6XmPcR6PW6ztKlm3dNhyGBEbaa7Y
         r09HKxsCu7pdY4G8ZxhjFl3L8Ms3XExvbjVxLlZReoy9dlFs4piRUc4FJoCVKmVfN6W+
         DvcxU+uSjJq+dyj9XuEHRIqCDane++wPVshyPW0s4dKK/D0v5UTDlCWSDUB7FBD6VcAn
         DSh/YDly+w0E3m8BW/O1X+usNpnRL02EHD/izGWDARukpTDuSfyZm9EWXzEP8jfQItxy
         Nwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l81mhnshT1jOAdUmVwFRhCr1kUhvtG3KJjdpKuzou0A=;
        b=mem1H8E78xS7tNQS7GZIG1fFQXGizTVvCxJ81gmT98SvxMWyz2GUSAG89k+eC06/+8
         +qCtS23N0zRLvlXMxpj9v1qhdCeEcqdOOpuLiXctWp8ZRKK80lpzOnH2sMTrEcIfdupr
         mDaZM7OBjtH6lNbx2nqf4UkwP2l/5O4KT57RmLH98JwBBbVTtRokNpZyjgdWJ12vZy+L
         c79K5Yr0FMWsv8IFr0rCX4k5e2fBIz5HOWibJWrbM7k3Y/U6Q3m/Io0tNskbrt/zkqa+
         BcxQObGHPFYxaXysHKErGA1hf3tM1w3i79O3uFZh4I214pwHWQzHecUszcgdQjJeWw3b
         QG7A==
X-Gm-Message-State: AOAM531e02expsNHqo5+YispsRdguWshPq3aZSbH7xTy0G1DbX1WX86w
	d2bVGmB7YHFCZ7F+EQAgwXI=
X-Google-Smtp-Source: ABdhPJxhuZkUDfR36UaYb9aumi6B1iVfEXbSXNsdxNHhblZQHD87dEi21/QGQqgVOj5+f/BnA4ZsHw==
X-Received: by 2002:a2e:8147:: with SMTP id t7mr859862ljg.126.1629163812262;
        Mon, 16 Aug 2021 18:30:12 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:11 -0700 (PDT)
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
Subject: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client resets of Host1x, GR2D and GR3D
Date: Tue, 17 Aug 2021 04:27:29 +0300
Message-Id: <20210817012754.8710-10-digetx@gmail.com>
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

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..07a08653798b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -18,6 +18,7 @@ Required properties:
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
+  - mc
   - host1x
 
 Optional properties:
@@ -197,6 +198,7 @@ of the following host1x client modules:
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
+    - mc
     - 2d
 
   Optional properties:
@@ -222,6 +224,8 @@ of the following host1x client modules:
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
 
-- 
2.32.0

