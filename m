Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF00205E0D
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352185; cv=none; b=ODHDxYd3JmjBMqCvEVpwGw1mfBzaVUOrGu2IJPAgwevZ3U0Ywiryxm4Ppi3T3pojmF5jx7t49FGn7qnEb3yUZ22fb1hRs2HXm3CsNcK8wy5PD1NpSnv/k/WrFgnEKXqP+kvqMMWqkBHgTdU7fX31LKyeit0Pkk9UoXVH/y+7EBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352185; c=relaxed/simple;
	bh=8GQ2IbQO/TBdQ5t+CG7jhfSfm6Az5rcS01/oAUZJR5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvZgS1Xca7m10VIrETOCSuE031Tb8vAxW7XdCDpZxoLPF0DOlhQtC/JXIMfhXMwABVRxXT5dU/zuDdLgxr6lwZpQtQxhtGNt7RqP3WeLCVz3KkbMLzz6cyBv1NqWbWCOBqQi66GveQDUYe3QuR2lC3AXbPvKDqNyrLm646ZuDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6Z+BgFb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6Z+BgFb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f6a47d617so70528415ad.2
        for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739352182; x=1739956982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu04RjybaCqnANGt/0BrWouaa6SjIJlJpx9c2WRJsXI=;
        b=C6Z+BgFbBqOjsMT1/1DCeDikn5sidbv2k4vqYwYafVB8Rgg/3H8Ls/t4/AOblNmJHG
         vIS4uwQbKTUl18NiODPE+y68KTC1FH/UWJNcRV7orcyFAlS54Hfh71NU+Y4iAI80MEgP
         GSTmlS0hDB7UNwciRgfXVT9IAI/AYXUfUtqihCysS34MAaO/zQyWDz1lmziN9qpvBzay
         dpvBB/brZQcRT4jPj8miS8QKwOkAq7Gf4tycG4dkpCZiuoaki6Z1yp/1dkvXEiGlH7CZ
         IptjCjWK3OCCUQVn9puD++StZCp0eGA0edlCgT/JwxqabK6Jb3L97k/k91UP1DfO9/kF
         N8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352182; x=1739956982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lu04RjybaCqnANGt/0BrWouaa6SjIJlJpx9c2WRJsXI=;
        b=anKBcnc6nJPzmPNWAFk5M1nTVgaqxAiWfX5xrUdICVvzFs62QFVINwwI6n6gxSn4cP
         +8JZNmI8BcbHHl6vF9BeFk5+uRFIOPGsBw3MZwHLrf1pr8lhwpSvin9Ex5+/xebB4Lhd
         /3gONMSKNbyjpiYWB3Hn29DwAShUAQ1az8qOZ+lYL6j0UeyMzgFVNywKI92H+9Rv3BXG
         K8ZZApweKivhFtLo+Th1Pg44vBGBt75MO2xBZdzYrZyPfFb1q6WDQPHoRXKSORw6XRja
         Td4Ytcv2WJkoc0Y724Z3mTU0iSDlkdbmcNXISSZyxr2g9aVPfM0nf9aRIvW0nDfnkyFB
         Ro0Q==
X-Gm-Message-State: AOJu0YxG879cG/jYTN4PD2HgS4Liwqmi7Ww8O+5/P3rAbEI54yUkIzhL
	Ead0+oWY2dQ9+ruirZxjNb+VhU1BEKcE9RWeJv5HNy1uAdS/VVYLqdpJ5Un4
X-Gm-Gg: ASbGnctKkwmJEWAgrPYt/9IjCyp9O8ZNxUaw7VRGii/UHj6iK4rTOHwb79NZ3dhMPfT
	9S5UayottoiFmyq8DSsjIzZR4kPist9fAPtfnFAQnOJNwV8L6yhrLdF2Ze7XIcJVLn27Lh4pF66
	SMmDHWh/gdSRzbDTcaCB4x5SCvTpzloqIQismdxYfkc22gQhzlGzlgrqfLW/BTvMJw5Uu+UvlFP
	uM5V3/p0s1SDWmVQ8wjz5rxU1PsR5XX9mdaRUaEr5L+svHm3CC3kdMzWGQtWVDUdAwUbDZzrPTO
	MqtubO1L8sgdhzkDJ/+8YGeIMSvuxfCVOi473Nko/SaTzu14B8M61aSTqZtl5nxX+hmueFcb7RC
	x
X-Google-Smtp-Source: AGHT+IEVEHuWDTkCXAnIlbVfuyBTkarR9SODQIlkdYItGRxFMa9+LvgX1ERdoq8t4tLxWuNRs325BA==
X-Received: by 2002:a05:6a00:804:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-7322c43107bmr3993447b3a.18.1739352182475;
        Wed, 12 Feb 2025 01:23:02 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73091b2a97asm4838829b3a.152.2025.02.12.01.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:23:02 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: format comments
Date: Wed, 12 Feb 2025 01:22:54 -0800
Message-ID: <2e6dc11ef35d5af653095e416f2a48b6dbcc0de1.1739351267.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1739351267.git.onlyian4981@gmail.com>
References: <cover.1739351267.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some comments were not formatted correctly. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 92 +++++++++----------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 1e9eff01b1aa..f4556ae54352 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -30,10 +30,10 @@ const char *security_type_str(u8 value)
 /* WEP related ===== */
 
 /*
-	Need to consider the fragment  situation
-*/
+ *	Need to consider the fragment  situation
+ */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{
 	union {
 		__le32 f0;
 		unsigned char f1[4];
@@ -342,23 +342,23 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
 	}
 };
 
- /*
-**********************************************************************
-* Routine: Phase 1 -- generate P1K, given TA, TK, IV32
-*
-* Inputs:
-*     tk[]      = temporal key                         [128 bits]
-*     ta[]      = transmitter's MAC address            [ 48 bits]
-*     iv32      = upper 32 bits of IV                  [ 32 bits]
-* Output:
-*     p1k[]     = Phase 1 key                          [ 80 bits]
-*
-* Note:
-*     This function only needs to be called every 2**16 packets,
-*     although in theory it could be called every packet.
-*
-**********************************************************************
-*/
+/*
+ **********************************************************************
+ * Routine: Phase 1 -- generate P1K, given TA, TK, IV32
+ *
+ * Inputs:
+ *     tk[]      = temporal key                         [128 bits]
+ *     ta[]      = transmitter's MAC address            [ 48 bits]
+ *     iv32      = upper 32 bits of IV                  [ 32 bits]
+ * Output:
+ *     p1k[]     = Phase 1 key                          [ 80 bits]
+ *
+ * Note:
+ *     This function only needs to be called every 2**16 packets,
+ *     although in theory it could be called every packet.
+ *
+ **********************************************************************
+ */
 static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 {
 	signed int  i;
@@ -383,30 +383,29 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 	}
 }
 
-
 /*
-**********************************************************************
-* Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
-*
-* Inputs:
-*     tk[]      = Temporal key                         [128 bits]
-*     p1k[]     = Phase 1 output key                   [ 80 bits]
-*     iv16      = low 16 bits of IV counter            [ 16 bits]
-* Output:
-*     rc4key[]  = the key used to encrypt the packet   [128 bits]
-*
-* Note:
-*     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
-*     across all packets using the same key TK value. Then, for a
-*     given value of TK[], this TKIP48 construction guarantees that
-*     the final RC4KEY value is unique across all packets.
-*
-* Suggested implementation optimization: if PPK[] is "overlaid"
-*     appropriately on RC4KEY[], there is no need for the final
-*     for loop below that copies the PPK[] result into RC4KEY[].
-*
-**********************************************************************
-*/
+ **********************************************************************
+ * Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
+ *
+ * Inputs:
+ *     tk[]      = Temporal key                         [128 bits]
+ *     p1k[]     = Phase 1 output key                   [ 80 bits]
+ *     iv16      = low 16 bits of IV counter            [ 16 bits]
+ * Output:
+ *     rc4key[]  = the key used to encrypt the packet   [128 bits]
+ *
+ * Note:
+ *     The value {TA, IV32, IV16} for Phase1/Phase2 must be unique
+ *     across all packets using the same key TK value. Then, for a
+ *     given value of TK[], this TKIP48 construction guarantees that
+ *     the final RC4KEY value is unique across all packets.
+ *
+ * Suggested implementation optimization: if PPK[] is "overlaid"
+ *     appropriately on RC4KEY[], there is no need for the final
+ *     for loop below that copies the PPK[] result into RC4KEY[].
+ *
+ **********************************************************************
+ */
 static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 {
 	signed int  i;
@@ -1456,7 +1455,7 @@ static void gf_mulx(u8 *pad)
 		pad[AES_BLOCK_SIZE - 1] ^= 0x87;
 }
 
-/**
+/*
  * omac1_aes_128_vector - One-Key CBC MAC (OMAC1) hash with AES-128
  * @key: 128-bit key for the hash operation
  * @num_elem: Number of elements in the data vector
@@ -1530,7 +1529,7 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 	return 0;
 }
 
-/**
+/*
  * omac1_aes_128 - One-Key CBC MAC (OMAC1) hash with AES-128 (aka AES-CMAC)
  * @key: 128-bit key for the hash operation
  * @data: Data buffer for which a MAC is determined
@@ -1541,7 +1540,8 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
  * This is a mode for using block cipher (AES in this case) for authentication.
  * OMAC1 was standardized with the name CMAC by NIST in a Special Publication
  * (SP) 800-38B.
- * modify for CONFIG_IEEE80211W */
+ * modify for CONFIG_IEEE80211W
+ */
 int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
 {
 	return omac1_aes_128_vector(key, 1, &data, &data_len, mac);
-- 
2.45.3

