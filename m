Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C73C253B42
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 05:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933494; cv=none; b=uXj8yuQ1DK+ZprJ1x+BpZlv9zsjkZGVj7SzOWT79wZd0diOlYr7Mm1y50eUrldL547c0+LS0oY25NpqCW943KDpIq4OQkOD5hbsmPRNX4ByR/8nZqSP9E0u3jz4K3Jgtcm1tRiv7oTgbtujhBQ22ZSCHiz+U4ML6gby4w7nHk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933494; c=relaxed/simple;
	bh=kIYOTwOdZv0qhAv/0JZ7dC94hPCSy0+tj5L+nN5TY6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzIOfECXnZSL0v+zzzfHMaJ5IRH3eI118dTY9UOrcGq0IPbv1QSEM9Re/EjJxkmXvqJTYLex7QWdxAyISjMNkucG4IVJFaU1DJqnP29N2FpvimAodsNuK73I7pKAQExNBjBylUs2t8k/bGWdeARlKsS88QmNYk/fIadhkI9dg2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rUP595O+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NbibUXTX; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rUP595O+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NbibUXTX"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4flGJJ1w08zB192;
	Tue, 31 Mar 2026 07:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774933488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfTcUto9qQpHcjG2HrcAGKCXsVFhcG2P1UdgyhyGcEI=;
	b=rUP595O+yeIrcGZvcRIqPYvaIr+WM20F+/atKw/ct7nNwr6bLJvIhIRT6AtSGbLGgC7TgK
	iXpcCFpdZfwSFQ+X9oTirUOZLXLTvvKV7DxRNBItMmaTpxXoR7VVMMUpfawfFDWiwn9yAP
	qdqcSooFE9kKyz0HdaRqvNtATcdg4X1K2fN2DRUVzhtb4gPt3HaPSQUsJpVldZr/E95HfL
	hhsgQpKvf/fBtv7MKMRA9vx8ETl/zlggL9frjWOS41FmuCABc5ZylOhxPLKrkZ6ei3Kz9N
	jO9Z4+01SlYBmfncCg53BQhCKNAd5kxozDbOOiMHtdxgpu1FWa4bgK4IYXO8jQ==
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774933486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfTcUto9qQpHcjG2HrcAGKCXsVFhcG2P1UdgyhyGcEI=;
	b=NbibUXTXJQfQAF6eBPku3rD6nYJQtf14IpjVR50POdGrMUWfPeX0Wfi+4bQcLETVhis6lU
	KzolybmmboSW7VGiLsSAsin6dliVzy37gNcj5Vb+RBebwIPSUGHYb7tOu+gtKk5dxEJSnX
	guKJMHCYC1WDxV3jQBUSAJV5pEnxkwJWl0zbtuLlMJwbqixsJTwpY0wnRX+y8JQV+8L/C2
	qbBrzGx/fdiR9tWqOHtI03Sp2hZIo/0rEm7d6KN+mOM2jLth5sp1S14nPeBzCHYvCFl7OF
	UAW5uHvy3u9czo7ZMWHPWI973BGHC3PgSp6EdLZTomY6LDQInUgWlpAhQRf2mA==
To: mashiro.chen@mailbox.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3] staging: rtl8723bs: remove unused RTL8188E antenna selection macros
Date: Tue, 31 Mar 2026 13:04:34 +0800
Message-ID: <20260331050434.102744-1-mashiro.chen@mailbox.org>
In-Reply-To: <20260331040023.45627-1-mashiro.chen@mailbox.org>
References: <20260331040023.45627-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3e96zpsco1t311ce9aa9sjbd7xqmtn7g
X-MBO-RS-ID: fc990c45c4b93b6f317

Remove the SET_TX_DESC_ANTSEL_{A,B,C}_88E macros from odm_types.h.
These are leftover dead code for the RTL8188E chip and have no callers
in the rtl8723bs driver. The RTL8188E is a different chip family and
has its own driver at drivers/net/wireless/realtek/rtl8xxxu

This addresses the TODO item "find and remove any code for other chips
that is left over".

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
Changes in v2: Removed incorrect reference to rtl8188eu driver path,
the RTL8188E support is in rtl8xxxu/8188e.c

Changes in v3: Fix incorrect To: Field in v2 (accidentally sent to
mailing list)

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

