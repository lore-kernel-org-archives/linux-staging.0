Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759703EBF20
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450962; cv=none; b=qIVAE4ybI+7vSvVTymDtzzEWwAn45E3gwfUQRm3DXphi2RuOlhYXhhxwtP7zY4H2wPNAWD8tKpKb1akeWRYadpVasFV5P+MBZFdsuIF1vrFL8GP9/wViUfhm1b+drwIf33N2LuyneiAbKO+d8G2vwFvnj1AKyLZUoQb1Grpi4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450962; c=relaxed/simple;
	bh=QY0hmPn9RN5CM2a0OSQLy0r4m7HWo7N4xetfzEZX740=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7q/dZmSYp1YDPBuG8jMcCWGPryU3KTvpCgfnWCe6El5XP2Y2y+N5fZ0AvdTl1tE/Uoxqp6RKA04xXLVEC3jsQy2ih/+82UaeGE6KPG9oAbjWeERN788bE7Rb/Nw/6M6qLHJ+nCB3CtF63VqUvTYdFEixTnKegapgh4EfK8mYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=scHH2Txk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OODlqi0p; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="scHH2Txk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OODlqi0p"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gMNyf2rktz9v4v;
	Fri, 22 May 2026 13:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779450954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUzf7XgbkRXvKbudVZ6bTp4z/nadJHpwraFY5o4GfJE=;
	b=scHH2TxkjvNnPjez5n9EkEyOkM7WAJ1LWnUd+4xOA1Yze5nPyEMiysZgDrdxvgG2Li2xwO
	tMK8YZlUpuBAwkRrhDPtI6FqABjpitpYbTRVpQJneMfnsxNlzf2v2bDjsuOKTYEwwHqSJ4
	jtKS3xqJweaPLcbaa6NUVtOl3KvnhmzG4QnkhgfKMyDv7uwUPOzu95gnDhBu63fiotgLBw
	Lm8sGrVExMsWNdL4EgQ9sfiAh+SK2XyQ0fW7f+rQr7+R9oQpJEKQhLds3Ak4wyDyxT25yT
	QffCkJ6aEVOyox+SXOUUbGekegPZC2KHon23yrFABp8d1LnHgnYyT64j7LmOUQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779450953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUzf7XgbkRXvKbudVZ6bTp4z/nadJHpwraFY5o4GfJE=;
	b=OODlqi0pkEjHm/DHhDYsSnN0/E+nPSJbh6FKRmRJvAEr0m2DZvO+w+LEyUwVxv6VteIjHR
	jSH8naey7CG7hrgLP4jzUGsr3OVhRNtDh/QjLmzUuXKX/H+/laultJsyePiW/uYG7FK4JY
	AWGLrn5eixFtzI9zserE62ndDqjZKFek7lpOxMIyjV0D8QQKJ7Z54TLr9cYGASMoWHWu2d
	SQFwkq2xsII9moRN0K2P8gdVJmOaK6G7kOEvMhQ2zeDHSPtJNFm6g6bBJBhK0JAoc2X2ks
	rvATncpcN3Knm/KhzeB5RRVBy4qiRAbLNyfrKzMi4OY+5EHU/YqD/nbQU2Tl5A==
To: manuelebner@mailbox.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	omer.e.idrissi@gmail.com
Subject: [PATCH v2 1/3] staging: sdio_intf.c: refactor function
Date: Fri, 22 May 2026 13:55:15 +0200
Message-ID: <20260522115513.190308-3-manuelebner@mailbox.org>
In-Reply-To: <20260522114317.189368-4-manuelebner@mailbox.org>
References: <20260522114317.189368-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7j9zxxrzs1otgzfe157a7pj4a3peb1qx
X-MBO-RS-ID: e781e65fe52a453dde5

remove unused argument of rtw_sdio_if1_init()

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 1d0239eef114..4439ded602b6 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -237,7 +237,7 @@ static void sd_intf_stop(struct adapter *padapter)
 }
 
 
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -368,7 +368,7 @@ static int rtw_drv_init(
 	if (!dvobj)
 		goto exit;
 
-	if1 = rtw_sdio_if1_init(dvobj, id);
+	if1 = rtw_sdio_if1_init(dvobj);
 	if (!if1)
 		goto free_dvobj;
 
-- 
2.54.0

