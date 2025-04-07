Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3640192D8E
	for <linux-staging@lists.linux.dev>; Mon,  7 Apr 2025 03:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995315; cv=none; b=AmWT9RqOQ3Q5c9+a1WdCUiIyDDry03Pfwt5W420yUdPtrsZwLcuO99DpCuAmcoF7AC0APWLb3CmmFKpnPeIL9+24u9NrV6k2bXlBlaE6Xs+jFYD++eHo3RawtYdRYXFfqpmyRCNhTaNdtOW/GYWx5qieiUQzPrms1bVGnH1wr8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995315; c=relaxed/simple;
	bh=F2RVHRfKGzec4XIsvpV64YdBdo5xRHMDVu4WqHIDXbM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hLxWMzzrhy1CYIx3HdzieOf8nWHzVlXQztWzlM63a9VGLLTnAtaQHeuKY8aAZdPxdfadS3GBSwBKIyMLEfZgLAXrL0TVit+FEUc9CSOzB55Sbpu+KmiUeE0/kZe+XBzB29IGbVkX5fpQKv1i9hVnVKK2+e6FxYaYahNJNufEQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowABH7v6gQfNnQc7JBg--.11684S2;
	Mon, 07 Apr 2025 11:08:17 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	matchstick@neverthere.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	everestkc@everestkc.com.np
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] staging: gpib: eastwood: Remove unnecessary print function dev_err()
Date: Mon,  7 Apr 2025 11:07:43 +0800
Message-Id: <20250407030743.2382246-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH7v6gQfNnQc7JBg--.11684S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWrWF43Wr4rtryrAr4ruFg_yoWftwc_CF
	18ZrWxAr1SvFya9w10qF15urWSy3WkXr4Fga9FgFW7Gw4YvF1UZr98ZF9xJr47X3yxKFy8
	AryrGr4Ykr4fAjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUjAu4UUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Function dev_err() is redundant because platform_get_irq()
already prints an error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index a6b1ac169f94..65078b4aeea3 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -1024,10 +1024,8 @@ static int fluke_attach_impl(struct gpib_board *board, const gpib_board_config_t
 	}
 
 	irq = platform_get_irq(fluke_gpib_pdev, 0);
-	if (irq < 0) {
-		dev_err(&fluke_gpib_pdev->dev, "failed to obtain IRQ\n");
+	if (irq < 0)
 		return -EBUSY;
-	}
 	retval = request_irq(irq, fluke_gpib_interrupt, isr_flags, fluke_gpib_pdev->name, board);
 	if (retval) {
 		dev_err(&fluke_gpib_pdev->dev,
-- 
2.25.1

