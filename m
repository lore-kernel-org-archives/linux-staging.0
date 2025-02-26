Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473A260A20
	for <linux-staging@lists.linux.dev>; Wed, 26 Feb 2025 06:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740550079; cv=none; b=MHzv6pC2ToXGD9s/7AUChGiHwkHJFNZfuBrAUKA9ZSXXQnR1dwp56Xdcal12P+S+st1W1IGgDSluwb/AAQtdr9xPa/y5iEuUJyw7gQCJUVJoMDp1hFI6qqm0LYZz8Z7CciAe37058rdFF8pjWXvI9Jj2W0KKwjPoC0Sc2QVlSHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740550079; c=relaxed/simple;
	bh=fWzUrYTgV/wkqfEfRgamQ/cX79EECnU/IgMQ8Q0sjW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p2QrOdH4Exa/jyCpIRFKEpIK64xhrKiIfFzyg7v+zfvIF7+cgPzddkoQVF8eWDqXjjG9QUQaiwnfKua/sFzg8S8NIH0T1dpUjsKbiinn8fUtSdxRsH98vVvNkVEeiwvPUxuhM9wcNLuTRoOjeFbU5OlgugajQxcc/37oSv8qd7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e1KTJu5c; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e1KTJu5c"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740550069; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=TRolnCN3rTtJQxrW336J3gSU5hfuVtg1DupPkCZXpkA=;
	b=e1KTJu5cl//+tzoPgNEObtNDKNbmNYBN/340cZogIkdZgwf9mX5GCAF7vgF/WqDyQi+UnbBd9jBiHzvG0zPffJ+KNwuIoLv38/j1GQa8hamm51qbHKcz0krTT2OytSttoj9wRv/+GZepAgPcIQPfgg200UL7b+Vg+PqcRFFe91g=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WQH5E58_1740550064 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 26 Feb 2025 14:07:46 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 2/2] staging: gpib: Remove unnecessary print function dev_err()
Date: Wed, 26 Feb 2025 14:07:35 +0800
Message-Id: <20250226060735.7484-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20250226060735.7484-1-jiapeng.chong@linux.alibaba.com>
References: <20250226060735.7484-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

./drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1426:2-9: line 1426 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19059
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index d62c83368518..613bdcac12d1 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1422,10 +1422,9 @@ static int fmh_gpib_attach_impl(gpib_board_t *board, const gpib_board_config_t *
 		(unsigned long)resource_size(e_priv->dma_port_res));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(board->dev, "request for IRQ failed\n");
+	if (irq < 0)
 		return -EBUSY;
-	}
+
 	retval = request_irq(irq, fmh_gpib_interrupt, IRQF_SHARED, pdev->name, board);
 	if (retval) {
 		dev_err(board->dev,
-- 
2.32.0.3.g01195cf9f

