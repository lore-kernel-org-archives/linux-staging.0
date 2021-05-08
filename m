Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19A2F80
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:52:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t18so11355435wry.1
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+GCOf42Gs4UdMdK0477XZHtOpuU44Ecgu3QGsmZOXI=;
        b=D7YXSUvFJ1UwGS+L85/ddn9o7Vw4zuD6OMLrBiYsz5zuj3d44dVU9fOL5dEsSZggE1
         HESWScDH+/OMGjnTOi+Gg9msmbatZU98GC70wqhS5l71pT0Zge9OzSVCIg7X2DlbMcp9
         c1hdumLmmRg90tivSQMzAtHoUnxtXvoqm+nZ/EmlqFQ5xNRuvh/7dBEoaC48WqOR7Cbw
         E6QlYKZSIo0VB7RPw2c5F7SdURRi+GPP/h4laftc2bLQExdy6pJL99bgaA2raUhbL4pd
         6jZWeBiefAw3O6Nu9MWKX7DIyHp6ikkHJRcGx+F4ycwk6z6k67slL3bErsjEaraEdODc
         dF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+GCOf42Gs4UdMdK0477XZHtOpuU44Ecgu3QGsmZOXI=;
        b=OYwlg28OejCjXQb2ip7X2SqnU5Fby9oPiDuTGJ8Yj9/xpjxHqx1iSbvPk8fOJnLb8v
         kIfx8sKwnuH35LI7mcPQvWnmsVQyr1IIDjN2naUOJjr3+i8GKPLY0tS9iZO9VOvYy/Rw
         ItRi7qo9A55M4FmRMLH+akn8aXNYWQVqBTud0/uwF5NQMPOI95crs0sHQCPR8fK8tdrA
         YC1zREN45DpOQkqWDBVYvFpgu+EE/FFo25upUG6XB5QzOxJYT+eLXeiXrkOx6cjNx6aj
         ucqKbZWj/c1etX3PtIjjh+jFhbcY4qBWt22oDX+GoWVSFHKZ+BZ0waCx9AufLgMoppGU
         GbrQ==
X-Gm-Message-State: AOAM532MfBe2rHpndHk2j5pVOiOciW1nrU0NqucUVTvvhK6yhO3EcSTE
	5HYzUFJxrOvZTJ3XW0VrSUE=
X-Google-Smtp-Source: ABdhPJzJmb7g9rySb6hDTExDxrdT2v6fxhAzYGLCgbfbAq9xJrgWHzJjWZhQvsb+hXEHxu/2QIvUow==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr17885451wrs.248.1620456760085;
        Fri, 07 May 2021 23:52:40 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id b12sm11638010wro.28.2021.05.07.23.52.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 23:52:39 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH v2 5/6] phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'
Date: Sat,  8 May 2021 08:52:31 +0200
Message-Id: <20210508065232.4882-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
References: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make dependent on PCI_MT7621 configuration option and mark
this pci phy configuration as bool which has more sense.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ralink/Kconfig b/drivers/phy/ralink/Kconfig
index c2373b30b8a6..ed0c71eff2c4 100644
--- a/drivers/phy/ralink/Kconfig
+++ b/drivers/phy/ralink/Kconfig
@@ -3,8 +3,8 @@
 # PHY drivers for Ralink platforms.
 #
 config PHY_MT7621_PCI
-	tristate "MediaTek MT7621 PCI PHY Driver"
-	depends on (RALINK && OF) || COMPILE_TEST
+	bool "MediaTek MT7621 PCI PHY Driver"
+	depends on (RALINK && OF && PCI_MT7621) || COMPILE_TEST
 	select GENERIC_PHY
 	select REGMAP_MMIO
 	help
-- 
2.25.1

