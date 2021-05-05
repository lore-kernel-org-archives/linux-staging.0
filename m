Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8B71
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z6so1602606wrm.4
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MNayJ6xW0bcCPRSdAbCKnJFYPUGrN6Aylipz/Mkt9WY=;
        b=knYdGXWp6V0kxYmBoCXGo2RmKyHBKIDCZz7IjjKFx7rpCSYgOy1Wo4AdtsQhDsdxxd
         ZdcleMYJAU5nulSCI4L0/eF+NysIfFjqzBmCVIzwSnMPfoKU5uK+UJueWSmFinI13mE1
         r8FQvRTrPhjeMDxtngrP+bMI+XpKhrPi1D6XNPEdMOqOfLBgrdBUCzBEL8GmMFzKqLBm
         shRk78w4Ja7SNU6hrZQw9XvYJJVw7s385ZapFzHpVz0TtWcEbnTwDPhjyT1qQYjrc/H2
         uUWEKkSPQSzXE697eGs80ltW/mb8jC9JfUh1Bd3YNx2QPzy7oOIOfGEZpnpQw/PElXzx
         pxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MNayJ6xW0bcCPRSdAbCKnJFYPUGrN6Aylipz/Mkt9WY=;
        b=U7RvRvxm6JLn/qyqEbBXFJPyZpvdxWZz4ahGPmCZ4gwEoRg7vipE+9G5W1nuPtfGGd
         6RFNMXwb39SYFsUyTJILJmGKY+df5xQ+hg+ZkF3uIgRCu2p4JhNb+G7BDEyH6GWSMkYp
         0xrx1K3U2MX+Yi52AqNs0j0wkD5LsLXVOTbOj9Pvfoz8kqemYdIAUhguv350ey25VWPb
         Osmt5MRw+J++YogVivjxLKAybpKTDUg/Egms21eaNtWUVc3vK15+jB8yUNZETqFaW9VA
         KXAw6/z5V6vkMhex25JYd+Ki30pfICSMrDKrv/oRQY3YlGqsCD3/ajoNkHQooCSWtFZz
         lo0w==
X-Gm-Message-State: AOAM533fzcW2SzEycx7kcwE/BQWMZIl0Xx0K1pHDkw1KzqGmu00dMG12
	RIlWsaiRaNteZXv7dKGwS6qoHldIOrDLkA==
X-Google-Smtp-Source: ABdhPJwHFjlgFXxxYlfQNULWm/4LVEeQgtjVSX/PdDp2uItjP7jvp5icGm6omV5pvUk2EIZKY1qpkQ==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr34144938wrr.368.1620217060094;
        Wed, 05 May 2021 05:17:40 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:39 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 02/10] staging: mt7621-pci: avoid to set gpio mode in driver
Date: Wed,  5 May 2021 14:17:28 +0200
Message-Id: <20210505121736.6459-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gpio mode for the pcie pins must be request from device
tree using pinctrl driver. Pinctrl driver is already setting
this pcie pins as GPIO if it is requested. Hence, remove it
from here.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index f490c7a1397d..984e333408a0 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -36,9 +36,6 @@
 
 #include "../../pci/pci.h"
 
-/* sysctl */
-#define MT7621_GPIO_MODE		0x60
-
 /* MediaTek specific configuration registers */
 #define PCIE_FTS_NUM			0x70c
 #define PCIE_FTS_NUM_MASK		GENMASK(15, 8)
@@ -79,8 +76,6 @@
 #define PCIE_PORT_INT_EN(x)		BIT(20 + (x))
 #define PCIE_PORT_LINKUP		BIT(0)
 
-#define PERST_MODE_MASK			GENMASK(11, 10)
-#define PERST_MODE_GPIO			BIT(10)
 #define PERST_DELAY_MS			100
 
 /**
@@ -478,8 +473,6 @@ static void mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 	struct mt7621_pcie_port *port, *tmp;
 	int err;
 
-	rt_sysc_m32(PERST_MODE_MASK, PERST_MODE_GPIO, MT7621_GPIO_MODE);
-
 	mt7621_pcie_reset_assert(pcie);
 	mt7621_pcie_reset_rc_deassert(pcie);
 
-- 
2.25.1

