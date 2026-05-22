Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7E3C98AE
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451153; cv=none; b=LwE/RZM0DaTGjIygpG2ioeyxeHRetQA4VqCk+8+oBXN/KjoQdaRjxb3WTotIdE/ErhlG4f4WGExmPo7Z2vTZSeBx6gHfagPWG+cog9PO6Mw7OCtLPrrKqnXpzSWe9g1DjVi08Qh0Ak08PMfoAJ+ahD0/O2E4n7jLzhH2xL76oA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451153; c=relaxed/simple;
	bh=P6NKJepHDEldrDoAtAhY1G+j+eG/CfIj3+BCwC7Enxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaHrD/rrnCkjn3xtNpCfQGVMVaDtj5nIKJSHuZ+zHzMCMyd0eYzCLxrJdmxQT2IU8aLGkgoqwKQRSRqLZVErSTzPVdRmKljtnyIr+sqZYnOcG/lCZmKN7cO7Wsra/zxq3UHDgM4Roz2u5jTtFgYw1SjDumYJF/T0//QHfHBz4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nMe6W3/p; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bF80ysCy; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nMe6W3/p";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bF80ysCy"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gMP2Q1QZ6z9v6N;
	Fri, 22 May 2026 13:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779451150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JaT0Mmi5kRosXDaJANNe0+bt1nLSvyko8bew8ddEJcY=;
	b=nMe6W3/p0LYzAHMn2R2vNu5wEMPhpsZBcTX3FETEtRU8juL6JclMxEqS8thfKpmuGmU+EL
	Qysb6TukRueVmHw2FBwyF5MrdMRKMGjfDq51FpuME89gDqRPqDcBL16WmSE9tuETJmgH17
	0ctkZTqs0WXkzAIglpjOIEEC+NaqHGx2VWssvzRESDybl1k49VgZ/uK00C+u2sw6iOsVb4
	3oKnpe96vviFUDLvbtJnr7poIqvtOjK/m31nkTATErTptrU+5/u616LiSXspeKfwIv5BcU
	6CuxeJa/MHd5vpJW8DAPxS2hkmPlVkUP0ZNYYBcmhKfBiu28lmqZ7ddfcIINRQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779451148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JaT0Mmi5kRosXDaJANNe0+bt1nLSvyko8bew8ddEJcY=;
	b=bF80ysCy2ktXeveFH7jgcj7aQNhF2EsF9BmNogR2H2eQg0Ckdfby5e7AbkCDwdndfxcZd1
	LOXwrXnmL+6dlxcNc115dLD8YbnxwnKh+jRwBQrqmOVrqpKYjP4AbH9UJD9WgSfN3PJwP5
	4T11uWWMvN5kSYh5uOfVX4KiFDKTxcnRZJc7L9uLFSvXM6GImVph7Afh9kvavQOT4MHLB4
	Mhe0OYW2QcGWxc3exTprwXnIAqCW2BGMyor1UDQz4//cKlidGm7Sf1UOs2nOX74SXZXcgh
	y8a7LeVXRweGqWWesRwn4v+xW93/gU3MbHpJXNCr8/TnpV+FpjC+jL98hofbDg==
To: manuelebner@mailbox.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	omer.e.idrissi@gmail.com
Subject: [PATCH v2 3/3] staging: cleanup braces of sdio_intf.c
Date: Fri, 22 May 2026 13:58:22 +0200
Message-ID: <20260522115821.190595-2-manuelebner@mailbox.org>
In-Reply-To: <20260522114317.189368-4-manuelebner@mailbox.org>
References: <20260522114317.189368-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f8efe5709cf7c5ab15e
X-MBO-RS-META: s8wccskhdnrnnwsdhn5jm87sgqeer7s5

add braces to else statement

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index a78fb4bc7155..fc16cf2e577d 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -100,8 +100,9 @@ static void sdio_free_irq(struct dvobj_priv *dvobj)
 				netdev_err(dvobj->if1->pnetdev,
 					   "%s: sdio_release_irq FAIL(%d)!\n",
 					   __func__, err);
-			} else
+			} else {
 				dvobj->drv_dbg.dbg_sdio_free_irq_cnt++;
+			}
 			sdio_release_host(func);
 		}
 		dvobj->irq_alloc = 0;
-- 
2.54.0

