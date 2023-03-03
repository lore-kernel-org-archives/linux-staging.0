Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380CAA938
	for <linux-staging@lists.linux.dev>; Fri,  3 Mar 2023 21:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44559C4339B;
	Fri,  3 Mar 2023 21:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677879954;
	bh=yiAICD4Wt1AkeY5b6PGkTtvDc/urevGYv04TIFZDSis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwsJUmRobkLHLs8D5nUk2OBj/q56CR6zKJlFBKTaSExLdwZyoq3AyAfOhl202TTNF
	 LBUF7dDL4OYx/cSPbm/OjLKTVurz++OxwnflShl8VUY/kArnPPSRpSzyX5BV94FIhu
	 iF7lxhNXLH0SsGl07yAzpSVVQq4TGrJUSEl4xYccOwtLPDIE7H0Rk3rZbAFUCOUrAW
	 OFtZjA30hIuSxWZGdbjASzVAodLkYdET4NKQQLQh1yXl/qK7eLqFkN+0aF9bGm6aLo
	 j19wVrygIUkJ+NrpCWqASIaH2qGWrcaxdoGgSDM2sXbQ8Sb9wmkjsBaT5BkyeyXp6a
	 7lYzrOeDFkfZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yuan Can <yuancan@huawei.com>,
	Simon Horman <horms@verge.net.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	drv@mailo.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 09/50] staging: emxx_udc: Add checks for dma_alloc_coherent()
Date: Fri,  3 Mar 2023 16:44:50 -0500
Message-Id: <20230303214531.1450154-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214531.1450154-1-sashal@kernel.org>
References: <20230303214531.1450154-1-sashal@kernel.org>
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
index b6abd3770e81c..edd20a03f7a26 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2590,10 +2590,15 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
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

