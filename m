Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CC9A938
	for <linux-staging@lists.linux.dev>; Fri,  3 Mar 2023 21:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C39C4339C;
	Fri,  3 Mar 2023 21:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677880099;
	bh=cbWO7an7DylfP+mWKJycr3q9q9kP6l5spTuHFzL5k9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tur+lxfaWS2PEfHqhXCSCqorn0loYFDgF/ysu2nA3Y89cf4bydvogiyKsP8wgrKp2
	 ++6/CwpTJ1Kam3WHl37LtzKwKoTj4WP/bfsgMIpINtvKS/xVwZV2mEaykufRt2VOvy
	 rQKrAJ7IbE+b4fLuhcVVobHkxPbYDzCedd1So0rUN465yGD7kxoEqFa51KKmQw6D8N
	 04zH4H/spilGOGb1EQKnfYPsAr3mhkMu4DLP3PIv/FBq/0U9C5n4SeHVYnqR7ORAKN
	 DKBprDImMjHVFQuYzTkJxeiksIjZxgqcGnE9mEATN8Ukh70fT1LoQaDLHJqvLEt3Na
	 gUs/u7bb1s7Xg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yuan Can <yuancan@huawei.com>,
	Simon Horman <horms@verge.net.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	drv@mailo.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 06/20] staging: emxx_udc: Add checks for dma_alloc_coherent()
Date: Fri,  3 Mar 2023 16:47:52 -0500
Message-Id: <20230303214806.1453287-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214806.1453287-1-sashal@kernel.org>
References: <20230303214806.1453287-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Yuan Can <yuancan@huawei.com>

[ Upstream commit f6510a93cfd8c6c79b4dda0f2967cdc6df42eff4 ]

As the dma_alloc_coherent may return NULL, the return value needs to be
checked to avoid NULL poineter dereference.

Signed-off-by: Yuan Can <yuancan@huawei.com>
Reviewed-by: Simon Horman <horms@verge.net.au>
Link: https://lore.kernel.org/r/20230119083119.16956-1-yuancan@huawei.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/emxx_udc/emxx_udc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index cc4c18c3fb36d..7d18ad68be264 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2593,10 +2593,15 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
 		req->unaligned = false;
 
 	if (req->unaligned) {
-		if (!ep->virt_buf)
+		if (!ep->virt_buf) {
 			ep->virt_buf = dma_alloc_coherent(udc->dev, PAGE_SIZE,
 							  &ep->phys_buf,
 							  GFP_ATOMIC | GFP_DMA);
+			if (!ep->virt_buf) {
+				spin_unlock_irqrestore(&udc->lock, flags);
+				return -ENOMEM;
+			}
+		}
 		if (ep->epnum > 0)  {
 			if (ep->direct == USB_DIR_IN)
 				memcpy(ep->virt_buf, req->req.buf,
-- 
2.39.2

