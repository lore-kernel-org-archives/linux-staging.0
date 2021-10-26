Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F02C9F
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 17:50:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D49BA60F24;
	Tue, 26 Oct 2021 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635270652;
	bh=iCVmFN9H6OTgsfDSH4k0BDSm2Da0RWMIQ7h+0LMCCwc=;
	h=From:To:Cc:Subject:Date:From;
	b=ChE86XzNP0H7IWMu9g2ZVa13veaaPTImTRW5izZZVInyWEwdp9JwhIr5zXH0Rzpdu
	 4u+ibc1qy8pkOmNEn7M0xAjBxhzfmxeUpxL+HlAPcIWPBV9jpHgOjES4KNpXbwCUHj
	 +niUYURAexeeyNSEAaumPXZ1gB4LsiljV5xCjhtGIJq8HTdmccyX7ngk/82jA7gPu4
	 oE6RLfkEK9yz6aPeFwLGfa1/88AXXCfRCM6UrpWZTpxVxjFtyAhoDbcSnJtdAn/kE7
	 ajOlmacG37mWXZgo0vraeWRs8g3mA6OtmAQxmALd24J+KpGWmYEB7YgFsXrEqsnIXv
	 s1NN/arRGtCtA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next] staging: use of_get_ethdev_address()
Date: Tue, 26 Oct 2021 10:50:38 -0700
Message-Id: <20211026175038.3197397-1-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new of_get_ethdev_address() helper for the cases
where dev->dev_addr is passed in directly as the destination.

  @@
  expression dev, np;
  @@
  - of_get_mac_address(np, dev->dev_addr)
  + of_get_ethdev_address(np, dev)

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
Hi Greg, this needs to go to net-next, the helper is new.
---
 drivers/staging/octeon/ethernet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index bf8c5443a218..f662739137b5 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -409,7 +409,7 @@ int cvm_oct_common_init(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int ret;
 
-	ret = of_get_mac_address(priv->of_node, dev->dev_addr);
+	ret = of_get_ethdev_address(priv->of_node, dev);
 	if (ret)
 		eth_hw_addr_random(dev);
 
-- 
2.31.1

