Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C54243DA5C
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671306; cv=none; b=bP2a0wRqWfuvYeSw6C7e67qjnLDny931SYZs9P926abJPWk5fFd1Tde2AeivSqf+sAA71apSBKPbbwd8ALFzp9kEHxZi2W2NwOLjgcNobeY+a/L6SP/t00MNazlvjoCumdejqDEWgOaRT/uCuUOLKPmjq9Mqd6Z5tZV8EkwyHy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671306; c=relaxed/simple;
	bh=kbKDu/079E+YGckG0IZyv4PYSic/CVWb/SWk8feol6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgmeTMTmv8EN3jGAu/kI/ATdOQt9mQsK28YN3FR5gHx1xwn4L3WSwPHCGejzqo9FbAKJHUStpbkkYtSwzu3Qjk7rFf4RJPlv/QwdYoq+2n3N4Dx4JyklAcRtPqFWpD2DM/LGZtL814B870XjD3lNDtUb4AGATpv9ViPmT7hiYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUbHUrMD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUbHUrMD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so1742351f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 15:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784671303; x=1785276103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tNDArrQhjAw/UF5CZPAGQs/eQvTvCiV8lOXtii5gUw=;
        b=OUbHUrMDMgJt3JPnlrM6lGq4woxPiOWjT4N2THcItE5vsDyvEVNKmhgCmmTlnPkLBj
         D038XQ4JUQnVUJlMHLRjl/+fVxeK8zm781y1aAlbXTC1LTsydW2bYwnxNBtv9pSBuTgI
         +sSgoWg8Fy5Oqa6qbP58lG8yra5s/kfbPQZmhZxpN3PT86k7/yOzjak7ZB0V3C5sU15B
         2Jpm2O1IZ5yt+WXKSoEsRQqS6H9JT4X7k/kcXHmDrNPPlDaJ9M+sPVWQIMkf6Z39n4Or
         1urLhcH2EfQm0JHayCeC25C2pY0UZhjhl04hIRH2xQqmxvUnQQUq26FyeOvsUUJ0zMrL
         0AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671303; x=1785276103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tNDArrQhjAw/UF5CZPAGQs/eQvTvCiV8lOXtii5gUw=;
        b=BMiolcEwYQ6aqZyCU9qlKQ2b3XMF1MaGq4AmH3Rd7PAR5Ru6+sRkz/kCcnPVO3MR9i
         fbEZXd60ZOHhqII2tZ5mZCCQLDeUNKVPhlBbZqGuo5i/tzwoidgzEJRQCOMJ/eXRd0Ou
         9+UNHetDqlkQ9qUWbGpTh+LD46T6iwHwEuSQPmTxqvr/KAsnlBMiFUhsmFygAqaGoFOn
         fMpGayyRlvK05I/2Iyx+Z4ktoJQCbwYUGgdiBmT2JdAQ2ivxstx2rfXi2pnUaecetqZP
         vKAMxYrfMBoY7OiDauDzWyr5yCXlN6lZwT0+CLRJN0Bn8mllQDQi99P1RKgupOK7PRJ7
         Xs2A==
X-Gm-Message-State: AOJu0YzISYtSVV90nNnM50sTN3d6mQeWi1fWdkjJcWchTb6NdvagKqnx
	WkJ+bG8lFBizebvs2EFiZJGnbsuworU9GUPF5+FVGJnvpMuxF9SxDMEP
X-Gm-Gg: AR+sD13H1F3N7cs1SpnpC1EDmOdGEQcnBQzQOoBRFgbQkNLgwCdXW88+5/UWtiU0DY1
	+iN5h/CfOts6iwXEFhdRFkigcaFPtbFpYgtDW7/KpijCRDBdExe8KZWvwLtmekA0SbHyUG231q3
	TiBDoEliX07KkJjN+EVCjXETlAsY5iXXJdNnogpGwt4kfEoIF4XtM8R7iSF24chX2RyJOgxEhW0
	d07h1Otb//zjmSmF2LQEIb2YyBD/yNCbiRnKA7Di5igi9E6vp2lMw3HX/wzQuC1pNlLDr7f1Am5
	VQue246m/JO9t+ZuEwDHUO0ivN2qU8e0BtZMIEe5J0ivzpdaopRwokbBreWoJ15h1L1pB/pRvYI
	W2rrmixkQVPqjNht0BvYzunY667mdSwIT+40icuHCOUMlA23ywfypYXMQ0loJWKKNVjekaWlB7K
	+4vZ/qJjWEfC5kdzk6z2SMnpo868ISM+oE3TUNUdUl
X-Received: by 2002:a05:6000:178a:b0:47f:7636:7692 with SMTP id ffacd0b85a97d-47f76367b41mr13816188f8f.4.1784671303382;
        Tue, 21 Jul 2026 15:01:43 -0700 (PDT)
Received: from soup.lan (73.pool92-185-242.dynamic.orange.es. [92.185.242.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm30168f8f.16.2026.07.21.15.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:01:43 -0700 (PDT)
From: smart-bee-hub/beezled <smartbeemails@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	smart-bee-hub/beezled <smartbeemails@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove consecutive blank lines in rtw_security.c
Date: Wed, 22 Jul 2026 00:01:34 +0200
Message-ID: <20260721220134.4077913-1-smartbeemails@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: smart-bee-hub/beezled <smartbeemails@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 0cfd7734c..da61a552b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -409,7 +409,6 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 	rc4key[2] = Lo8(iv16);
 	rc4key[3] = Lo8((PPK[5] ^ TK16(0)) >> 1);
 
-
 	/* Copy 96 bits of PPK[0..5] to RC4KEY[4..15]  (little-endian)       */
 	for (i = 0; i < 6; i++) {
 		rc4key[4 + 2 * i] = Lo8(PPK[i]);
@@ -417,7 +416,6 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 	}
 }
 
-
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 {																	/*  exclude ICV */
@@ -491,7 +489,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 {																	/*  exclude ICV */
@@ -593,11 +590,8 @@ exit:
 	return res;
 }
 
-
 /* 3			=====AES related ===== */
 
-
-
 #define MAX_MSG_SIZE	2048
 
 /****************************************/
-- 
2.54.0

