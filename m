Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D67B
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 15:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDC4C385B2;
	Wed, 27 Apr 2022 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651074083;
	bh=ShN4tiXN0R+06SrR2QbZNK0QXiETGbH46QSgjJuPiOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=he+civ/MjiqVs3/dOxb3Pgkh7Mj17CwwDpdbcIw50FzPCWpmGFPxx9MNGAOCTjflS
	 eMxPLUX3jGILTFe9c1nDCpEFPa22MOcG90zO6h+FD218cphEzYs+mpGnrphmnRjOn6
	 LD2ZHVmeCxGGoOTB/H1oN9NKUBcKBU7EWVABk8oV2ItgO8ZeRaaMMcZ0xeb6M8ulCk
	 /9nXYvXHaHTJX7ztbbgztRvfsQ0CwRnovZmrfAjVejC6YOe6th/ji5k966fTnIOyI4
	 9gf6m26WNID2g3wc9WjaGCfX0N3KVJ0mVj2oKcpa1yeBk4FkRTXxmhh7p37PaIcM/S
	 66SyN1xvSjTLQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	steve.glendinning@shawell.net,
	david.kershner@unisys.com,
	gregkh@linuxfoundation.org,
	liujunqi@pku.edu.cn,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev
Subject: [PATCH net-next 02/14] eth: remove NAPI_WEIGHT defines
Date: Wed, 27 Apr 2022 08:40:59 -0700
Message-Id: <20220427154111.529975-3-kuba@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427154111.529975-1-kuba@kernel.org>
References: <20220427154111.529975-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defining local versions of NAPI_POLL_WEIGHT with the same
values in the drivers just makes refactoring harder.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: steve.glendinning@shawell.net
CC: david.kershner@unisys.com
CC: gregkh@linuxfoundation.org
CC: liujunqi@pku.edu.cn
CC: sparmaintainer@unisys.com
CC: linux-staging@lists.linux.dev
---
 drivers/net/ethernet/smsc/smsc9420.c            | 2 +-
 drivers/net/ethernet/smsc/smsc9420.h            | 1 -
 drivers/staging/unisys/visornic/visornic_main.c | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smsc9420.c b/drivers/net/ethernet/smsc/smsc9420.c
index d937af18973e..0c68c7f8056d 100644
--- a/drivers/net/ethernet/smsc/smsc9420.c
+++ b/drivers/net/ethernet/smsc/smsc9420.c
@@ -1585,7 +1585,7 @@ smsc9420_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	dev->netdev_ops = &smsc9420_netdev_ops;
 	dev->ethtool_ops = &smsc9420_ethtool_ops;
 
-	netif_napi_add(dev, &pd->napi, smsc9420_rx_poll, NAPI_WEIGHT);
+	netif_napi_add(dev, &pd->napi, smsc9420_rx_poll, NAPI_POLL_WEIGHT);
 
 	result = register_netdev(dev);
 	if (result) {
diff --git a/drivers/net/ethernet/smsc/smsc9420.h b/drivers/net/ethernet/smsc/smsc9420.h
index 409e82b2018a..876410a256c6 100644
--- a/drivers/net/ethernet/smsc/smsc9420.h
+++ b/drivers/net/ethernet/smsc/smsc9420.h
@@ -15,7 +15,6 @@
 /* interrupt deassertion in multiples of 10us */
 #define INT_DEAS_TIME			(50)
 
-#define NAPI_WEIGHT			(64)
 #define SMSC_BAR			(3)
 
 #ifdef __BIG_ENDIAN
diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index 643432458105..81ac3ac05192 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -26,7 +26,6 @@
  *         = 163840 bytes
  */
 #define MAX_BUF 163840
-#define NAPI_WEIGHT 64
 
 /* GUIDS for director channel type supported by this driver.  */
 /* {8cd5994d-c58e-11da-95a9-00e08161165f} */
@@ -1884,7 +1883,8 @@ static int visornic_probe(struct visor_device *dev)
 
 	/* TODO: Setup Interrupt information */
 	/* Let's start our threads to get responses */
-	netif_napi_add(netdev, &devdata->napi, visornic_poll, NAPI_WEIGHT);
+	netif_napi_add(netdev, &devdata->napi, visornic_poll,
+		       NAPI_POLL_WEIGHT);
 
 	channel_offset = offsetof(struct visor_io_channel,
 				  channel_header.features);
-- 
2.34.1

