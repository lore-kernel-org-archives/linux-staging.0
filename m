Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615613;
	b=vEJji0Z68V5R4ZINRONtV5Y5XEhsb4UW2SXVeKM3w0E+SH9hEpCeiWxO/cA/AzIVjbK7
	 UJpbHjt0uretiB0qdC8z0enloHZDai0KzFCa6u383B90QpbSXy+jhbqfWfQ+7PytE1Okw
	 66LEhNhRoZqsXQU9hrr8Ce8C0Ob9NLE8Dds+KOWe+CPOAx4nt/FyIpNmi101lhKBSbzEu
	 baG7L8MJc+ikJ2B035xb/EkBHxivDTLNeHPyQzhl878EPx8KHPMeHR8olDkaau2lFcNhU
	 Tjbx0mIvwCeDanpz9n+go/WdpaP2dqqgh+r99DAusiKnT042vW6C2se5pPUaQVr+Xpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Rbjtzs9OvRd9HXNbE5Zvedk5qsEPAbwIpjYzhOy+A7c=;
	b=T7N3+BlV83v+ZhqrrFYBxOhWZqb/u4KHC4hQY8gIYVwZ7X6PSUi73Yb4eyH1DP476BiX
	 +UtrHsPrNyFZhLZ01PpN95jJZa5y+iRazREhBof7/QCqhVqG4Y71G9osm7lj7D3zxZhOq
	 I2goP0Ib+NJf91eCqM0A+3aFRqoecj+/jtRqmncxoHJ1ihlNWFv2QLTWs4YeIIMQEeLII
	 9i+tZW2SDTb6lvzlJAFvh/I5aFh8cq206yR5RHT8hlL7MENH1Rx+JDX+N4QjNdh1+zPj0
	 eIqbWW+EKeEauXfQzev5rvbQEv3EYsE9SeLGZd5qXI3Ue1kpqHtFj3NdO6Z2FnAe0nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FDtwFAWa;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08019606A31A
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 20:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08019606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FDtwFAWa
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e00eee27dso901073f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792615611; x=1793220411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rbjtzs9OvRd9HXNbE5Zvedk5qsEPAbwIpjYzhOy+A7c=;
        b=FDtwFAWaMcv5EPSnepPINhfKbM2gFZOH0VKzrE45el5KeQsEGaRTkylPDEReuCyKhk
         P/HCwTVQAmXi19t+iAHcCQP8bPj6bhKd+LS073Ogr2BCMSlAduiLmkOb9Kr3TY/GFilj
         mL/DXWouU7w7QMi6IgTKvN6OYprouZGlHegGlA8UPLucFubvAQQIzt132B1K86bnKCw1
         9JqgzDnaN5NAYkklWSbn1S413Wyyqo23Bg1hdCyNSL2FPZq/5EOvn4eNQ8Ks4zxeY4ST
         +Db2Je2PHkaGooorNy+EGaHsQONTuQuhJp1nOnxT38n/NSMg9rIQB+SHTkeNXgHzSdbl
         Ra4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615611; x=1793220411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rbjtzs9OvRd9HXNbE5Zvedk5qsEPAbwIpjYzhOy+A7c=;
        b=Zkz+7ZCYwixP4bHRloq/yTxhtUSs+mwTMl7VLGnfyKNz4i8gJbCw9iFB3Qedqyo/Fy
         HVG7j93fa9we5eB0u+l/9afURrYlNvmOxEZl2C+jgoJ/NgMFNOQ3FNDh8qatbVBH6beJ
         f/UJemRGna1aZnrFeJUz4GfE80dtT756a9R5r3vj3pM0vIvYBHhtY7Z5H3+QlB819G3/
         lOANeY0Qg0NiKnSqCqriN96KIq1pCWJp3uu9KAWF9xiPzBfog41//PgVeeXTIRXlIqE6
         M8zMgs+Q8DxLmrV2S+V+MVM6lql35dCjdvgNyWwqAW2s/EzqxmSaNDnZwWWNPK1va7Pv
         uzHQ==
X-Gm-Message-State: AFq9FYJ1oqSERrQTj/0fgE3BelF20jvyP86uBor+Y3GIdV/QA9zv0Sgu
	L1NgLJ7TqvSX2qudBpgXGkE4h21bsRzV14dsLWhX6cNlkR0mIQuQsPvJ
X-Gm-Gg: AYBFou1KNiAOhg9HP3wNydz/E2OlrGKJj9qJB9BVbSUjw/sRTVs0tcaDHoi4Q7kW+m7
	4avFRpPX/hbItdyh3nlrteMunXlaXw2HovImRJur6ASrm1zucAba40R9ueD6e4LEziQu+fMGTba
	ICqp2MFpphpWk8Cvew1HYp0+6eG3+XOC57SiR0Ki0pb7IXLbMakcAQQ5RxdffqCbBbDHTVnWBQd
	XOZgfjtKk9Pi301Qjbq75IzBSkLtfcbhSeL9NjdIUvj+ERpkooQvbBqW2gkBaFEYmUQ1PgqAPrS
	Qln6vZSDUngk7Vi5T6LjptHy2dce15Av3IIDtpd90hdpcYoPdtd8YQ3g3NC3KYS/dPx+l1DLFto
	/E8fnIoQvuhM7IdvD+tuqj8EOXfxKdsWCzAA+0uHQ6Y5bZnQpZTOwfE+3DSeIZg6p/IoSxvcA9c
	E+UJr8IMdyl9Z2zXqOvlMiAnBe8LjAWyf1tFfeMabGeXkuJyWF2dT8lHfMOZ9xcKZ2kKA7v3JDi
	jKbVJRAt9qsxMiUn//pBSci4J3dx7YMRlvPYhQINN5RlQSHCDRzxX/rOqPP6XSxxfUp2uoyUMSg
	w2SMIM3rAaBHd5oTE9x5d8tPTRR957K41AOUkk7exgOueg==
X-Received: by 2002:a05:6000:2d06:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e264e1407mr4953487f8f.47.1792615611105;
        Wed, 21 Oct 2026 13:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b029:b141:6192:5529:fb1b:7124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm8623779f8f.40.2026.10.21.13.46.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 13:46:50 -0700 (PDT)
From: Yaroslav Shevchenko <yros22776@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused macros from wifi.h
Date: Wed, 21 Oct 2026 22:46:33 +0200
Message-Id: <20261021204633.33067-1-yros22776@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SetFrameType(), SetFragNum(), GetOrderBit(), ACT_CAT_VENDOR,
_IEEE8021X_MGT_ and _IEEE8021X_PSK_ are defined in wifi.h but have no
users anywhere in the tree.

Three of them are also broken. GetOrderBit() duplicates GetOrder(),
which is used by rtw_recv.c, but casts the frame header to
"unsigned short" instead of __le16 while masking it against a
cpu_to_le16() value. SetFrameType() has the same type confusion,
whereas the SetFrameSubType() macro next to it casts to __le16 as it
should. SetFragNum() passes a constant mask through le16_to_cpu()
where cpu_to_le16() is needed.

Since these macros are never expanded, neither the compiler nor sparse
flags any of this, so the first user of them would inherit the bugs.
Drop them rather than fix dead code.

No functional change intended. Built for arm64 with W=1, no new
warnings.

Signed-off-by: Yaroslav Shevchenko <yros22776@gmail.com>
Assisted-by: LLM
---
 drivers/staging/rtl8723bs/include/wifi.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 93cb83488..719a1ea34 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -123,12 +123,6 @@ enum {
 #define GetFrameType(pbuf)				\
 	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(3) | BIT(2)))
 
-#define SetFrameType(pbuf, type)	\
-	do {	\
-		*(unsigned short *)(pbuf) &= cpu_to_le16(~(BIT(3) | BIT(2))); \
-		*(unsigned short *)(pbuf) |= cpu_to_le16(type); \
-	} while (0)
-
 #define GetFrameSubType(pbuf)	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(7) |\
 	 BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2)))
 
@@ -145,14 +139,6 @@ enum {
 #define GetFragNum(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) & 0x0f)
 
-#define SetFragNum(pbuf, num) \
-	do {    \
-		*(unsigned short *)((size_t)(pbuf) + 22) = \
-			((*(unsigned short *)((size_t)(pbuf) + 22)) &	\
-			le16_to_cpu(~(0x000f))) | \
-			cpu_to_le16(0x0f & (num));     \
-	} while (0)
-
 #define SetSeqNum(pbuf, num) \
 	do {    \
 		*(__le16 *)((size_t)(pbuf) + 22) = \
@@ -306,9 +292,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
 /*-----------------------------------------------------------------------------
 				Below is the definition for 802.11i / 802.1x
 ------------------------------------------------------------------------------*/
-#define _IEEE8021X_MGT_			1		/*  WPA */
-#define _IEEE8021X_PSK_			2		/*  WPA with pre-shared key */
-
 #define _MME_IE_LENGTH_  18
 /*-----------------------------------------------------------------------------
 				Below is the definition for WMM
@@ -318,9 +301,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
 /*-----------------------------------------------------------------------------
 				Below is the definition for 802.11n
 ------------------------------------------------------------------------------*/
-#define GetOrderBit(pbuf)	(((*(unsigned short *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
-
-#define ACT_CAT_VENDOR				0x7F/* 127 */
 
 /**
  * struct rtw_ieee80211_ht_cap - HT additional information
-- 
2.47.3

