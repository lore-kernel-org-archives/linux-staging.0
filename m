Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024CF155A5D
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420605; cv=none; b=ZMaIYjuyWrV1mAs7MZNXYv0x+dnzcR9F0KSPTN0+CfdT1vE/J6EujpR9uKO/PkREuox4+SAtqh67r2XZzplEGwFk9hfWZHo0gVGsRTckN7r89ah0XuyROvXNydwYLANhbqNlhJClkFCSvKjLUiu1Mocll68lNF/GiksnDRHPRsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420605; c=relaxed/simple;
	bh=9n9wo1WpripCxqxkOdmhaUBcEIzRFpkJlpVJs0D5A28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVtoEIBJRh0G5nd7PigjUQn5Eu9oXdCqms70lNR9UaDtViOSs0Q0rHwRhonRWWGp9wMzN/5/vADvTXGd/3pS4FvXvKvQVC2hHxGAbxKfvdAPjmFXq98h4Rqtlh2KdbGGnCy6Ys+OrF262VcKzPQ1+vF60rUwbOb8OjN8XKORkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L0WF/lKx; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L0WF/lKx"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gD3w83cj5z9tf8;
	Sun, 10 May 2026 15:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXSXlGj2ddhUCqYHwKpSh/B2IlTHdj6NdfPhwkRN91M=;
	b=L0WF/lKx8lvzQLOVZsm187nUqk2WqYQaOZIX9FaJC2EkWJeDRh+0MBTg/G1Y7ybpTVOy8y
	rCk4TR10fCntUSrcdzrQXUT11Lwa3sDVX7Dc2Wixdzy8KRkOgLWcP7fkqN4K17U+e0I0dX
	XP9vT9BydSOr9KwWSaVq15pH9IneDZcT/tjlhyXMmWZ9XexhWvhlBuDbkUiKxJHySwG0fZ
	XBr3f5LV/loKk28yjSNLof/jZwKdMOlrk3zkd8rW1CqjndGPUN9NF7ZQ7TCiybL6VoTbfY
	MVgoKVArZJpbTK00wWPuo1CpQThJl1/8LKznajFXLWXPI4oXKk1hNRPmU8/JhA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 2/9] staging: rtl8723bs: remove unused DBG_RX_DUMP_EAP code
Date: Sun, 10 May 2026 16:43:08 +0300
Message-ID: <20260510134315.64295-3-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s86akw3i5hnzckazbpn3yjk48oi68gn4
X-MBO-RS-ID: 90ff4c20ae1a5864225

Remove the DBG_RX_DUMP_EAP code since it is not used as the macro
is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index b3a38ffa6ef7..f6eeb134acdd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1515,17 +1515,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 			struct recv_priv *precvpriv = &adapter->recvpriv;
 
 			precvpriv->rx_drop++;
-		} else if (retval == _SUCCESS) {
-#ifdef DBG_RX_DUMP_EAP
-			u8 bDumpRxPkt;
-			u16 eth_type;
-
-			/*  dump eapol */
-			rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(bDumpRxPkt));
-			/*  get ether_type */
-			memcpy(&eth_type, ptr + pattrib->hdrlen + pattrib->iv_len + LLC_HEADER_LENGTH, 2);
-			eth_type = ntohs((unsigned short) eth_type);
-#endif
 		}
 		break;
 	default:
-- 
2.47.3

