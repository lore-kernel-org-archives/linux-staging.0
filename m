Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCCB18594A
	for <linux-staging@lists.linux.dev>; Fri, 20 Sep 2024 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849276; cv=none; b=cuYVijxcWE5x+WCfPp32CEnVgCNDhGDkm15FVh7c+bny3D1z7SqOxYVPdlUfDUfe/jl8XSoC6xQQoOTONNQLU77N09U3AERxHbUmA+RGo0vLjIgsh7TSkyeKAz6GMgOWeGBTOiGgNdu2Lb28TQSxzWqcaXrQN8h57ylm72C4pm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849276; c=relaxed/simple;
	bh=10sS86pwP6gHcteFJPgYDUv/YPWBTwZwbZnLN814vYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g6y3HM3VZv8HqEjpmXe6/9EpV5uCAWy1M2iKE4PDu6Xr+2XHs/9NQopFpW8Yo4GOjo4SHIi0fku9qI2xpt5xBHJonUGQVVRNe5TRt8qeVEs8IYGldOkCqQtcNPL5PLN24ElH9hnbF1qOw6Qdb0U/f+eTJw14cCzG2+OjeFrCUPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io; spf=pass smtp.mailfrom=b1n.io; dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b=HDvKe6O8; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1n.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b="HDvKe6O8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b1n.io; s=key1;
	t=1726849269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9OorerApR/92ZiWdbVbfYZFIQiGs2U58WETLDI6z3U=;
	b=HDvKe6O845GJU/keyGIr4q/JWvAXQDawnMH7ywM9kzlnh69uYUu4+cOZkbyYHGDh1vQdjb
	vSMnPTdSgKDq9qALkx3NIv/jzMrsutgh0rk/qy99zHtLeSPyhAFxLNa4TFAo2PfHDuOHF2
	6Sv++Z/jK9sv9+IT5HGBVRSFVMILwhW/keYSSi6XA225q79B7gXEoZIC5V3Q0weNG0iVDd
	8XVoEysBmrMO1Ye4dttvj62SuA7wUhnRXf9fvdl28W45gJUWmFaXXwKMSiZ6Cpuxt0xowz
	k4CyY6Sr7s3VGsHQjVMMFfjLQVpcYgcp+DG+y+VsGmc8JofOV8L380ElZRK8MQ==
From: Xingquan Liu <b1n@b1n.io>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Xingquan Liu <b1n@b1n.io>
Subject: [PATCH 7/7] staging: vt6655: Rename variable aRD1Ring
Date: Sat, 21 Sep 2024 00:20:25 +0800
Message-Id: <20240920162025.31465-7-b1n@b1n.io>
In-Reply-To: <20240920162025.31465-1-b1n@b1n.io>
References: <20240920162025.31465-1-b1n@b1n.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Rename variable aRD1Ring to a_rd1_ring to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Xingquan Liu <b1n@b1n.io>
---
 drivers/staging/vt6655/card.c        |  4 ++--
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 712a478aac91..c8b3b16b03c6 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -436,7 +436,7 @@ void card_v_safe_reset_rx(struct vnt_private *priv)
 
 	/* initialize RD index */
 	priv->p_curr_rd[0] = &priv->a_rd0_ring[0];
-	priv->p_curr_rd[1] = &priv->aRD1Ring[0];
+	priv->p_curr_rd[1] = &priv->a_rd1_ring[0];
 
 	/* init state, all RD is chip's */
 	for (uu = 0; uu < priv->opts.rx_descs0; uu++) {
@@ -448,7 +448,7 @@ void card_v_safe_reset_rx(struct vnt_private *priv)
 
 	/* init state, all RD is chip's */
 	for (uu = 0; uu < priv->opts.rx_descs1; uu++) {
-		p_desc = &priv->aRD1Ring[uu];
+		p_desc = &priv->a_rd1_ring[uu];
 		p_desc->rd0.res_count = cpu_to_le16(priv->rx_buf_sz);
 		p_desc->rd0.owner = OWNED_BY_NIC;
 		p_desc->rd1.req_count = cpu_to_le16(priv->rx_buf_sz);
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 8fd4d972df14..591fcd02ee8e 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -139,7 +139,7 @@ struct vnt_private {
 	struct vnt_tx_desc *ap_td1_rings;
 
 	struct vnt_rx_desc *a_rd0_ring;
-	struct vnt_rx_desc *aRD1Ring;
+	struct vnt_rx_desc *a_rd1_ring;
 	struct vnt_rx_desc *p_curr_rd[TYPE_MAXRD];
 
 	struct vnt_options opts;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 84b8a476d240..eeb2f271ba0b 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -518,7 +518,7 @@ static bool device_init_rings(struct vnt_private *priv)
 	}
 
 	priv->a_rd0_ring = vir_pool;
-	priv->aRD1Ring = vir_pool +
+	priv->a_rd1_ring = vir_pool +
 		priv->opts.rx_descs0 * sizeof(struct vnt_rx_desc);
 
 	priv->rd0_pool_dma = priv->pool_dma;
@@ -650,7 +650,7 @@ static int device_init_rd1_ring(struct vnt_private *priv)
 	/* Init the RD1 ring entries */
 	for (i = 0; i < priv->opts.rx_descs1;
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
-		desc = &priv->aRD1Ring[i];
+		desc = &priv->a_rd1_ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
 		if (!desc->rd_info) {
 			ret = -ENOMEM;
@@ -663,13 +663,13 @@ static int device_init_rd1_ring(struct vnt_private *priv)
 			goto err_free_rd;
 		}
 
-		desc->next = &priv->aRD1Ring[(i + 1) % priv->opts.rx_descs1];
+		desc->next = &priv->a_rd1_ring[(i + 1) % priv->opts.rx_descs1];
 		desc->next_desc = cpu_to_le32(curr + sizeof(struct vnt_rx_desc));
 	}
 
 	if (i > 0)
-		priv->aRD1Ring[i - 1].next_desc = cpu_to_le32(priv->rd1_pool_dma);
-	priv->p_curr_rd[1] = &priv->aRD1Ring[0];
+		priv->a_rd1_ring[i - 1].next_desc = cpu_to_le32(priv->rd1_pool_dma);
+	priv->p_curr_rd[1] = &priv->a_rd1_ring[0];
 
 	return 0;
 
@@ -678,7 +678,7 @@ static int device_init_rd1_ring(struct vnt_private *priv)
 
 err_free_desc:
 	while (i--) {
-		desc = &priv->aRD1Ring[i];
+		desc = &priv->a_rd1_ring[i];
 		device_free_rx_buf(priv, desc);
 		kfree(desc->rd_info);
 	}
@@ -703,7 +703,7 @@ static void device_free_rd1_ring(struct vnt_private *priv)
 	int i;
 
 	for (i = 0; i < priv->opts.rx_descs1; i++) {
-		struct vnt_rx_desc *desc = &priv->aRD1Ring[i];
+		struct vnt_rx_desc *desc = &priv->a_rd1_ring[i];
 
 		device_free_rx_buf(priv, desc);
 		kfree(desc->rd_info);
-- 
Xingquan Liu

