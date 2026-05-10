Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8515021ABC9
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420613; cv=none; b=tT/w/Qb3ID6SeAb4mp0ZvEBS8eMdWvpt7GPNORQaiZxjLjUOS8r+BOGw9My2szzTxgFy4B4glB+me7wBn2PADgh0ig+WPNzI2O5HqlQAXelFlACYJI/e+HlYYU2MHxkl6iJ4IwCcfkIwJT7ozBW/OiJwPOq6lZht75dPvO79fyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420613; c=relaxed/simple;
	bh=HE046furi1YYumdguucioCsRSwJUdoYQR6eRmW8Etps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGBr8V1v7poaMpCEq1Azz4CzM7q3W6g4L5SqUItlmBb8SMtLIAfMtvg72Dcl4P3icZYmnsE8qOIc2wfxhwQV8E+R6eyp3V4iwGZcf2Z/7PDmNxpOR6f6LGf2LV+LIk+O23YTyOzDfz1KY7wfN+xHq8M/Oo+ZXWJEkjpCe8xwP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iL6N25cT; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iL6N25cT"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gD3wC0mJMz9tjH;
	Sun, 10 May 2026 15:43:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mf85LnNL57c4/H5XniVPRAKvkps9uvGAWirBo7OLwV4=;
	b=iL6N25cTN5cOAWWT7sVHvlLFMVQAQMt5tGBpSEPL0aG9HKjmhIPLPi4KWp6IelDTeyvPXf
	Qp2UUUljfPryexCFoRXWizfhB6Sntu9kuwgf4hG/TriH4DNmT/sU1bYhqUlLf3tVdB2plE
	kDVtmezsvoPRxnRax45DRh8adRbaaW4gVZIKJ58taopFNN1p82RVCm8n4vuTofKj6cZ6gG
	1+SUR9vQK32vj+HgZwHdN7i+cYUNl0Lx7gALTB1WfJ1RGbN3uYY4nNxuqr3gFVtxWyDx3d
	gqGBZc9ptFwyWk8a9gox4zv//H7+TNWsp29B7oC9CtFuPYEiT5sm9bmIHrvVUA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 5/9] staging: rtl8723bs: remove unused REMOVE_PACK code
Date: Sun, 10 May 2026 16:43:11 +0300
Message-ID: <20260510134315.64295-6-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7szgmctbea9mhty56s19d5thikeuwbzt
X-MBO-RS-ID: c8baa21bda761c6fac0

Remove the REMOVE_PACK code since it is not used as the macro
is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/odm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index aa4e36b6f2b4..3479eadde61f 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -975,10 +975,6 @@ enum ODM_FW_Config_Type {
 	CONFIG_FW_BT,
 };
 
-#ifdef REMOVE_PACK
-#pragma pack()
-#endif
-
 /* include "odm_function.h" */
 
 /* 3 =========================================================== */
-- 
2.47.3

