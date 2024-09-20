Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268D184545
	for <linux-staging@lists.linux.dev>; Fri, 20 Sep 2024 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849266; cv=none; b=s5zGNypTqFikQuoYKReRilKIv7p/S1uT0OBqABkFd9rScdlr2pUN6K/NHoS3qOKPRsQNmyq3OjzIs/lGTJjOgIvaoibafb/ms8rQT45pU/ViypuGdMN3EgKaNIGn9v0XY7+cUuDTN8j/slNFPy5UlShhiyBOY6JzWch4jZrtjVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849266; c=relaxed/simple;
	bh=isrtOdhy0r41FDSggm1ZUPcCbsV0zMg0R3MtwtrMv6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rF/nSw8e8WI/Gxixk1vVOSmwDS3brppaV9Up/AjuQgOTS5F9fi3s8MBxvJbm+Aq3JdFXt5VrMAssn+x/ly+w7XLKuX76EE3EpwYgxYG9UIRfbmqkqdj5ax/wm2prs1KGD6sCUXKj++ynfe9X/ha3hklQCJv7S+vY2F0sQi56lV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io; spf=pass smtp.mailfrom=b1n.io; dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b=Xo01R2dq; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1n.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1n.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b1n.io header.i=@b1n.io header.b="Xo01R2dq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b1n.io; s=key1;
	t=1726849261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ikw+TmWhWhxyXHTjmAsgYmZc6fnxq5BNyZnoooQ8Ubw=;
	b=Xo01R2dqARhuzxeQkh0BPU7yTKhOhKtBws/U/CS+8Iu+il54XYoIVTF7hkGyHLtUI3+KKl
	RBzVDU8StYYyPCmWZ42HneXY3s1Uiy+PVe6ltDyKjDD5fw2ubEbItsJr2t77Xtwy/Y/rxR
	7rsJf6uOlnWAF/KethMedc4/pSpeserdGW7Ce1biKzbTpa0x5jwu387YKXn98CBFq4puK4
	QKjhtz5M2fhWkTfSwoY+A1U1LfC7MFQoxTIYL2s160Fk5Al34FDZv344rV6Ph3vmevQuGy
	9EREtep5qIVyTY0G19iAf67Yn+NQ1fNnFrzlCi/kM1Z7jzZq53/UrlFcxKMx4g==
From: Xingquan Liu <b1n@b1n.io>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Xingquan Liu <b1n@b1n.io>
Subject: [PATCH 5/7] staging: vt6655: Rename variable pCurrRD
Date: Sat, 21 Sep 2024 00:20:23 +0800
Message-Id: <20240920162025.31465-5-b1n@b1n.io>
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

Rename variable pCurrRD to p_curr_rd to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Xingquan Liu <b1n@b1n.io>
---
 drivers/staging/vt6655/card.c        | 4 ++--
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 9a546aaf1ad5..58b9bd451a54 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -435,8 +435,8 @@ void card_v_safe_reset_rx(struct vnt_private *priv)
 	struct vnt_rx_desc *p_desc;
 
 	/* initialize RD index */
-	priv->pCurrRD[0] = &priv->aRD0Ring[0];
-	priv->pCurrRD[1] = &priv->aRD1Ring[0];
+	priv->p_curr_rd[0] = &priv->aRD0Ring[0];
+	priv->p_curr_rd[1] = &priv->aRD1Ring[0];
 
 	/* init state, all RD is chip's */
 	for (uu = 0; uu < priv->opts.rx_descs0; uu++) {
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 57a396ad4d72..b89cd4707b86 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -140,7 +140,7 @@ struct vnt_private {
 
 	struct vnt_rx_desc *aRD0Ring;
 	struct vnt_rx_desc *aRD1Ring;
-	struct vnt_rx_desc *pCurrRD[TYPE_MAXRD];
+	struct vnt_rx_desc *p_curr_rd[TYPE_MAXRD];
 
 	struct vnt_options opts;
 
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 08e99f9b802f..caee5f90edb8 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -623,7 +623,7 @@ static int device_init_rd0_ring(struct vnt_private *priv)
 
 	if (i > 0)
 		priv->aRD0Ring[i - 1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
-	priv->pCurrRD[0] = &priv->aRD0Ring[0];
+	priv->p_curr_rd[0] = &priv->aRD0Ring[0];
 
 	return 0;
 
@@ -669,7 +669,7 @@ static int device_init_rd1_ring(struct vnt_private *priv)
 
 	if (i > 0)
 		priv->aRD1Ring[i - 1].next_desc = cpu_to_le32(priv->rd1_pool_dma);
-	priv->pCurrRD[1] = &priv->aRD1Ring[0];
+	priv->p_curr_rd[1] = &priv->aRD1Ring[0];
 
 	return 0;
 
@@ -823,7 +823,7 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 	struct vnt_rx_desc *rd;
 	int works = 0;
 
-	for (rd = priv->pCurrRD[idx];
+	for (rd = priv->p_curr_rd[idx];
 	     rd->rd0.owner == OWNED_BY_HOST;
 	     rd = rd->next) {
 		if (works++ > 15)
@@ -842,7 +842,7 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 		rd->rd0.owner = OWNED_BY_NIC;
 	}
 
-	priv->pCurrRD[idx] = rd;
+	priv->p_curr_rd[idx] = rd;
 
 	return works;
 }
-- 
Xingquan Liu

