Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0F3FCF
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 17:11:54 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DBBB8402CF
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631811907;
	bh=iLBqEScFScgxWKcmf9ZOnKkcn3SW2EPjpclUhT/HEPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=fNvnxjUnudbL9W7cNRWrc8XdIRre7vCSbu7wa5T+PgldP3Ef7s9SVn9yARxpZuEoC
	 TNkw2HvjRqYy1C28DpJ0KSM18sYiH8maVyNm82w2CYcC52/HfbGQEy4o1NAgZawnOC
	 jGXtku29UodYVmmWOT6/cnSrZOVdfcCAZmvejElBqAIj6Ow0mhLq0aOBT21d4PaCt5
	 ryR+4uAtLNznoOvmofmKfQaCu9nEm8d+za+zlbuyZJqSy6KLStXruxQXoQS3WtZ4Fu
	 8o5fpnlWC4DpYbCOK5nF0OzSVLcxCzntywuZTGpFIEwUyisZZEWMSqCGENhNTS1k5u
	 /8EnxttpAwPeQ==
Received: by mail-wr1-f71.google.com with SMTP id i4-20020a5d5224000000b0015b14db14deso2682532wra.23
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 10:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iLBqEScFScgxWKcmf9ZOnKkcn3SW2EPjpclUhT/HEPQ=;
        b=d5OFtGleh237bIzNsTIDU4t1RPhIYYd3ZfpMZ2ojxD8K07WvTMmRECoCnqLyXJySLl
         6qOnC8btYh26vDgOEI3GAjtb2ldfSVM2A7w9U3kPmx1NmMX4GjNtUZVIsaN2Bo8rFmzB
         6GZWaOWFmZwgoQ9CtjcXrX5bRzXEHN8dmZ4bzdypq/H7EOvG6mzYzErBUC7bpUXSyE5Y
         e2jy9jrDyM6s8VyXETbTHswVWlEBIhZ1j1CES+SAQTXjG1bzey1ett6essTjapiR1cz7
         B/Xuvx+u48TIL4hWflfyge8RmbyEYjPxFLFP7Xz7kW/5UsMOfhDgAD1C6DrwKefZXg/t
         wJOw==
X-Gm-Message-State: AOAM530DBJpmEo0qvD6qzRB2WpBIXRT1vgq2Xv+oyYfwzkz73pPkQKX+
	hqtZgyCuAxAjuzYmibnKrn/efVvXZEjM/wO4DYGSV5P+7EXxoKS9KhDa1Jzx0DZO/+Qg7ktR5rK
	FNKf1v6oH5x7EVgEMKeqqh4dHjgjHJiT/Kwbk13Vqfj4=
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr11043281wme.191.1631811907600;
        Thu, 16 Sep 2021 10:05:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFoPVpcbs+WRaVV7dRF1QA4InnI52r35X3w7JnJnSdjjA+61N6godLhYSuzpSl7b5GhJi+DQ==
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr11043255wme.191.1631811907375;
        Thu, 16 Sep 2021 10:05:07 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d8sm4278794wrv.20.2021.09.16.10.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 10:05:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx: drop unneeded MODULE_ALIAS
Date: Thu, 16 Sep 2021 19:05:03 +0200
Message-Id: <20210916170503.137757-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 45f9d797b9da..3daa636b67db 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2081,4 +2081,3 @@ module_platform_driver(imx_csi_driver);
 MODULE_DESCRIPTION("i.MX CSI subdev driver");
 MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx-ipuv3-csi");
-- 
2.30.2

