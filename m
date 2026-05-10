Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE3388E71
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420612; cv=none; b=uy+PXd25KXvXInCjf9V5zOCqOXKRidGW4vSZ1km9SutWZBdsboXwX4RPB8hh2EVAYr1QlSwj6HZ1sCxG5+hA+mWt+tgJlJ6a53wUydEaNOsddPZe4Zq4ap2YOBA3/PAa/tcWxMPtrFLRzP1EO4rNdCf5ZlB3gfBAvMQO4ml7sgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420612; c=relaxed/simple;
	bh=xiV4Nx9Op/a1752t6tiYQdBgtEZ9qpVqX0SfZVYejj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYh0fDrCjurKajSJitObjcjMUrkmDAXWjOKP6aboU3En4xLoQR8TcdcbnrUAI9RpuFKyTKokbuFcHWyWzpLG0oTA2S+bwKQH0mJmxQWSdXyg7kiSdWGebQaUFe8I8hG4xgwsfjiQxrVy0pqsrL3tuQB8bN2hzejjaqxOYcCCtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m55xoohB; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m55xoohB"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gD3w91hrWz9tLw;
	Sun, 10 May 2026 15:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkLIScKNPH1uMNnzD9093QC3neEwOMQs8rFo/FFeQ80=;
	b=m55xoohB/DEE5rLJHBhRSA6K/3+Q19eLs8HNynXJNuRZ7vc8lAHNWpM1mA+tIDyFmE6sWS
	X6VBsQbwo1f0/bXhML1weJXvvOKLFIgcmMDLZDEHC43rFewU7c9RN7zsKrRPpZhhDSL4rl
	+nuaqpzo6HVR0hqgJvlUuxX4COQD9X2F79BxVF3xWpK+NeNyrEL4a7Tv+G5h7Iiv0ZeXUh
	ywY+W1i583mQQU79Hpm0O+5JFjmDmsnpVVgS3U2PUEwuHZhJVB8Z+5QYEziMTUbUspN/4r
	Ej2qOG7j0iL02SMHcCo7SSUJ6TU5PwgG/EHMrU2Cg4CvDYyUkFxX8xVCnF48lA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 3/9] staging: rtl8723bs: remove unused CONSISTENT_PN_ORDER code
Date: Sun, 10 May 2026 16:43:09 +0300
Message-ID: <20260510134315.64295-4-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: njrfsfqkmxzty7yifwuo3e5c4ejcjrhc
X-MBO-RS-ID: a9923a3e2e0066541da

Remove the CONSISTENT_PN_ORDER code since it is not used as the macro
is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2a5a4c0de9b1..50d8e30f7eda 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -649,13 +649,8 @@ static void construct_mic_iv(u8 *mic_iv,
 
 		for (i = 2; i < 8; i++)
 			mic_iv[i] = mpdu[i + 8];   /* mic_iv[2:7] = A2[0:5] = mpdu[10:15] */
-		#ifdef CONSISTENT_PN_ORDER
-		for (i = 8; i < 14; i++)
-			mic_iv[i] = pn_vector[i - 8];           /* mic_iv[8:13] = PN[0:5] */
-		#else
 		for (i = 8; i < 14; i++)
 			mic_iv[i] = pn_vector[13 - i];          /* mic_iv[8:13] = PN[5:0] */
-		#endif
 		mic_iv[14] = (unsigned char)(payload_length / 256);
 		mic_iv[15] = (unsigned char)(payload_length % 256);
 }
@@ -772,13 +767,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 
 	for (i = 2; i < 8; i++)
 		ctr_preload[i] = mpdu[i + 8];                       /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
-#ifdef CONSISTENT_PN_ORDER
-	for (i = 8; i < 14; i++)
-		ctr_preload[i] =    pn_vector[i - 8];           /* ctr_preload[8:13] = PN[0:5] */
-#else
 	for (i = 8; i < 14; i++)
 		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
-#endif
 	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
-- 
2.47.3

