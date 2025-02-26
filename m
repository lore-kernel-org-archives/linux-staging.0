Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9452B267720
	for <linux-staging@lists.linux.dev>; Wed, 26 Feb 2025 06:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740550078; cv=none; b=nJkAtRh4yCgovU6HHwgMin2ugEUi9IOuyOjkxcEessWOjBQusOGB2xr2llr8eyw/0ijwULUIHuqh6vJ21l2FlNqy3Ppl6LXLZHkydQ1jiEI/FP10J9kD7KkPxNnIWOt3p3/su4jrmZhvNo552ln0tnBJxvzQgHR4iag6IEt0Npo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740550078; c=relaxed/simple;
	bh=8k4y1k9uoqfb+mNYhBKVhr39gYXqU/HUdNIc+gDhJpk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JjYkbZySp0jTDjyABMvQDn7gliGfutHc3ZxpdAujAtPYQ+HR259gVhlInFcQJsFBIEha1EF1R9s5OHZba4Swj2FkCabina2NoLsxHwfUZDTfv4qys35rRg/+lAzmfO4BivdmWcPhW70A+X0Apoiw9GXZqNve/pdIxuFJeTiEUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RMm8SUg0; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RMm8SUg0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740550065; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wAxArRDxBnjpu2aNqzZ/Asf0HNXmKUNnebF3IwcFNFM=;
	b=RMm8SUg0A/nDxObKfJ4tzG43FIVeff9z14K1P0qL6KzeMwteMkHrLFYUjyx7pcDLs0rDM4C2BoJIlATYYbRBHWcsO8+GDyQPG7OPG9SHiDsCEQ79WGjnS0x6BmHZ1a1OxGn1R81MM2cIXzmodn5pBmLkt0t2Y2zN1YOIjEOHWfY=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WQH-AtE_1740550058 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 26 Feb 2025 14:07:44 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 1/2] staging: gpib: Remove unnecessary print function dev_err()
Date: Wed, 26 Feb 2025 14:07:34 +0800
Message-Id: <20250226060735.7484-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

./drivers/staging/gpib/eastwood/fluke_gpib.c:1027:2-9: line 1027 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19058
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 731732bd8301..4fd3a6cad0d2 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -1023,10 +1023,9 @@ static int fluke_attach_impl(gpib_board_t *board, const gpib_board_config_t *con
 	}
 
 	irq = platform_get_irq(fluke_gpib_pdev, 0);
-	if (irq < 0) {
-		dev_err(&fluke_gpib_pdev->dev, "failed to obtain IRQ\n");
+	if (irq < 0)
 		return -EBUSY;
-	}
+
 	retval = request_irq(irq, fluke_gpib_interrupt, isr_flags, fluke_gpib_pdev->name, board);
 	if (retval) {
 		dev_err(&fluke_gpib_pdev->dev,
-- 
2.32.0.3.g01195cf9f

