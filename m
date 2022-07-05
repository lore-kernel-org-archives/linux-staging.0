Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F82917
	for <linux-staging@lists.linux.dev>; Tue,  5 Jul 2022 22:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270A7C341C7;
	Tue,  5 Jul 2022 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657061899;
	bh=S314lO4T2lM+NcgslhU9LnKRP/rYF/X11SknPJoW+9g=;
	h=From:To:Cc:Subject:Date:From;
	b=QjoLoGyCIt9XtjxbgZnbAMWobqj+wfxXvH2t+2u6OrDhHfEPFlSRbJHF9fKj5pg1k
	 UU3PhbKZNpw6lv1m/oKZr22msb3Zen6JzfCNa1OScokQgxsi+33SDNCj1UyuX5I4U+
	 a5He3vyrluQvP7F6BTU1GUUu2resnfIBDZEu0zvgX1zZSB37Eo+pjZV+mfQjm+jAZ5
	 JxFEr/z1mPwnGRo2d1jB1Nokcx0Z1BpOodBmXH/YySY0YQdrnCQ6j30nQzTp7lRYzg
	 N4C/IhPNDjavdVKUEU/lNEwRFEk9oR6GBgIBRhauAiN8wAI7V/Jv3o0uNZ0jPdJa0T
	 5kta2iaSxk5ew==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH staging] staging: switch to netif_napi_add_weight()
Date: Tue,  5 Jul 2022 15:58:01 -0700
Message-Id: <20220705225801.923601-1-kuba@kernel.org>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netif_napi_add() will soon default to weight of 64 instead of
requiring the user to specify that parameter. Most users already
pass or should pass 64. Move the callers in staging to
netif_napi_add_weight() which will keep the argument.
This way we'll avoid a huge cross-tree conversion when
argument is removed.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: gregkh@linuxfoundation.org
CC: manishc@marvell.com
CC: GR-Linux-NIC-Dev@marvell.com
CC: coiby.xu@gmail.com
CC: linux-staging@lists.linux.dev
---
 drivers/staging/octeon/ethernet-rx.c | 4 ++--
 drivers/staging/qlge/qlge_main.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 9ebd665e5d42..965330eec80a 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -469,8 +469,8 @@ void cvm_oct_rx_initialize(void)
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
-		netif_napi_add(dev_for_napi, &oct_rx_group[i].napi,
-			       cvm_oct_napi_poll, rx_napi_weight);
+		netif_napi_add_weight(dev_for_napi, &oct_rx_group[i].napi,
+				      cvm_oct_napi_poll, rx_napi_weight);
 		napi_enable(&oct_rx_group[i].napi);
 
 		oct_rx_group[i].irq = OCTEON_IRQ_WORKQ0 + i;
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 6cd7fc9589c3..552b9dba1944 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3041,8 +3041,8 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		/* Inbound completion handling rx_rings run in
 		 * separate NAPI contexts.
 		 */
-		netif_napi_add(qdev->ndev, &rx_ring->napi, qlge_napi_poll_msix,
-			       64);
+		netif_napi_add_weight(qdev->ndev, &rx_ring->napi,
+				      qlge_napi_poll_msix, 64);
 		cqicb->irq_delay = cpu_to_le16(qdev->rx_coalesce_usecs);
 		cqicb->pkt_delay = cpu_to_le16(qdev->rx_max_coalesced_frames);
 	} else {
-- 
2.36.1

