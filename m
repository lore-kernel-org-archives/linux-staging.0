Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D61071
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:52:42 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d4so11333396wru.7
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5j0/SkQ5MnH/k0JVcJB2AM+3scDK+wjHcTxj/JFadC8=;
        b=dZLeUeGgWm6ReD3QMlIYH3+IUdA1AhWyrFvia76N5Lv/V5HNlKbGVPUwPj0qHhRDJY
         wqlkUBMh8/gJSwCRZd1EmkRiF1yoeVF3nrMNCLxSX4356Dj5iHtQ0zKe1nBSWrW6tYu8
         3oHM3+SeH0itadhOEKhGNuk9JiLy3wufpu6bBa4p/C+/HO+m1pmqOXebdIewAAE0fysa
         UdJ3V5xYqQbBj0jSLGiF0ttCXQvrFKuaMaSRknf2H4ZAVJ81AOHd2W4jz++KC1eIkMvR
         qEICOKYGI5+7MSxrqEmDkTNqa8cQFfGCF1PsNEHx/9/DMc78KPh9wHPQ3R8B1d6Gv9vt
         zCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5j0/SkQ5MnH/k0JVcJB2AM+3scDK+wjHcTxj/JFadC8=;
        b=r7fTzMx5Mihs/+uhIDk5K391e68q21Jw6vQUtD1cAlbglKrEWRiq1QFbfKhZawkV4C
         u2F9m6ANuADGMPx1r7I8lo/EXTNWM6FAu6q9ksHk/bOQiDnsGjbqBfltE3lLaY3IhV+I
         JM6BUhn/E5VwjgQaYgCK/80gBg31lhMPR5JQUu1qm+660FET+hqIckuGEQbsvOswsqPk
         Cc4yH+caD6L3IG7ZyMbbtv8Z3hwgnuZ4LtldtWZUgnF/PV58S28+oS0LeT77oLkbZlvN
         8/HYoPBJBzUwZKeX6iCg/tTPnUJZ7sq9m2OuwrvzG8lHNBP/K//74LWhYsGEUoXw+KTw
         mT1Q==
X-Gm-Message-State: AOAM530rCMaKkP/meJEyAIGMqWgsTORqnbdEp3UeDrFfxfs2ANaeFLXR
	qroBPZ88ck8faLh/olUnUb8=
X-Google-Smtp-Source: ABdhPJynptSGPcE0oVi9YgE3/ZJrwY7orEHgL37roQv0+O0PTCkHPNJosQMbhEIGeC/BNx2uNCc0Tg==
X-Received: by 2002:a05:6000:4d:: with SMTP id k13mr17715631wrx.98.1620456761033;
        Fri, 07 May 2021 23:52:41 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id b12sm11638010wro.28.2021.05.07.23.52.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 23:52:40 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 6/6] phy: ralink: phy-mt7621-pci: properly print pointer address
Date: Sat,  8 May 2021 08:52:32 +0200
Message-Id: <20210508065232.4882-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
References: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
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
cast. To avoid not really needed driver verbosity on normal
behaviour change also from 'dev_info' to 'dev_dbg'.

Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index f56ff10b0885..242c5d8b8635 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -273,8 +273,8 @@ static struct phy *mt7621_pcie_phy_of_xlate(struct device *dev,
 
 	mt7621_phy->has_dual_port = args->args[0];
 
-	dev_info(dev, "PHY for 0x%08x (dual port = %d)\n",
-		 (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
+	dev_dbg(dev, "PHY for 0x%px (dual port = %d)\n",
+		mt7621_phy->port_base, mt7621_phy->has_dual_port);
 
 	return mt7621_phy->phy;
 }
-- 
2.25.1

