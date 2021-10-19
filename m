Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAE2C9F
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D14A26136F;
	Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663570;
	bh=qL3RUV3eNBRMcySy/QP/o+HqKDZCDMhf75jE99QV0Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sv30HtdUgiEzD7eLd1LkM5PQWg/+pH9hl7+eIZPNq4Ks4GyNCPIh823wavtWjbZYy
	 3bbEFA5TuCDOVk/eVmelk3EknHufG7iPQPehZqgzW5c4++B4LFG2POLVusIcL1kGCI
	 ssmbCMzvMkZVKLDxj+rBkurIS/IDruI0oSJk7BvNNfV6zcPj8EEuxFQKus3xL757Up
	 NtU+bC8avPwTwVpOCmuN2vRy9pb3uP8VSQCpZQQpqBNwUwEisTA0kVYyxYlY/rU9Q9
	 pQAjbv8HpH+HuSexkcMLaerJ5yVNDefaiG+ykXMzyIEE6mTEzUJwo5RVMjJbPOCFkf
	 DKQn+NTWZk3rg==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com
Subject: [PATCH 4/8] staging: qlge: use eth_hw_addr_set()
Date: Tue, 19 Oct 2021 10:12:39 -0700
Message-Id: <20211019171243.1412240-5-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019171243.1412240-1-kuba@kernel.org>
References: <20211019171243.1412240-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
of VLANs...") introduced a rbtree for faster Ethernet address look
up. To maintain netdev->dev_addr in this tree we need to make all
the writes to it got through appropriate helpers.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: manishc@marvell.com
CC: GR-Linux-NIC-Dev@marvell.com
CC: coiby.xu@gmail.com
CC: gregkh@linuxfoundation.org
CC: linux-staging@lists.linux.dev
---
 drivers/staging/qlge/qlge_main.c | 8 ++++----
 drivers/staging/qlge/qlge_mpi.c  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index abb7844f92fb..ee6b49ca2ddf 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -321,8 +321,8 @@ int qlge_get_mac_addr_reg(struct qlge_adapter *qdev, u32 type, u16 index,
 /* Set up a MAC, multicast or VLAN address for the
  * inbound frame matching.
  */
-static int qlge_set_mac_addr_reg(struct qlge_adapter *qdev, u8 *addr, u32 type,
-				 u16 index)
+static int qlge_set_mac_addr_reg(struct qlge_adapter *qdev, const u8 *addr,
+				 u32 type, u16 index)
 {
 	u32 offset = 0;
 	int status = 0;
@@ -441,7 +441,7 @@ static int qlge_set_mac_addr(struct qlge_adapter *qdev, int set)
 	status = qlge_sem_spinlock(qdev, SEM_MAC_ADDR_MASK);
 	if (status)
 		return status;
-	status = qlge_set_mac_addr_reg(qdev, (u8 *)addr,
+	status = qlge_set_mac_addr_reg(qdev, (const u8 *)addr,
 				       MAC_ADDR_TYPE_CAM_MAC,
 				       qdev->func * MAX_CQ);
 	qlge_sem_unlock(qdev, SEM_MAC_ADDR_MASK);
@@ -4217,7 +4217,7 @@ static int qlge_set_mac_address(struct net_device *ndev, void *p)
 	status = qlge_sem_spinlock(qdev, SEM_MAC_ADDR_MASK);
 	if (status)
 		return status;
-	status = qlge_set_mac_addr_reg(qdev, (u8 *)ndev->dev_addr,
+	status = qlge_set_mac_addr_reg(qdev, (const u8 *)ndev->dev_addr,
 				       MAC_ADDR_TYPE_CAM_MAC,
 				       qdev->func * MAX_CQ);
 	if (status)
diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
index 2630ebf50341..96a4de6d2b34 100644
--- a/drivers/staging/qlge/qlge_mpi.c
+++ b/drivers/staging/qlge/qlge_mpi.c
@@ -862,7 +862,7 @@ int qlge_mb_wol_set_magic(struct qlge_adapter *qdev, u32 enable_wol)
 	struct mbox_params mbc;
 	struct mbox_params *mbcp = &mbc;
 	int status;
-	u8 *addr = qdev->ndev->dev_addr;
+	const u8 *addr = qdev->ndev->dev_addr;
 
 	memset(mbcp, 0, sizeof(struct mbox_params));
 
-- 
2.31.1

