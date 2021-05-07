Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4E2F81
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 06:01:45 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o127so4525552wmo.4
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 23:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gdoi/Ql794n4I6ECv2j9dtEFRugBMOEUCreF0AscFPk=;
        b=ZRs7XjuVmWRbqGlwoI/5q5k9lWVg/dGkjtzP/COgnl8vyQaVMjg9aGtksgTZeVojDY
         qKaY+5mtSPQRzlWo8E4XPy1qhS4Ld9v1vIWSDJJmPwCOw1zQ0CG2K5qZH1/GxOMDMKCU
         VOcsTDv1g6AajWCd7fH8/bW6tg/SeOD9xITxni1YAS+xP3WZeZYssGesuYshEk9SgC9u
         GGspo+/l2X9B2YDDJqYq/gwDcKQxO3aBaoRfTixaCA39UWR5a9J8S77il0HCl8PalyFa
         aLZkrCnWiSDCAOpFoipN4ZdyALgVDEC4n0ayLhIP9p5wsUAZpmM7t3sPl/RpWjjQGU1Y
         rNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gdoi/Ql794n4I6ECv2j9dtEFRugBMOEUCreF0AscFPk=;
        b=L+L86jqGGtNEbwIyceUcCKdPxAkhb3PWsg9MJYmPXhfYbyNpippIAzbf7tB/uCExBu
         wA5ot8Kn168gm0+hcA0jCoEvxQxizYMPd3R8JbRe0Vj5wHKvBf2x80fUsfa/RmT8FD1f
         iR0I3pYFbjs6ZOC1OzSyMeG06G+BC4FVOrCQI4S3UykNOAvSTG457kL6QZdlDnNCw8Sh
         SmcQO/cFJbTXW5tZtfcCXfJGlmTibO4kGDpDTmZrv+tCT9fItTBH8M15+znnsluQvX90
         mWCyoMDtvJzA1Z3kZQ2LasMnv/3eMIBkc6sDLIwrLlIIkiEC4qVilro47su6/wDtJwT3
         DP5Q==
X-Gm-Message-State: AOAM532OWa2rPVD76b3NsuPWsPawSUY0oAvzsnVdiwzFrHEdAnKVXIbE
	v4LkmO6A4ftXfvZ8hZwshGo=
X-Google-Smtp-Source: ABdhPJy6AVR/t54PlZkE7ZrKrOCcVGpPfgWXcYCh5LyVUnABjvf/JzN7PpjBMHth6obsTFxS1ZPHrg==
X-Received: by 2002:a05:600c:3205:: with SMTP id r5mr7967581wmp.78.1620367304414;
        Thu, 06 May 2021 23:01:44 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id r2sm7120242wrt.79.2021.05.06.23.01.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 23:01:43 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] phy: ralink: phy-mt7621-pci: properly print pointer address
Date: Fri,  7 May 2021 08:01:42 +0200
Message-Id: <20210507060142.17049-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way of printing the pointer address for the 'port_base'
address got into compile warnings on some architectures
[-Wpointer-to-int-cast]. Instead of use '%08x' and cast
to an 'unsigned int' just make use of '%px' and avoid the
cast.

Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index 753cb5bab930..4705931fb072 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -272,8 +272,8 @@ static struct phy *mt7621_pcie_phy_of_xlate(struct device *dev,
 
 	mt7621_phy->has_dual_port = args->args[0];
 
-	dev_info(dev, "PHY for 0x%08x (dual port = %d)\n",
-		 (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
+	dev_info(dev, "PHY for 0x%px (dual port = %d)\n",
+		 mt7621_phy->port_base, mt7621_phy->has_dual_port);
 
 	return mt7621_phy->phy;
 }
-- 
2.25.1

