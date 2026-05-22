Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F793A7F52
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451089; cv=none; b=V81gd5yG6EaACbPIVvZxeMDGRDtrHoCXJc7XqZSgMu3A33Nc12J/jiaW53XEW5hFbiFDWQJ1hWjZFZmx7JdqiGFjX/FEb1ZyG7LU5EttGzZI2Z3xfXpvyzJoa7FMkxMgxk63fOShpJv9MllrXkyIh/3v3Pkf+pwd/NphGovPFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451089; c=relaxed/simple;
	bh=ZL1B2Wl8NpzpSm5FnBsLNAwkWnPTlE5ctBIb84Rv8QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7whTNDABRINt3mMfhgs/0toOujQWaGYRdOo/Mr9O32wGxHlJmQMRfGgRPyDbSf6I+ebFnQxc0oOMmZscz+oAh9P2pysR5dVvsrWiEMrwrcUx79hDqfOQaxcg/BdHj4NNqkIjMDWjv1CYZddjUIQqPIQ6AwoRKfJiv2M4Zdj3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AKqkQoBv; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gyJsU158; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AKqkQoBv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gyJsU158"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gMP1B30z7z9v8d;
	Fri, 22 May 2026 13:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779451086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFDkP22t7bzqO55GREUH7/szST8FAcMsLwlmtb4p4mU=;
	b=AKqkQoBvrk14ho7xOopW2kdoKyaTgynFpYtVs+v2UnRE/NaTnJtTfkMwJ6Gax9H5vjMJxw
	oWTpzvJiEKbdXr/U8o/ibpa5mEGeXGne0oec+XjZuQxIQupOG8tYtaDmGJwJNKOmXN260R
	MUr+QgIb+zmftOwSz9RDxMJRe8878ldpYXEgLwBCW2KqhAu2vw9SoR508aVfiUzi7b5X+n
	cbU/m3chdTbRKKWSwG1haUAVxyaTQbgQd1Z/UKSIbm7bwHTyUbHYsctFHOul6bkyawXV2g
	YVx/rS2aM8VcQe1m7Dut8JU0ZXR7hTfGH9wtfu7GaDsSqWjdqL2kOqgVvoFy4Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gyJsU158;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779451085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFDkP22t7bzqO55GREUH7/szST8FAcMsLwlmtb4p4mU=;
	b=gyJsU158YZFAEnYmP1hOjA+tMc+JGSr5d9s5NbiCTrqYfNZ86Wcxfp4liZJZjRfEIGiHWH
	ORi2LUTII54BCWOwkGp2qW9H0AdIEAL+I5FZSOMikgoB+w45TUYRjwmsR1QgJgBMJ04Avw
	LxtaH7htYxDD9CbPqihB6N52YxLKGIg7LBtVrhBZfrZgmy60A/r6Xf9gycqEPjfICpJedr
	BX63TsxtV2wM/1modcreUrch5RORrPemClVuPLNO6zSXn4xf/893iNHFhaHIcigJ/FBw6B
	D/2FQE0kZSMfFaXXXJKNMr/oz6nbsIpQKToF7Jeg0JKnLenqU21d/uLXg9xs7w==
To: manuelebner@mailbox.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	omer.e.idrissi@gmail.com
Subject: [PATCH v2 2/3] staging: cleanup whitespace of sdio_intf.c
Date: Fri, 22 May 2026 13:57:02 +0200
Message-ID: <20260522115701.190482-2-manuelebner@mailbox.org>
In-Reply-To: <20260522114317.189368-4-manuelebner@mailbox.org>
References: <20260522114317.189368-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 08d8de063519b732b53
X-MBO-RS-META: d9agw3mu8ad1jrcnafec3ooqqk3puziu
X-Rspamd-Queue-Id: 4gMP1B30z7z9v8d

remove empty lines, add lines where appropriate
reformat function declaration

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 4439ded602b6..a78fb4bc7155 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -47,7 +47,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -168,6 +167,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	int status = _FAIL;
@@ -236,7 +236,6 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_hal_disable_interrupt(padapter);
 }
 
-
 static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
@@ -270,7 +269,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
@@ -356,9 +354,8 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
  * notes: drv_init() is called when the bus driver has located a card for us to support.
  *        We accept the new device by returning 0.
  */
-static int rtw_drv_init(
-	struct sdio_func *func,
-	const struct sdio_device_id *id)
+static int rtw_drv_init(struct sdio_func *func,
+			const struct sdio_device_id *id)
 {
 	int status = _FAIL;
 	struct adapter *if1 = NULL;
-- 
2.54.0

