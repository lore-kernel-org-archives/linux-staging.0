Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7DD209F22
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918043; cv=none; b=WzYisDyTR1rGj/kmX5oFRuPqm1s/kBcbf0N4Tf/FSxHpEyZgi63BynsxjBodGIKgDXQzSaubCLe7qerd+zGjMQ2AZCPmPq2FSNI942nrGX4ZfvEGNVlR6ct7zp682rVHC4kjxKXmrCHCbLsAAH27Yfu1QtyH6t9418Gwcb0VOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918043; c=relaxed/simple;
	bh=OhYFXdOAT77f7RxU/LJANnpWsMNqUOrjLI6muVHXKQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmK2HvwLOyre8StX7h9K7tXgfLTUwf4E9LyG+x8FzWrh9rSg01sY0DdGCZnKTPt1owU7hISCtfFOxS4xWH7T0KFED8nt1XhGwFAxLDtb4MDE3tW30Tr8Arysymmd44NXTOEuteDqS9K6E1t5ijSZ5V/b8BjnFH3kcSds9IYnHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3+RgblX; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3+RgblX"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a4031f69fso10846866b.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918039; x=1731522839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crh/rfogPGMRViil37oWiT/zXqQHb+k4d9JTWemUdnk=;
        b=b3+RgblXwTKLMl6PeksS9AediN95V/A8qzz73KAr1vxWaVdFKcga8NcV42PB9Lcw1y
         7/An3FdFkeVSki/3/YuterIAV6quS1LL2PwdprydpCz9Z3uvEP+ud0B6XX8bSFVXr4NQ
         caLnUjc1DXXcb1dixWyTDkZBHLQFI1pVxTUgmDA/cGh0w8OBO8aZI2PEEp4wkDm2iYrn
         vdF0/tJVeq5dic1sKaZhRqYPe7tiLPo32nSQTASKxYZHuepWRYTtMia9os5N8dtG9g7Z
         i8i+BMxGdUvS0D78ybl4um2xM0AOV409Byi6iXJPti5T6hupLzFuh6hcvZctU4JvshPY
         wCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918039; x=1731522839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crh/rfogPGMRViil37oWiT/zXqQHb+k4d9JTWemUdnk=;
        b=NuNZBu6SLYQpDQcSM3hTi1v0pLe+Mc0WEKB2WhkHAUmZiYcoX69R4CGbhqkFtCGiSH
         Ea6/m1RvOmKBEU0fWbn3FszWKZCpXjcYzvr4saWwBIPdRBF2Mdl2IGuh6gZZTmenme32
         RrZe81l+Q/DreodmLsZqg39MNYOFjqycIm4m+WDqWdb9H5SUYZYNikR5Dhe/xdMwMh0m
         HVvtGhtzRlxMIbk52Z91OAqfWReao5XXkmX7so9YEb0p7ufULcycNQPqveC+h/VMAoKJ
         9cIuFf49l9qWcbbTR4oEAVVpxzMo7lS/r5bWCp67rB7JBQTN2QP7Q+2kS0jv+5Y7cjo3
         9HXA==
X-Forwarded-Encrypted: i=1; AJvYcCWRBnA+LtLFfgQIIyRq3a69L6/DyhZ5tV2oDGycsomtrhnNJGl8WjpLVFKzuItPdiKlvn/sb9A1wAEhT77N@lists.linux.dev
X-Gm-Message-State: AOJu0YwyvChuCXwprqlug/UBRN4CMvX2gsKEOnMLM/ZzGrR6R0V+kxNr
	C0DKXF7bVyP3lDOYyWKq22BEgZfpvpr738hHeDLcB6jAlxvzoPL5
X-Google-Smtp-Source: AGHT+IEPXokTSPgcqGa7xl1tJ2Tp4hbyjMYSJoP2uyWX7NBDQbYUJ/iwOyyfZhKjlFg1LOysnIohhQ==
X-Received: by 2002:a17:906:c152:b0:a9a:154e:dd86 with SMTP id a640c23a62f3a-a9de5dc1890mr3774050766b.28.1730918039023;
        Wed, 06 Nov 2024 10:33:59 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:58 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 08/16] staging: rtl8723bs: Remove unused function hal_EfusePgPacketWriteData
Date: Wed,  6 Nov 2024 19:33:37 +0100
Message-ID: <ec6f2c62ce7a4a742360b81495afbc0755a5a703.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function hal_EfusePgPacketWriteData to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index fa6fbf0ddc23..ae909bd1366a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1345,26 +1345,6 @@ static u8 hal_EfusePgPacketWriteHeader(
 	return bRet;
 }
 
-static u8 hal_EfusePgPacketWriteData(
-	struct adapter *padapter,
-	u8 efuseType,
-	u16 *pAddr,
-	struct pgpkt_struct *pTargetPkt,
-	u8 bPseudoTest
-)
-{
-	u16 efuse_addr;
-	u8 badworden;
-
-
-	efuse_addr = *pAddr;
-	badworden = Efuse_WordEnableDataWrite(padapter, efuse_addr+1, pTargetPkt->word_en, pTargetPkt->data, bPseudoTest);
-	if (badworden != 0x0F)
-		return false;
-
-	return true;
-}
-
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
-- 
2.43.0

