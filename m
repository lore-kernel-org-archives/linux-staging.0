Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F13A1E8C
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501214; cv=none; b=u7B+67M86Bdb+phZD9U0IPfkcGsj/m93XXbuRTTh3Sf+ggRbRK8oKUOjjrrmAWcyWG6GMh/dvoQ+9nFsFO8Whb5CzccRRXIN2e3RUDjgUQ8x5EVknCbWxU045w+8dng3Ulv7krMB/A5ucFR6SA1kPqiiYNBH8kZO04zFWgQMOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501214; c=relaxed/simple;
	bh=3+VU+VjNSB8Y44kSX1OaXg2akGt37AEWgiP/oOUUPgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ae1rDeyB1+BJJqUfQzoxLaVO0Mg+PoY20qalezbXe/8W413n46C6pqMNaNfWo1x4HkYRuFSLE61Mgm9ugdMjFYVLDt5+XXERkoojgZYBCv7nVrqX41El8AkDp9pS1zdeg+fNUlsYmNjbGFIA/tzjxru4GnsK2j4flHS6xu+7nzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FZnBC2qJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xAvMTO+o; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FZnBC2qJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xAvMTO+o"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwBrB0dgVzKw4J;
	Wed, 08 Jul 2026 11:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783501210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+9x+oOfR2jnEMZIBWY25frnb/ozGM63R9lpG82/XBY=;
	b=FZnBC2qJTP0aMYy9FilT35Y5Lyd7dIXSroORJgUTQrN2grUv34OOxQEcgrxad5NBCPauoG
	D2N5/sPbREfpuVKTWtX7or/8yYEcQXPiR2lXWbuFJVlMSD0KDbXgcmf2eQLh9efHC3Godm
	CQl0XQupTnulzCf9PeT5T5e0028T+RuCJvQzYU8C2EAyCPHAdFmYCQXgY3W5kKUsbOZJfH
	77qtqQl65aw3KAIGvskWyG2sxfvu3bzKtXTMm4u1l2D8Hc/+gvnqsUpGZaSN3EiXzyYpGX
	Ceg2NKekrhAFjDSf3ao3icXnQNaLz7J4k5RhGIdt+InxjDgga7aF8DaYcXOB7g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xAvMTO+o;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783501206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+9x+oOfR2jnEMZIBWY25frnb/ozGM63R9lpG82/XBY=;
	b=xAvMTO+od8Axil+4EndIu/Xz15g751ZMaIau2/njYdXUWQhZYVv3vu1dYg7GMvaF8syba/
	fpwcYcyT66ZNHFmfWrWrEQ4pOx7M6PiRQlGjCMSliCxqZiHSQp+CfstCL+OsqOI6/Jbo9A
	kwlz8S1W/3b8tEb1WCQzIYJTquctjhxYq5vRNUSA4My4FY+hAe0V3NKt9Z8rtl/RYTBqD1
	GSeVRi2CGqiRIOmF4bKMHh5vVuHaBQdQMLeZNYKIVXDPxQvk3HSCUAArXtVMOWZHlFAs7a
	gXD3WGYSN6+tOcDuEyNXdb05QdXjqztPWqlf394CnqIxB+AvKi4p9wQNr4xc6w==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: manuelebner@mailbox.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 2/3] staging: rtl8723bs: sdio_intf.c: cleanup whitespace
Date: Wed,  8 Jul 2026 10:56:29 +0200
Message-ID: <20260708085629.307080-2-manuelebner@mailbox.org>
In-Reply-To: <20260708084808.305951-4-manuelebner@mailbox.org>
References: <20260708084808.305951-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: e8j5scwwedy93gxbgim6kuzf8mw6k1m3
X-MBO-RS-ID: 973427da3b835fd4056
X-Rspamd-Queue-Id: 4gwBrB0dgVzKw4J

Remove empty lines and add a line where appropriate.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index ff58923e43f1..63ec486f9a34 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -47,7 +47,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -151,6 +150,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
@@ -216,7 +216,6 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_hal_disable_interrupt(padapter);
 }
 
-
 static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
@@ -250,7 +249,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
-- 
2.54.0

