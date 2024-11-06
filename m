Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4C20B1F4
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918046; cv=none; b=Mxva9sVLCm3brxJvFvME7F7U51rSkAJ73RcpWgxVqGBpHTfZlTpfNRETJoH022kiS8iWh5uWCCj0xVjdWtioc3eqxtjwDqdwelBmmiunUNfphU76A4wJLG1AEf5zzDyZzRpnoVSigMHgu0ZCNnE7livtMwsLJIa+0E1ZEbX68Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918046; c=relaxed/simple;
	bh=HdJm1Pu/7PlxrS/55iKeWlrx7bsSZesm+0zy53fLThk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iomzU9Kh4jl5TEgIxptPcpqCad8tky55LAyS5FDGeReWD6cmwohogAaj1xJ4VvJ6YIWh1V0NQREExlVruQ07AAh5hePxsPIAO16E2cg3Vq/Gc6dWgHxFftUxVBvJv7KZE7VxoQ5QGYlEK2c88X26tf8MrIz/5etuUmVV0JPXSbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i87Rk4V4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i87Rk4V4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a16b310f5so12373366b.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918043; x=1731522843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhgbEz6h9Yba6sgpMI3GJizlUji0eMJyuR9wkNgDATk=;
        b=i87Rk4V4VUJ+4if2X5P6XK709TJvxbqtdrZFQbVquuPEy2cezPgcLDGKBjNN6IbhrT
         Ii6gzRevdOsv51KWr+UUXjehyLgs/XPmDCJl7TqwvVRsZr0e3qxK6re8dEPE825ZeE1n
         lVFDNEryCv3buNpgyE+JVvy5E2DQtWD9zWwgwRYkHIYi/+ixTvLt8Xd39u/ThJzEy8yb
         xckhnvcY9PnR/O9y/WywOoXxY1/9LXjOJXZsVutIRUtoxMCb/M2L5NnNVrO8YX9cdWal
         fd1QeX3biao9RnmYVhZkgeaVSxmBfUEcsdNYP4DLSY2M2b3yitg7/RIY7qrpbOQt1FOr
         vfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918043; x=1731522843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhgbEz6h9Yba6sgpMI3GJizlUji0eMJyuR9wkNgDATk=;
        b=B9JD5EPCuxlBJKdfVJiH3NxRRJDqSSh6a7p433DbVILvC6yrpn/D0JH6SYbS1eAcl0
         xO2r7nYZOJUzlTbs0hY+hNkt7UwswnxYsu84b40PvnvfvVRi5ixYX2cmkdJXQzhYXhsP
         7vaLluP2pZ3CjIQT9Z94dMOyG2qvXACf4ebYTQmCkYji+rG0akV5p2XaQZG0gXKpdw1T
         x4E7Pr3uz0Al4Jo7de4qBcYFq2DF0jUgCOGaHgjuGPO+imDCc535WOuUqYV0IqUFc1fp
         SFHvo3S5FORPfPdHiITjBsrZLHBYFzQtSDuKySReceqSK/FJ2QF4PtfODyIK9vexdYlh
         IqmA==
X-Forwarded-Encrypted: i=1; AJvYcCXOjiB6qEVou7AuGTSXcRd+hwAL48vdsoShgV3DM169DA7DkliQ8PvxbDnrNXYIidtjwH4qruMhBj8khaVd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8rCm/vROKLkt5OUVId/TopcxpoJZhm4II1N1wKK3JCrR8b76X
	DjwTImyMz3aSY0Y6HXnIs45JXJb2KrPOWccQ/Y4hgQWOfCd/05Dr
X-Google-Smtp-Source: AGHT+IG5AFRKgz+xdpjWoBvDFuQm1QIxrauaXKNygZ8gG7cjYrYhmAnbm6dscF5KQiQKPi/V2OGG7Q==
X-Received: by 2002:a17:906:c7cc:b0:a9e:c4df:e3c5 with SMTP id a640c23a62f3a-a9ec4dffc9bmr284337366b.54.1730918042801;
        Wed, 06 Nov 2024 10:34:02 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:34:02 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 14/16] staging: rtl8723bs: Remove function hal_EfusePgPacketWrite1ByteHeader
Date: Wed,  6 Nov 2024 19:33:43 +0100
Message-ID: <80b5cb563f5294b045b24266c5a99d1b4759c2b5.1730916582.git.philipp.g.hortmann@gmail.com>
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

Remove unused function hal_EfusePgPacketWrite1ByteHeader to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 -------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index c6cd0f11cd91..e15ec6452fd0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1151,38 +1151,6 @@ static u8 Hal_EfuseWordEnableDataWrite(
 	return badworden;
 }
 
-static u8 hal_EfusePgPacketWrite1ByteHeader(
-	struct adapter *padapter,
-	u8 efuseType,
-	u16 *pAddr,
-	struct pgpkt_struct *pTargetPkt,
-	u8 bPseudoTest
-)
-{
-	u8 pg_header = 0, tmp_header = 0;
-	u16 efuse_addr = *pAddr;
-	u8 repeatcnt = 0;
-
-	pg_header = ((pTargetPkt->offset << 4) & 0xf0) | pTargetPkt->word_en;
-
-	do {
-		efuse_OneByteWrite(padapter, efuse_addr, pg_header, bPseudoTest);
-		efuse_OneByteRead(padapter, efuse_addr, &tmp_header, bPseudoTest);
-		if (tmp_header != 0xFF)
-			break;
-		if (repeatcnt++ > EFUSE_REPEAT_THRESHOLD_)
-			return false;
-
-	} while (1);
-
-	if (tmp_header != pg_header)
-		return false;
-
-	*pAddr = efuse_addr;
-
-	return true;
-}
-
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
-- 
2.43.0

