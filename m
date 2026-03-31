Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55107363C4E
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 04:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933083; cv=none; b=D6jtPNVJyoU61umImDEswWdwbiE8Hq4/g3mn/IJ6aTNOHFBXfTI/0GFqmwKscd49jBnvbO9cDTqQTwDywhCeQFSGLC1yWdTAdyfBcHqy8ZyVMEUsvgBOFMfqwh4Ef7GBRmBtBPlBw2t2UNJppElaY8G+rx6BvDKU2AAaMAUvC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933083; c=relaxed/simple;
	bh=cuqH3RJerQgEySwXYYdlrIEnErpAntpTOzGLbaIoXoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kK6GGAo22ICq/3dALMSc/aZiN7YNfooPOyibinjtyaiblwB4UPQHMNP5cJuep2eOEu/GelY1i6vdk1L87P+6I/XS5DtpgQ8U+Pk4VgmeGFfA0nZYm8E9W8O7i4GLC6hpHphCooGi/eoeRVwou/VnsWmJAiATp2jvrU1seqc7np4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DcvLCTDp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j98DcTMl; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DcvLCTDp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j98DcTMl"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4flG8K2Gk2zB0Bx;
	Tue, 31 Mar 2026 06:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774933073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O77vM3zNNEnWY+w55QI+4K7KoW1ZirRYg8i3f2saBuw=;
	b=DcvLCTDpbAoRttv4Z7Csw/9XS6MsgD66DIN4Lx5TyYwyqlMiPlUKhnNfe4rd9+6nZWx1tC
	EILCX86l5AH3JNRnt2eK+BxSiuUmQPlO1MCJjdXfon9dA4BxrHp/PqzDlpYgDjZP6opVVg
	M9nL2WErI+cIV9vonCwL1EC0IfJy5amGWkmZ68ykcf+P1Dp8oRCkKSd9PWcXBnG1JuqtLb
	kROhgOqI6y4vRp5pKvV8wcZ5onH/paiA91jBklt5lhTbGSNV+4OBhepdknSQ/R0wEAA7v9
	zeyGOJnGvIsePshmo2a+ZQSMKO4nWCOK1WCkjYdHBoUDNnzy8VM7hdRk9EMcpA==
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774933071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O77vM3zNNEnWY+w55QI+4K7KoW1ZirRYg8i3f2saBuw=;
	b=j98DcTMlbvYS8Brry6ueqJGZmlPm8rne+BTP8/FGtBvcRdvE9Ny50Y5qlGH0QvRyDcAYTv
	mAJI4QboMscx7DocpfM6VXLDMwreobzvG4iXixKTufI1CQuovuKMiH/QOAGsCyDqRtLO9i
	+4Ei2wj2Kumdtrao5FoObd68ZkJsfqQ7fD24lR5eqTo0Qf13qTzHf8iA16s34ybVqiOJYe
	FLyMyBeN0e2Sf2HezcN4s9CpWFZfvahZ/8VCgjPK3ZS2KFQJfzykmlpnazZJkL8DEsCgPL
	NmpjMu3SQ6Svl2jf686xpeTThig1O1hsxi2bZU88jOV57lPOeoUpZ/9D3YWqrg==
To: mashiro.chen@mailbox.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: remove unused RTL8188E antenna selection macros
Date: Tue, 31 Mar 2026 12:57:38 +0800
Message-ID: <20260331045738.84449-1-mashiro.chen@mailbox.org>
In-Reply-To: <20260331040023.45627-1-mashiro.chen@mailbox.org>
References: <20260331040023.45627-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8ff04ff3bd0fae1e2ee
X-MBO-RS-META: ack7fo5nduim1atqmz7rqxkk4tx6kjcd

Remove the SET_TX_DESC_ANTSEL_{A,B,C}_88E macros from odm_types.h.
These are leftover dead code for the RTL8188E chip and have no callers
in the rtl8723bs driver. The RTL8188E is a different chip family and
has its own driver at drivers/net/wireless/realtek/rtl8xxxu

This addresses the TODO item "find and remove any code for other chips
that is left over".

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/odm_types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index 8168dc14e8796..0da662e1493a6 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -36,10 +36,6 @@ enum hal_status {
 	#define	STA_INFO_T			struct sta_info
 	#define	PSTA_INFO_T		struct sta_info *
 
-	#define SET_TX_DESC_ANTSEL_A_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 24, 1, __Value)
-	#define SET_TX_DESC_ANTSEL_B_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 25, 1, __Value)
-	#define SET_TX_DESC_ANTSEL_C_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+28, 29, 1, __Value)
-
 	/* define useless flag to avoid compile warning */
 	#define	USE_WORKITEM 0
 	#define   FPGA_TWO_MAC_VERIFICATION	0
-- 
2.53.0

