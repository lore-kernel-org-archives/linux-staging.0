Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4BF6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:34:09 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFZLG3Gnyz17Qtq;
	Wed,  7 Apr 2021 14:31:50 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 14:33:54 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <marvin24@gmx.de>, <p.zabel@pengutronix.de>
CC: <ac100@lists.launchpad.net>, <linux-tegra@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] staging: nvec: move to use request_irq by IRQF_NO_AUTOEN flag
Date: Wed, 7 Apr 2021 14:34:19 +0800
Message-ID: <1617777259-27463-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/staging/nvec/nvec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index a80996b..f23e127 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -831,13 +831,12 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 		return PTR_ERR(nvec->gpiod);
 	}
 
-	err = devm_request_irq(dev, nvec->irq, nvec_interrupt, 0,
-			       "nvec", nvec);
+	err = devm_request_irq(dev, nvec->irq, nvec_interrupt,
+			       IRQF_NO_AUTOEN, "nvec", nvec);
 	if (err) {
 		dev_err(dev, "couldn't request irq\n");
 		return -ENODEV;
 	}
-	disable_irq(nvec->irq);
 
 	tegra_init_i2c_slave(nvec);
 
-- 
2.7.4

