Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6C40629F
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857988; cv=none; b=ePm4yHa6ijRw2sDd6+qARVVjXnH0d27EpTXQIfWHhCXdoK1n3QCq6fVtrG2tqsB0+w4yK3qfjNpoEtqv3xDnC92wXbGWJRbob7ZOaKQ4HMOEz/H0tICiYgfR8+1RIwnrRtL431epuCuyV9MYjRbmKptJDIH+1yEIUfvWk4QLilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857988; c=relaxed/simple;
	bh=T2+SfK/qUDRTyFnWu5shqa7CnbmR8gEavBjJviY9x9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kpS4xsgRqngSpWxipSeB/XMd7HhLbUnM+TWgizYTJYDV/uF36w+SMUrWR/iHHZmc9/mOE9XU+tu2Ry7ERkjVmPlueEzFrqOSD2tyNDOXLFEt0qUr/CzHZ0UUw3YNf4WKc8DTIDv2nXTdscOz25nvIvPlN1PM29Kg0oCsIuIideA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TgXj/aZJ; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TgXj/aZJ"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gH9gF6LYlz9vFS;
	Fri, 15 May 2026 17:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778857977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMZGY7vWWPkDjVgi+v2AydkgwliZ9h1Oho5xwJ/MJ2Q=;
	b=TgXj/aZJI8no1jFKH+9CW6t4KFkb0zlJ3l18vGzFLr6Kf1v4wwuD34zs/0Af3D5/MvUSgz
	VHauMIehbsLv2Uj2JZfF6+UOSQOhRcAGVM6x0MXn06l/CXaGlvT0voJGVU85J+oYGnkw7p
	Thg2CPBnXMJQshj1pBCtyBmKfBucx2+mxJTVrP2ArGSb6evGInx2BXzPRD3nYXO6ocwMBc
	glGUZsuFQrRbWRdIlkuqODBvXAaAH/laYeSIdzrc6gYNRgSxcopXCSeDakgls0M/+zoPFf
	y34PZeEIUFFZfKQ2A0SylEcO08UYqb8W6AsQzXgMc2n6tRfFCw9BSWQTiZY31A==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused TXDESC_64_BYTES code
Date: Fri, 15 May 2026 18:12:53 +0300
Message-ID: <20260515151253.8106-3-khomenkov@mailbox.org>
In-Reply-To: <20260515151253.8106-1-khomenkov@mailbox.org>
References: <20260515151253.8106-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1hhb6646pjksouzkyosm8xtt7pibhre6
X-MBO-RS-ID: b22d1a17ccf4bc2c4f6

Remove the TXDESC_64_BYTES code since it is not used as the macro
is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index adce0d211494..056c2ae990f2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -94,23 +94,9 @@ struct tx_desc {
 	__le32 txdw6;
 	__le32 txdw7;
 
-#if defined(TXDESC_40_BYTES) || defined(TXDESC_64_BYTES)
+#ifdef TXDESC_40_BYTES
 	__le32 txdw8;
 	__le32 txdw9;
-#endif /*  TXDESC_40_BYTES */
-
-#ifdef TXDESC_64_BYTES
-	__le32 txdw10;
-	__le32 txdw11;
-
-	/*  2008/05/15 MH Because PCIE HW memory R/W 4K limit. And now,  our descriptor */
-	/*  size is 40 bytes. If you use more than 102 descriptor(103*40>4096), HW will execute */
-	/*  memoryR/W CRC error. And then all DMA fetch will fail. We must decrease descriptor */
-	/*  number or enlarge descriptor size as 64 bytes. */
-	__le32 txdw12;
-	__le32 txdw13;
-	__le32 txdw14;
-	__le32 txdw15;
 #endif
 };
 
-- 
2.47.3

