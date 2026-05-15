Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AACA36C59A
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857988; cv=none; b=opeQzm1asPAv57/WmGF8eBBpyZrtGAQwxvXOz2+akdxdGr9YTi37U+FxTWvp/SQvyi4v9ytg2YrFJxqjClgz7OlNMChHxZgH1/vHkHjVKibfMSHateVqMl6IvwMHLwOcxJbYl7cSvIs4lndF/dSiOgUyKbZ0CcmrNygVkLRoT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857988; c=relaxed/simple;
	bh=SnT5C8Icr/IxNYUBrSq4neZoCDnRwJlw36g6pIan8Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDnvJA06s/uHP56R2JpAGZJjHYIEavQFb1+b8xiBR+I9t7p9YBKHq71hdDZKO/0voeSeWqMU62CXdMk+9/oUmvkNNGH1PpFx4mjQEzS4jJCAQzLOFXl7y9elkre5ItBMVyCFVtFK6zZdaWFx2vFmaOh8mIZjvEwlrQzW2M/XLNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g5KvJz87; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g5KvJz87"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gH9gF0HXjz9tN5;
	Fri, 15 May 2026 17:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778857977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsZe+FNkGU90+Bz3czf+lkj200iM23wxJABgSwwn478=;
	b=g5KvJz87X+dLznmVfuMvk3JYgF32ecQypRzaxpcBhAtjvLEtNJeBvGmOadF0mibXA6vE1j
	uQMqlCeFu1tzlXp84DE3nEW85lItRs8KlVklB6p/6De3IdoGXPZU2UlIN+89GpFI6Spysn
	8p1y8C8QyNqPgbrnSnogmP7envsL9QVLXXUU2AMo90+zpm/6ZNSGLM6z84IRhl/Os/QOyQ
	JjgJKUId41MKSaLzzYemLn7Uwxo5cN1sLyByNV1cl5DlFIe2iuLSv185GmwE5ACmO2FNAC
	Mq42A1xni5DddFaTqwrxXFjxi4UFOyIQAPbtPR9WIsfC3xGi2JkgJc2hlA2Naw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused DBG_XMIT_BUF and DBG_XMIT_BUF_EXT code
Date: Fri, 15 May 2026 18:12:52 +0300
Message-ID: <20260515151253.8106-2-khomenkov@mailbox.org>
In-Reply-To: <20260515151253.8106-1-khomenkov@mailbox.org>
References: <20260515151253.8106-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: h6zb3tzxir5fib56pmxikrm9io1rq38e
X-MBO-RS-ID: b763e99af555ec0fcd0

Remove the DBG_XMIT_BUF and DBG_XMIT_BUF_EXT code since it is
not used as the macros are not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c      | 7 -------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 5 -----
 drivers/staging/rtl8723bs/include/rtw_xmit.h   | 5 -----
 3 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 458e471535ad..ae74617ef08c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -191,10 +191,6 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		list_add_tail(&pxmitbuf->list,
 			      &pxmitpriv->free_xmitbuf_queue.queue);
-		#ifdef DBG_XMIT_BUF
-		pxmitbuf->no = i;
-		#endif
-
 		pxmitbuf++;
 	}
 
@@ -264,9 +260,6 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		list_add_tail(&pxmitbuf->list,
 			      &pxmitpriv->free_xmit_extbuf_queue.queue);
-		#ifdef DBG_XMIT_BUF_EXT
-		pxmitbuf->no = i;
-		#endif
 		pxmitbuf++;
 	}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a7f23335cdd9..49d556a72834 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -256,11 +256,6 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 					pxmitbuf = rtw_alloc_xmitbuf(pxmitpriv);
 					if (!pxmitbuf) {
-#ifdef DBG_XMIT_BUF
-						netdev_err(padapter->pnetdev,
-							   "%s: xmit_buf is not enough!\n",
-							   __func__);
-#endif
 						err = -2;
 						complete(&(pxmitpriv->xmit_comp));
 						break;
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index b0189a703d28..adce0d211494 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -254,11 +254,6 @@ struct xmit_buf {
 	u32 ff_hwaddr;
 	u8 pg_num;
 	u8 agg_num;
-
-#if defined(DBG_XMIT_BUF) || defined(DBG_XMIT_BUF_EXT)
-	u8 no;
-#endif
-
 };
 
 
-- 
2.47.3

