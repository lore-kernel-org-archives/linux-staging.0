Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B320013D
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725282001; cv=none; b=eqUJ+YO47LXc9Gd9V+a/myka+HYAOFpGNW/7xSvijz1kuemwCSbcmLd7cTPTV/1k2fUoEwgSk5WfQjWooBDD0/Gk6Fst1CInBuGpXSZv/v08H/ClTQJba3lwRSPpsKbcZaNohI+nmGkaBmhmfY3NkDa63UKCvPPrGHnsbv9MGZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725282001; c=relaxed/simple;
	bh=Ijd+1ZGh/H1yUe2Jqo55RVOaQpTzShWGeO9f14RvB9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5GrJqqaYeyVv3qBidjTBKUPrUmMH2/rvrbhwSacwurJNAX9ylyvNCwNbYNdpYVPBaY7ssjUpytCsKT/gcYAPWFm89Ew6D51JY9S8vMln0wndnSr0F8qL5mVNCQd0cLiv0oo04uYU1dPjl16mXnbFdOy64mOCOb2ETe6P++T1fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wy83b0gnRz4f3m6g
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 20:59:39 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D46741A018D
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 20:59:54 +0800 (CST)
Received: from huaweicloud.com (unknown [10.85.165.202])
	by APP4 (Coremail) with SMTP id gCh0CgD3KsfEttVmOJPAAA--.25304S7;
	Mon, 02 Sep 2024 20:59:54 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: broonie@kernel.org,
	mchehab@kernel.org,
	Jonathan.Cameron@huawei.com,
	rmfrfs@gmail.com,
	vireshk@kernel.org,
	gregkh@linuxfoundation.org,
	deller@gmx.de,
	corbet@lwn.net,
	yangyingliang@huawei.com,
	liwei391@huawei.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH -next 3/7] spi: ch341: switch to use devm_spi_alloc_host()
Date: Mon,  2 Sep 2024 20:59:43 +0800
Message-ID: <20240902125947.1368-4-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.46.0.windows.1
In-Reply-To: <20240902125947.1368-1-yangyingliang@huaweicloud.com>
References: <20240902125947.1368-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgD3KsfEttVmOJPAAA--.25304S7
X-Coremail-Antispam: 1UD129KBjvdXoW7XFy7GFWxtFWxuw4DCF48JFb_yoW3WrX_ua
	y7Aw47W3yUKr1xtrnIgr42vryv9r15WF4v9FnIvry3AFZYyr1rCwsF9FyrJ3yUZw4xGr4f
	u3ZYqrZFkr13KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbq8YFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r1rM2
	8IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
	021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r
	4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	WUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFF4i
	UUUUU
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

Switch to use modern name function devm_spi_alloc_host().

No functional changed.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/spi/spi-ch341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ch341.c b/drivers/spi/spi-ch341.c
index d2351812d310..46bc208f2d05 100644
--- a/drivers/spi/spi-ch341.c
+++ b/drivers/spi/spi-ch341.c
@@ -152,7 +152,7 @@ static int ch341_probe(struct usb_interface *intf,
 	if (ret)
 		return ret;
 
-	ctrl = devm_spi_alloc_master(&udev->dev, sizeof(struct ch341_spi_dev));
+	ctrl = devm_spi_alloc_host(&udev->dev, sizeof(struct ch341_spi_dev));
 	if (!ctrl)
 		return -ENOMEM;
 
-- 
2.33.0

