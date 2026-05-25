Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953643E5A2C
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701049; cv=none; b=AyzSjsQmAFmzmUjUiHChUImpaNo4Qp62L9Eh8LtH7HQGXCXLnL1/baOyQML8Kf2aLupLB+n21MaFMWTw+rWeUjZ4tcYlv7MfCmNkw6o5UDQDW9MUnnomoPldhUnIafBLixSAxJ0b0HIxxteoHPsvKPRhfZ1/ong4TvTjcM5eAug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701049; c=relaxed/simple;
	bh=ot1Hj9GiN35Rn6MQidbBRW7vJ+45ilG/kY9mdc+hsrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nkMd2xivqfUktyei4yiTBOmhMOPECcrhyuU3qg+dzw34OyVgOA9rPV8x/7yJf1Q58DYsCOxL1G9XYoWzHvfSXp59VtXcnuKQG2bn7doI78Hb8aXb1JRfPVrxhOuUm458sLWh6t2lnfqewWvTCMoV8KzoTOi7t6+7mvE31eYmAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=GhrZTv8k; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="GhrZTv8k"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fb3b3b0c;
	Mon, 25 May 2026 17:18:38 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	omer.e.idrissi@gmail.com,
	hansg@kernel.org,
	hi@josie.lol,
	straube.linux@gmail.com,
	xela@viard.dev,
	ethantidmore06@gmail.com,
	liangjie@lixiang.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] staging: rtl8723bs: fix mismatched free of HalData in rtw_sdio_if1_init()
Date: Mon, 25 May 2026 17:18:36 +0800
Message-Id: <20260525091836.812565-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5e6ddb8703a2kunm898e496ea9790
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0lDVktJGE0aTxhLTxlCT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=GhrZTv8kHfk1G0bGObHlijMQijpeHuPwX9V+8apcs/APVUbZJlZiTGb+gC/ovAQXLb3rH2/XYEBnUavv0XcOBKzLitrIv8EOq7/pcd8++sxuFhyNu+WXLrlBAdOjNRKwhibSpNiqMck4sdJrVqe7GTMGtuNBfggYOHygLNp8FYk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=G54wTtP8oOz8xFcg6YQ5EByDU85ATZ8w3S7XbFKtVVI=;
	h=date:mime-version:subject:message-id:from;

padapter->HalData is allocated via vzalloc(), but incorrectly freed
using kfree() in the rtw_sdio_if1_init() error path. Using kfree() to
release this vmalloc-backed buffer can lead to memory corruption.

Use rtw_hal_data_deinit() to pair the free correctly and free
HalData with vfree().

The bug was first flagged by an experimental static analysis tool we
are developing for kernel memory-management bugs. Manual inspection
confirms that the issue is still present in current mainline.

An x86_64 allyesconfig build showed no new warnings. As we do not have
suitable RTL8723BS SDIO hardware to test with, no runtime testing was
able to be performed.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7043..67ef0e1271b0 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -287,8 +287,8 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	status = _SUCCESS;
 
 free_hal_data:
-	if (status != _SUCCESS && padapter->HalData)
-		kfree(padapter->HalData);
+	if (status != _SUCCESS)
+		rtw_hal_data_deinit(padapter);
 
 	if (status != _SUCCESS) {
 		rtw_wdev_unregister(padapter->rtw_wdev);
-- 
2.34.1

