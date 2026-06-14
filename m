Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCBE30E859
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781439759; cv=none; b=D/nwvXZaIKppp/dXOdtrGsuJqm01GrYig5F2+FAN1Js5s3UJS3fSCFE0DN0C9rm8W2SIVZkrabN5u1rbgNPuYcP/UDnGMLP/4SUB4H0jP9m0sda/IsIPJH5JMQwAJ5zWV65aAJ7hYzyuVJV+N+jXO/ML9b30EGQdlTrAjif7fjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781439759; c=relaxed/simple;
	bh=cXRY7/RWKXbQcEGfLG7Hs3wRRDPw7xOzfqxkTl1A5jo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PxR7aZ4XSpCzoqg16VksDcgYmGFDHJfkgaOwCkmaLETMcb/deFjVwqdpE3/YbYskkehfsJbnA7nRUpwxNDNpVyK3BODK+VUdfMcZJgM4SlJwTVJwHxS4hW/BY5hELxJPOCkf4AQn3qnZt9yj+kNd06z/esXcp6HDgPbt8OAwpsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I49lPcfz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I49lPcfz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso22113955ad.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781439758; x=1782044558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dXmITzDKlPj5CAJiELCwoKY0GFc0LF7VxcnDR8sG0M=;
        b=I49lPcfzyGzs7o67DhcvAdZLxzNq3ikBYZbTy33KgOstgx0joimsooUt39VAgnLYpe
         JPG2NBEL2qgA8owIhTHDvk7VACafAdooR705nzefMZ+xEOC5iku7tEpBrp8sIdEsNjso
         zxvgeNGU9CVLHoFNMdDxy0xEg/HONE9GQ2IyN/RDr/z4uJ82eKr03+lVDlK/PT19dBH8
         0fMTA6f749HB8hYD4cDPPvaWgIXoW3McGPbSh/DZkBSwSAJThea6S6jyQ6ico5CfoWsC
         B2CDi79b7BUB0n5cjFVGIp5RfHSAz3UqtWkb4/8S7qlhKrastn6Ysvqe0L2oCvYoG1ex
         0QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781439758; x=1782044558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dXmITzDKlPj5CAJiELCwoKY0GFc0LF7VxcnDR8sG0M=;
        b=VhBH8MTMPLSp6Og5RkLL3mDajTLwn4GJzZGpriwZZ7pRKYFHPgWyYbMcvamTt/MD6m
         u19H10dKXdUBVTtuTlqIYTqmYXsUE3+TXkmwT8V+wkKrRXtIgI7WvrEKeM21gQoE4fa4
         Pahx4mFpIIq2h2QZf/zAmAYRVzrspcAT8jeu5f6D00aJj3H4WSDyzDdA0qGU0v6XY4Xj
         In6tQM5CzfH2EMfw/4IyZhJ0qdY3MMBooog0RrDB1b8pGGD7/L5rW82NAbdNxQtFCRCm
         siUdzoPYjaOvu+cUTapm7K5+0+2DlJ0x9GBKrU666gil/Ow+q8CQapXAGwSfLfoA5Ufp
         WYFQ==
X-Gm-Message-State: AOJu0Yy+5LGqEYp5u4LOxyXxg5IxW6bE7oC6mXm5p6mI6Uoe0/+2tr49
	k6ILahSmDA6SpOoLaz0IPM3mYstj2l3UXCWQNlG9/+0YAKUsgCnqXgEGw0PTwg==
X-Gm-Gg: Acq92OE4ONo4rwBlDtT4PTfnnfWGMmFqCf/oRDa22dWWi6Ji/usx0AWu21uiojrgSx/
	CZWAAmHjtmf3MYw/nkl63yXqTGnAaZHz+ps6m9S/iWdPCCdh26na2RbLH54CmDeJhiN8p8YlnmV
	45pzBUAA9NnhrHT6iBXDSZuWxtdswY7pPtQlrYDgxna69cqA/Wcnaf5t6h0/CdUNLF3d5wiURrE
	Cryw6Ezfzsh7p6TwevBtj6MP6B3JNMaeJdwsh/NqZs9CTHW0b0vudpk6nRU0iYIs/OSiq8FzUA1
	rDmnss1NVYdRTU99h13AApYxXsLi43/CRiRMrdYd7RJPOP1hv9lNdw7mVXx2WYMc77RZBULw3ju
	c9taDrZUfFqMS6DEWDtOevYwgChXTx2gcLGl8whue1phK7zyZNQrIoohAXnhS9MYs4J8s8Plter
	o/sfTGerlADPyaIOUXX9sl1GlTINwg3KumWBgyOKOmtMh4NBmBiD8Nm4cnVor4onxwb1yyEInvq
	Y9/
X-Received: by 2002:a17:902:e811:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c412c2e277mr118998535ad.35.1781439758304;
        Sun, 14 Jun 2026 05:22:38 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([103.58.154.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43326b085sm69157995ad.70.2026.06.14.05.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:22:37 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 2/4] staging: rtl8723bs: Fix missing space around '-' operator in hal_com_phycfg.c
Date: Sun, 14 Jun 2026 12:21:53 +0000
Message-Id: <20260614122155.20034-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
References: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing space around the '-' operator in channel index calculation.
This fixes the following checkpatch.pl warning:

CHECK: spaces preferred around that '-' (ctx:VxV)
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index bdd595a99..5e2f4131c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -459,7 +459,7 @@ u8 PHY_GetTxPowerIndexBase(
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 txPower = 0;
-	u8 chnlIdx = (Channel-1);
+	u8 chnlIdx = (Channel - 1);
 
 	if (HAL_IsLegalChannel(padapter, Channel) == false)
 		chnlIdx = 0;
-- 
2.34.1

