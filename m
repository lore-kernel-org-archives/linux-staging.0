Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34752EB5C9
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753379937; cv=none; b=k0e2TQ9l3Vqp1fn3tpfsG1w9xDvxrCHmQG97B+OL/6kVMBtUEQK8P4tEhpMoMvAaUNW/jMq/YpJyh+l/AuREuWlEYwAUizDDv10fc3G6d6Wy9A9xqdOKsip3TUhQgCYxI2Iw8k3zYbRSSiipPZa1SSBPRSZNztHiAX2ppLSdVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753379937; c=relaxed/simple;
	bh=K8jy8lC0vXKnJGo8j1ajnUpJxFDUjeplSBb1drpHlcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3eKStOuXOxU8NS1ljbVwlWTg9XZVIjpULePnJW/4noh8xEhllS3BR+c8Q88L5lvdzO+CPMwhvZbGguEvjjLCjo0TspLSR0hN29tg42xqmZt0bQTvviccCq9AVjnPfG5kQEcWAMKvOqX9xLub9V2a5PJQRv1pgt/lxMiqdUjobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3vx7GQJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3vx7GQJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso2614279a12.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 10:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753379934; x=1753984734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9r3xc52zVdNjHOZzkIV/j2mgshG88/fLyFM4rWHFSLM=;
        b=k3vx7GQJoYcbwEkwcMEr/Wf2HCV89h5TA++TmN88fwtCQxwdyOAb0MxQAk8uTkpN8Q
         A1RGa1o90PucOIipFzUakLUaVAAG0NWKmcZcGT74mZki2b1KFoisaDdauK2EW8ZHVBxQ
         lfzv3LMvHaXsFqVKWPO4WkSGEroSyRVJpeklK0QNv0qQB2zfwLx9AmwOEYuqYsdjcLOz
         kGOae3QYWaUa+CmBDY4frkPHAUY4jQbf4KgAyJI+IHtordgEeL9GdFCy2BDk1RBXzR5d
         1dUfgtucO8XZos7jDKpGe/He73Nsjce+TnI0xGQJpjiad5ByH7Ni17uHVM2Eva7jXPfW
         VL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753379934; x=1753984734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r3xc52zVdNjHOZzkIV/j2mgshG88/fLyFM4rWHFSLM=;
        b=tB+NyVs91YPC48H55TMJ9akiM438FDSMRmZTi37rnRscaGn+hYWFo+38CFo9rCeFRQ
         Pbkif/j/o9srbf712Yfh0Qp7E+Yam19pZmu5qnJNyg5rt13cCLguN7L7zqffI30gfos8
         p0FKHQaxHOi0NuS7sAaM/Ey0jRE8+KgfamCwYjtOhq6Thi107bxI3ZJtRl5GC3ttGckX
         eQRPYlooeDTbud8ffBLclMVDVCV5XX9AkJUYU+7Yq5jEfoJd0iwYu+GBXoRT8gvP2Pg/
         tzrU/2M4JX0qZCDY4EPF5i9ukYUBhPeL6/lG84+hKcLQkn8bXxPb70VJMiHO5OMpSK+C
         797Q==
X-Gm-Message-State: AOJu0YxrE556dnhQvfiHRnv3BYyROJpPv5gjrN6kGS32TEt02AZu6/OG
	uW6mSKzyLizrVIhQdG19u4twPLA0eOBW9SdF4FYSOc+HmXlUJjTmqST/
X-Gm-Gg: ASbGncvleOTVN1zSZMTsVcp3TQuNfyDdZXBaCK/l3akLmVdKtg2BMj4T+f/V9pN5nfW
	vu+N/5auyNg0GIX5qAPWEcKMXRQo++ViMS+9I2xmRe3NSLfcjsiaWaon12Qyjh/ILk8FibCdBSC
	3JWKWSlt6sZ7RRtfrJlMflSTX0rJH6iIzJzt5/6/fdV9AJedl5I7ECXVpqICHJUGs4CRnll17pE
	rFm3WSwPdKlhs1vnIrauA6HQkEDI2FsW4PyCXuMDQ3mJ7jOt5lIuPywC+Gi/lws2VHvESDEBJpP
	kFe77VRozURS3IAg54l+JYDEsmry7vDJ8BPp4lKPVdNzLjBEQhdYo+pzFfTv3kTsqvQ/0O9/5bF
	vtrX2HgH3e4dvIqwI8BCj
X-Google-Smtp-Source: AGHT+IHteS95g5R+SEA5hYfsN63gBjXqrqlzeSj1IzPAJbScwKbn1hQUmgT3ebFm6WqVa9UsqoecmA==
X-Received: by 2002:a17:906:c148:b0:add:ede0:b9d4 with SMTP id a640c23a62f3a-af2f32dd3f9mr798904866b.0.1753379933609;
        Thu, 24 Jul 2025 10:58:53 -0700 (PDT)
Received: from zephyr ([77.237.184.200])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-af47cc6bc83sm139015766b.38.2025.07.24.10.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 10:58:53 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix comment formatting in basic_types.h
Date: Thu, 24 Jul 2025 21:28:19 +0330
Message-ID: <20250724175819.29142-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several block comment formatting issues in basic_types.h
to comply with the Linux kernel coding style.

Changes include:
- Aligning comment markers with asterisks in multi-line comments
- Reformatting long lines for better readability
- Improving consistency in comment structure
- Fixing typos in comments

These changes improve readability and remove checkpatch.pl warnings.
No functional changes introduced.

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 .../staging/rtl8723bs/include/basic_types.h   | 41 ++++++++++---------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 24626e65fc7..1c2da18e621 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -22,11 +22,11 @@
 /*  TODO: Belows are Sync from SD7-Driver. It is necessary to check correctness */
 
 /*
- *Call endian free function when
+ * Call endian free function when
  *	1. Read/write packet content.
  *	2. Before write integer to IO.
  *	3. After read integer from IO.
-*/
+ */
 
 /*  */
 /*  Byte Swapping routine. */
@@ -68,7 +68,8 @@
 		(*((u32 *)(_ptr))) = EF2BYTE(_val);	\
 	} while (0)
 
-/* Create a bit mask
+/*
+ * Create a bit mask
  * Examples:
  * BIT_LEN_MASK_32(0) => 0x00000000
  * BIT_LEN_MASK_32(1) => 0x00000001
@@ -82,7 +83,8 @@
 #define BIT_LEN_MASK_8(__bitlen) \
 	(0xFF >> (8 - (__bitlen)))
 
-/* Create an offset bit mask
+/*
+ * Create an offset bit mask
  * Examples:
  * BIT_OFFSET_LEN_MASK_32(0, 2) => 0x00000003
  * BIT_OFFSET_LEN_MASK_32(16, 2) => 0x00030000
@@ -94,7 +96,8 @@
 #define BIT_OFFSET_LEN_MASK_8(__bitoffset, __bitlen) \
 	(BIT_LEN_MASK_8(__bitlen) << (__bitoffset))
 
-/*Description:
+/*
+ * Description:
  * Return 4-byte value in host byte ordering from
  * 4-byte pointer in little-endian system.
  */
@@ -105,11 +108,11 @@
 #define LE_P1BYTE_TO_HOST_1BYTE(__pstart) \
 	(EF1BYTE(*((u8 *)(__pstart))))
 
-/*  */
-/* 	Description: */
-/* 		Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to */
-/* 		4-byte value in host byte ordering. */
-/*  */
+/*
+ * Description:
+ * Translate subfield (continuous bits in little-endian) of 4-byte value in
+ * little byte to 4-byte value in host byte ordering.
+ */
 #define LE_BITS_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
 	(\
 		(LE_P4BYTE_TO_HOST_4BYTE(__pstart) >> (__bitoffset))  & \
@@ -126,11 +129,11 @@
 		BIT_LEN_MASK_8(__bitlen) \
 	)
 
-/*  */
-/* 	Description: */
-/* 		Mask subfield (continuous bits in little-endian) of 4-byte value in litten byte oredering */
-/* 		and return the result in 4-byte value in host byte ordering. */
-/*  */
+/*
+ * Description:
+ * Mask subfield (continuous bits in little-endian) of 4-byte value in little
+ * byte ordering and return the result in 4-byte value in host byte ordering.
+ */
 #define LE_BITS_CLEARED_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
 	(\
 		LE_P4BYTE_TO_HOST_4BYTE(__pstart)  & \
@@ -147,10 +150,10 @@
 		(~BIT_OFFSET_LEN_MASK_8(__bitoffset, __bitlen)) \
 	)
 
-/*  */
-/* 	Description: */
-/* 		Set subfield of little-endian 4-byte value to specified value. */
-/*  */
+/*
+ * Description:
+ * Set subfield of little-endian 4-byte value to specified value.
+ */
 #define SET_BITS_TO_LE_4BYTE(__pstart, __bitoffset, __bitlen, __val) \
 		*((u32 *)(__pstart)) =				\
 		(						\
-- 
2.50.1

