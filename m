Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8559847F2EE
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119835; cv=none; b=LNbAazqjy2Sdqw+byAk2WKhxmnpRb53EMqUO5hnXyoZtSbzAsIRgVc0hIS040HKHGrdQpBJNkPpQQdlav0dff8Lq+WjttcrlGBZoDY6VlkXFGyYKel5AW2VcKNr5HqK0oT8XToNFvB4pwqRnhB0st0FwxR1UPAgFibMihl1eURY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119835; c=relaxed/simple;
	bh=dBVdRgXIWAoyKsj3TPr1oJMnRG77I8qkl71C8ky55BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1ZjD7iht5DZGzVENPSTljzciUFK5dA9ObNoRjvWZ67O2bachcv2WZD1L2lMf9VCNnK83FjLTz86Cx1xCkgq+5+avue8TnOL1f9/iQoS76Duzm+ki4YYM/zitU9k9g5BwKf/gys7YRYqayvUxpcrhfXpQDLx5rpE4lu4jmnF8VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFp78UWL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFp78UWL"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so49411411fa.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119831; x=1784724631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iop18RDc/dqM3JoQfcP5lwliQX3WzU3E7lAR8YIGN5A=;
        b=CFp78UWL0CWmiCbDXHodAYnwgJFxvQpIYebwpTEeiw431oAvnaDAEzaNvPv9zdf74w
         DYrL7pA/Qt6k2LK4VnZZ6izUjkfyMhu2+55tkQPev5c1o2EfGFTAUG+en0VBjo/tCJ+v
         prvL7IWJUcJ79XJe9T77rmUpYbQzWzfGALggcTcrImF5GCNR/55TUuG4ukrs72H7u3dc
         uhRRH4KmtuMZFn4oV/bw9am3cpkgJnTIVk7eqxeC4yaCDcvpxQzneejdxdxSLRiIoApe
         JWNz/JIJdbY39NfnR8wuFFxiINtApjLtyPCAqADAI0NG+pAXajbVvQgx4MBHWZcdKymz
         1BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119831; x=1784724631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iop18RDc/dqM3JoQfcP5lwliQX3WzU3E7lAR8YIGN5A=;
        b=FMtorXIAY9nrOlZ2q4YpIGdNltjlw9PWN+4dYGs5wEyPZlqyg9B0tZzw0IE3X6b3F1
         /co4qROAOynBgDwsezYi4sqcmyFcgxlAK3nRdWs4o9hPkdluz/FuPEvShQksgbcpZcOI
         HqbvBz6xL/fNAHnAuuZgUE9xHSothX/JtmW97Doc6yrM2Sdxkegm4py0LghZ7rmPYopu
         VB00BaP0UaQZW5PMhDQE57UTWarp8xHXQUP07yjjKQ7QlEc8Ofp1YYQSqwpte5VnUkji
         xsGgv8+S4Iku1mAx+h4lQRQSp0mreA99gDl6lL46OeboQR1W7pBLbZDMt7bmRV8/XAFk
         sSSQ==
X-Gm-Message-State: AOJu0YxOd2AqUM2BcNc/xeXZuMFuLkYT6pJFK2oEkw4Io9xGkeZdfaJl
	gO4K+bAA75kh6GL4JIZ0ntNbT99VZNNTtKbkLifT4JDcwmbolqQ3QXSJ
X-Gm-Gg: AfdE7cmepGdX8XSUdV3X6vgvYvVR3Z94mgwtB84x1udAJgkb3EQ5Q7o2q0WpYUntalk
	liJqeER2RPjA+vUKS/mGRW0iqt4mub/5hcg7TXu3gDf+/85ymlDrKQp1RcFk5utGzGvMsXqApRt
	l65B1TepRaGzPxY3G2xFbdCkKsapjYByNPyZxGucgDB8dWNAUbO3LYQKZfhOm/acIk1igpCE5CY
	TaWrj7pxTlYpV6Sz36SUPBKNOcSFVrStGSmExETszBehp8uRCdkCZE47nWIsA+3x6aWYQKr86xY
	SUWW88FqApEZhbaIAyaeTCM9TGLjDumTL8Fq4K4FWIjUKYk6aCQrWkLgygotAYtugleDM3qDO1m
	2uQ/YC03JcaJ9iZ3C2OhSoHvFVDT9v/iOVQxfm0Hp7i+cFm5W52o42Me3U1OyAN59rQDNz4t35e
	FAVpFNns+lqahXMk9G2IA6symqkd+C3DaTRsosXT0eJqfjQfA28hRT3O0xZGSD4h1OXOGb2+dTx
	tSxI/xY0L7Wf4u7TXERrEvY
X-Received: by 2002:a05:6512:400b:b0:5ae:bade:3d27 with SMTP id 2adb3069b0e04-5b159b87076mr1325021e87.37.1784119831028;
        Wed, 15 Jul 2026 05:50:31 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:30 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 20/61] staging: rtl8723bs: sanitize and align efuse read function headers
Date: Wed, 15 Jul 2026 19:47:48 +0700
Message-ID: <20260715124829.90290-21-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the function headers for rtw_efuse_read_1_byte() and
rtw_efuse_one_byte_read() to conform with the Linux kernel coding
style. Place the return type on the same line as the function name,
collapse arguments into single-line definitions, and drop the obsolete
trailing comment.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 30 +++-------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a40d6eab7..52ec19294 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -25,26 +25,8 @@ rtw_efuse_calculate_word_counts(u8 word_en)
 	return word_cnts;
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	rtw_efuse_read_1_byte
- *
- * Overview:	Copy from WMAC fot EFUSE read 1 byte.
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 09/23/2008	MHC		Copy from WMAC.
- *
- */
-u8
-rtw_efuse_read_1_byte(
-struct adapter *Adapter,
-u16		Address)
+
+u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
@@ -79,14 +61,10 @@ u16		Address)
 	} else {
 		return 0xFF;
 	}
-} /* rtw_efuse_read_1_byte */
+}
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-u8
-rtw_efuse_one_byte_read(
-struct adapter *padapter,
-u16	addr,
-u8	*data)
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
-- 
2.55.0

