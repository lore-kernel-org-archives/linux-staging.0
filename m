Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64AC388E63
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420614; cv=none; b=E96bND7eqlSgdURgqKQsMN2mPxlzPlem5XV9ogvaTeQAdiqsY5zbyVbQSOC88NFFx4Hwk84B31tSX7ABf6k1uXsq2gS08K+rTdoycLDpM+B5eyZ8av2UgW+TwdYlfNFT9CnFVwMTd43MpC2TeIKi/INQqdOW1dJQZfzE4OpmI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420614; c=relaxed/simple;
	bh=/hI/MzCQVOPijZeTn4DAMNEJRgugDNjnM9TsDOYC6C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnu5wYjUupbwHi/dN+/1nHKmm23R7YMIzF4WyFJf1xLO8+1RAGdJxPbP95MlTb1j76oLyNoYa+2wEt5lubpde7pD9lXyNeZHaKCiFRZii6fEx/UKaDKhNCc9f0+0asO6EWHbEqsgwwi3hg6jGawwmK1aAlExtigYtLYf0CG/6F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DxqS9Z3C; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DxqS9Z3C"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gD3wC6TNRz9tR2;
	Sun, 10 May 2026 15:43:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lz/jSwjQ/8yJ1zy5n2O8qhdASuxGzEavQr68uyGmHvI=;
	b=DxqS9Z3CMtbq/kWUS7DsT1PsdfPeO4ZfGv43jkAVUSB1VJzEfrjVF6jsJIl9VH4CxPy1BC
	FZH7EdZyNjYM5ed3IbsLLc7h+HKedmMi25hocnaO+LGW8hEMH6sCp7mFmRFILP1W/AHVLb
	UPLGAZ94frKdMRaApRL7BkoT/kA+ZNWY3HAikOu0LDlHcJUZjWNhRMdyMqKld9pDxMss1/
	X2Aq52ywDtsPKbnQ7Vd+pmZZIAOtdgH9CSSBvJk1gPo64wZ1m9ZwFzwfsJ8S1BgxHA5cbW
	JIMnJUTXd2N9GvVOifQ36QWMbagNArk9RA2rnyymAJY56TtF2J3mFq6915dOsA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 6/9] staging: rtl8723bs: remove unused RTW_DVOBJ_CHIP_HW_TYPE code
Date: Sun, 10 May 2026 16:43:12 +0300
Message-ID: <20260510134315.64295-7-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c146d7ab5dfb19ac972
X-MBO-RS-META: msstwb4qtbwomf5auwt8maxsik6bysgh

Remove the RTW_DVOBJ_CHIP_HW_TYPE code since it is not used as the
macro is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 7ed375ba18d8..30183d502b69 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -258,9 +258,6 @@ static inline struct dvobj_priv *pwrctl_to_dvobj(struct pwrctrl_priv *pwrctl_pri
 static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
 {
 	/* todo: get interface type from dvobj and the return the dev accordingly */
-#ifdef RTW_DVOBJ_CHIP_HW_TYPE
-#endif
-
 	return &dvobj->intf_data.func->dev;
 }
 
-- 
2.47.3

