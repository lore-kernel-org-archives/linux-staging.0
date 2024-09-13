Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23BBA27
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 01:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726190636; cv=none; b=kl3InWk2NItVXdyXuTBlSUkMolkoBVmo20NhDa2w0pxpRa3bufJlz78z0ProN3TlBfYYf29Xsa4nv4wapqOmj6GeMWWFVCwTGGDWSURGluRjQSo2o/SaOFIkfehimx1+4IHPlIfd1Og0DhvTkxe3iUKnGMNrsDvXg99409CzJOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726190636; c=relaxed/simple;
	bh=FjF9XaFLykor6LcygGvodpXsGw2UPcPlkuT/eeEO8S4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kZuFhTaAeq+sAm28qknCzKiNRqwVOXax1NwnDs3K0Yv6gLZYjy4L6pUgPGodMmC0H843jpmQ/O/TZRYJksKffy6+y7G/2JQbVrpF/T2avaJm1Kg0ouCHqWN6Y8VGKOPaVS3galmtQVfn+gq5gsjX35k27NgHR9m3JqS0cpH/SIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io; spf=pass smtp.mailfrom=b1n.io; dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b=ScuqbIpi; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1n.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b="ScuqbIpi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b1n.io; s=key1;
	t=1726190631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2W251KwiR2mkAW7lL/nnUPaBVnBpueqFyB09Ru6QVtY=;
	b=ScuqbIpiFHCUL55IGqERWabT9ykLbSeM10kDzn5umShfbV0QWF1AKY0K+7L+PWNS5x5XyN
	Bi3TKu88kXFSCxto492FcRoyJg43ussoCQePZJgpuavEFJUxZRF6NTFa86r7ADGi87HX9F
	AAe8gFzF+c2020+/7bJtsEawnJsbxhwWlb8I+8JI8oW2Kz61W43oeUDO6lWOa2IdrUMmF6
	23OpMlV+GNqDZYObe3wIpOJP4zr5JgXJV3VWhaDsjrx/SOLQkE98FieDdXMyKpBNl4COpc
	Bhv1FKPhJAhF/b7MQkp/3obH7SVoYsjpsBUoUcXgd9otMRGxTAhDpmN8ZuFyZA==
From: Xingquan Liu <b1n@b1n.io>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Xingquan Liu <b1n@b1n.io>
Subject: [PATCH v3 1/2] staging: vt6655: Rename variable apTD0Rings
Date: Fri, 13 Sep 2024 09:23:41 +0800
Message-Id: <20240913012343.42579-1-b1n@b1n.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Rename variable apTD0Rings to ap_td0_rings to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Xingquan Liu <b1n@b1n.io>
---
v3: Add change history
v2: Rename variable apTD1Rings

 drivers/staging/vt6655/card.c        |  6 +++---
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c | 14 +++++++-------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 688c870d89bc..36bf8cde2e08 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -388,8 +388,8 @@ void card_safe_reset_tx(struct vnt_private *priv)
 	struct vnt_tx_desc *curr_td;
 
 	/* initialize TD index */
-	priv->tail_td[0] = &priv->apTD0Rings[0];
-	priv->apCurrTD[0] = &priv->apTD0Rings[0];
+	priv->tail_td[0] = &priv->ap_td0_rings[0];
+	priv->apCurrTD[0] = &priv->ap_td0_rings[0];
 
 	priv->tail_td[1] = &priv->apTD1Rings[0];
 	priv->apCurrTD[1] = &priv->apTD1Rings[0];
@@ -398,7 +398,7 @@ void card_safe_reset_tx(struct vnt_private *priv)
 		priv->iTDUsed[uu] = 0;
 
 	for (uu = 0; uu < priv->opts.tx_descs[0]; uu++) {
-		curr_td = &priv->apTD0Rings[uu];
+		curr_td = &priv->ap_td0_rings[uu];
 		curr_td->td0.owner = OWNED_BY_HOST;
 		/* init all Tx Packet pointer to NULL */
 	}
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 32d9cbd55222..32c51d794264 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -135,7 +135,7 @@ struct vnt_private {
 	struct vnt_tx_desc *apCurrTD[TYPE_MAXTD];
 	struct vnt_tx_desc *tail_td[TYPE_MAXTD];
 
-	struct vnt_tx_desc *apTD0Rings;
+	struct vnt_tx_desc *ap_td0_rings;
 	struct vnt_tx_desc *apTD1Rings;
 
 	struct vnt_rx_desc *aRD0Ring;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 9ea647aefd60..a8dcd8ad3945 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -550,7 +550,7 @@ static bool device_init_rings(struct vnt_private *priv)
 		priv->opts.tx_descs[0] * sizeof(struct vnt_tx_desc);
 
 	/* vir_pool: pvoid type */
-	priv->apTD0Rings = vir_pool
+	priv->ap_td0_rings = vir_pool
 		+ priv->opts.rx_descs0 * sizeof(struct vnt_rx_desc)
 		+ priv->opts.rx_descs1 * sizeof(struct vnt_rx_desc);
 
@@ -720,7 +720,7 @@ static int device_init_td0_ring(struct vnt_private *priv)
 	curr = priv->td0_pool_dma;
 	for (i = 0; i < priv->opts.tx_descs[0];
 	     i++, curr += sizeof(struct vnt_tx_desc)) {
-		desc = &priv->apTD0Rings[i];
+		desc = &priv->ap_td0_rings[i];
 		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
 		if (!desc->td_info) {
 			ret = -ENOMEM;
@@ -730,20 +730,20 @@ static int device_init_td0_ring(struct vnt_private *priv)
 		desc->td_info->buf = priv->tx0_bufs + i * PKT_BUF_SZ;
 		desc->td_info->buf_dma = priv->tx_bufs_dma0 + i * PKT_BUF_SZ;
 
-		desc->next = &(priv->apTD0Rings[(i + 1) % priv->opts.tx_descs[0]]);
+		desc->next = &(priv->ap_td0_rings[(i + 1) % priv->opts.tx_descs[0]]);
 		desc->next_desc = cpu_to_le32(curr +
 					      sizeof(struct vnt_tx_desc));
 	}
 
 	if (i > 0)
-		priv->apTD0Rings[i - 1].next_desc = cpu_to_le32(priv->td0_pool_dma);
-	priv->tail_td[0] = priv->apCurrTD[0] = &priv->apTD0Rings[0];
+		priv->ap_td0_rings[i - 1].next_desc = cpu_to_le32(priv->td0_pool_dma);
+	priv->tail_td[0] = priv->apCurrTD[0] = &priv->ap_td0_rings[0];
 
 	return 0;
 
 err_free_desc:
 	while (i--) {
-		desc = &priv->apTD0Rings[i];
+		desc = &priv->ap_td0_rings[i];
 		kfree(desc->td_info);
 	}
 
@@ -795,7 +795,7 @@ static void device_free_td0_ring(struct vnt_private *priv)
 	int i;
 
 	for (i = 0; i < priv->opts.tx_descs[0]; i++) {
-		struct vnt_tx_desc *desc = &priv->apTD0Rings[i];
+		struct vnt_tx_desc *desc = &priv->ap_td0_rings[i];
 		struct vnt_td_info *td_info = desc->td_info;
 
 		dev_kfree_skb(td_info->skb);
-- 
Xingquan Liu

