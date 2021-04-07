Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A06D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:49:52 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFZgk2gTNzNtPD;
	Wed,  7 Apr 2021 14:46:58 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 14:49:38 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <hvaibhav.linux@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
	<gregkh@linuxfoundation.org>
CC: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>, Tian Tao
	<tiantao6@hisilicon.com>
Subject: [PATCH] staging: greybus: move to use request_irq by IRQF_NO_AUTOEN flag
Date: Wed, 7 Apr 2021 14:50:03 +0800
Message-ID: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
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
 drivers/staging/greybus/arche-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index e374dfc..be27ace 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -500,13 +500,13 @@ static int arche_platform_probe(struct platform_device *pdev)
 					arche_platform_wd_irq,
 					arche_platform_wd_irq_thread,
 					IRQF_TRIGGER_FALLING |
-					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN,
 					dev_name(dev), arche_pdata);
 	if (ret) {
 		dev_err(dev, "failed to request wake detect IRQ %d\n", ret);
 		return ret;
 	}
-	disable_irq(arche_pdata->wake_detect_irq);
 
 	ret = device_create_file(dev, &dev_attr_state);
 	if (ret) {
-- 
2.7.4

