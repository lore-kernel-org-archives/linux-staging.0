Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E13D7D66
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557602; cv=none; b=rH1LIMyksOSfk08ukvqJBVqNsdIVgTR3gwpAnyNThjTYuzVsvOQ8gf8B5PPUlVkbBe5Of0NwlPzFODblJoc+OwjO8zP3gdVA+SuomBOPhu+RW24kn/plFdYBNQD/N2/3tTgS9MAsRHSF8WltqI4w/7GqSB5oMJI5MBIs/FILWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557602; c=relaxed/simple;
	bh=p/jPcTmkeeX77iSaCsL7N9400sQYSGpluXtQkUOG47c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRB4UTw4ibvjJ2HSjzN4BxJODCFXdNnYGafBgNOJT7ibcL19LIA9kI+KD+XdA7wzDbBs9qHvEtEAu5UdaUgnl6KGVg75XbDoCB5yIJ+Mv2DfzBm5wEG0D0Y7FwMF3D9KV69bCgI+UIPFONMJZPOkELbEcSSHaYxGMNm3akECdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4fWUwOg; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4fWUwOg"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c999f162c9aso6356738a12.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784557601; x=1785162401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpEdeGGLeSN9RZd1dNw8hRrHTwjmNFcu+OQpMNS+88Y=;
        b=N4fWUwOgsry0qZ5Q18utjrK6uBnOnaeS2SKArRQ/Sc7VZSlkzoozKOBHQqhPqC7sKN
         dQ6UAlfnQcWQCp5c9BTbHZ0+DwA9/5dHkUDIdo3dWihfDepOTUnzGAj8Qmg0GJTnTQFe
         WOvcTXsnEXEVU0o0nF88Xa7AR5gt51JZ90covsqrWO6siszbsR8HwE/CXKhct3A3GK/n
         FJdL0i9/Nlhr+BFBWgzIusoWaoyYulXV887hssXcJEh0sm3jjieEiMVDQGDm77ddY77m
         GNtTR+bzFPrn7FprCpvE4Ei2Ui7yPPzoGUy6okz0Sx9MsXA7zEoDlE44Sbrx4Dp8OHH5
         Izrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557601; x=1785162401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpEdeGGLeSN9RZd1dNw8hRrHTwjmNFcu+OQpMNS+88Y=;
        b=AZD2Fmmg3lerFz/HMdb5Qthdu2wOSAkdBj58BlepagNdTFYSof0HOcdyU0IblJOjgg
         QbCUoT+OTJn9svKuVt2lblgSjv9ySMrn32b9XgIKy1ugX38j4LQHhzBgDNve2vgdIiju
         0b4Ust6XXlGZW5dXGBx+Xfax0/5pL8CpqL47UvDXdKYqJBppkPnX5xJa1i9Ar+dZ/0r8
         o7aD3hUmgzik27DcdGJ0K5aHrhz5VQ2TB1dDTaJeJnQH3NEfV2gdovsjmu7p5IR0i5uO
         ygJTKgbtn4XcU0jYWo4++e0kKFzTDWVnMGJf/5rC40s1Mwk67q5OJleW7ML2UlcDuYgu
         5lOA==
X-Forwarded-Encrypted: i=1; AHgh+Rpp4xjlyFJ2vApHmKPffa6eRPL1cZ+QV2LstbirpKQvWN0iDk56DThzPIA+OmaUEwrQgG3vXFZKq/vAuDmv@lists.linux.dev
X-Gm-Message-State: AOJu0YxhMPblZWWyvHR4rCQ2xZ0w4svkdObGKZc590Mib40jOatdKJM6
	wyT4Z+msTqp4iKqEK5+bjOb+uShumZ+wUEegG+xBHwzKy0DSz5shc9PWyP4EjlnWQpY=
X-Gm-Gg: AfdE7cmL2r40f7pYj+vIyK7sjDubgfe/jcFd5ROFjXObVNFVXeKp4CDmxlSFYwTkMZQ
	NXtT+FQtm5HPTIxq7fV1fh50wI1pwRt0pdbvAeNjnmS4p9Im5m4D05R+Vl5zJg6Cle0hq3yPZiA
	niG3IoSt/K2BiIeAYMiqzWCeCfdjeex7GXvSfLYGB5OmM9ImQB8dpbGoqmWwk8i54e5VnT6fd2Y
	e67cSIM5E5oL7/4KKPCaWPRWfvT7wBLVvGHfs8pQaZwnBwgHZ3dXVcM6uceNnMCdWKKtrjrN+as
	1a3kYk05F9gbdlsxjgGfqSD3T6L2Tn9m7mxyi9LsHknXKuMsE/eU8ICBf7+XHz1Z5JZG5Bvr7zW
	Ca/5zu0a29x9PSYyZSZhVZtdCH8Qfhj3t5FbvYlKtX7Fbp2b7sqQ6zlecvB0WHlhwj38tLDydVs
	xOpg==
X-Received: by 2002:a05:6a21:484:b0:398:6ea8:21d2 with SMTP id adf61e73a8af0-3c3ad7a2ebamr16040253637.19.1784557600692;
        Mon, 20 Jul 2026 07:26:40 -0700 (PDT)
Received: from PC.. ([103.172.209.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d444sm43228050eec.6.2026.07.20.07.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:26:39 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH] staging: sm750fb: Align prototype parameter names to implementation
Date: Mon, 20 Jul 2026 19:56:05 +0530
Message-ID: <20260720142605.63454-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The declarations for sm750_hw_copyarea and sm750_hw_imageblit in sm750_accel.h
use legacy CamelCase parameters, which do not match the snake_case names
in the actual implementation in sm750_accel.c. The de_copyarea and
de_imageblit function pointers in struct lynx_accel (sm750.h) also use
outdated parameter names.

Rename these prototype parameters to match their implementation names.

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/sm750fb/sm750.h       | 10 +++++-----
 drivers/staging/sm750fb/sm750_accel.h | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 0324778768cb..cd34d7f82c64 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -57,17 +57,17 @@ struct lynx_accel {
 			   u32 color, u32 rop);
 
 	int (*de_copyarea)(struct lynx_accel *accel,
-			   u32 s_base, u32 s_pitch,
+			   u32 source_base, u32 source_pitch,
 			   u32 sx, u32 sy,
-			   u32 d_base, u32 d_pitch,
+			   u32 dest_base, u32 dest_pitch,
 			   u32 bpp, u32 dx, u32 dy,
 			   u32 width, u32 height,
 			   u32 rop2);
 
-	int (*de_imageblit)(struct lynx_accel *accel, const char *p_srcbuf,
-			    u32 src_delta, u32 start_bit, u32 d_base, u32 d_pitch,
+	int (*de_imageblit)(struct lynx_accel *accel, const char *src_buf,
+			    u32 src_delta, u32 start_bit, u32 dest_base, u32 dest_pitch,
 			    u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
-			    u32 height, u32 f_color, u32 b_color, u32 rop2);
+			    u32 height, u32 fg_color, u32 bg_color, u32 rop2);
 
 };
 
diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index d15a40cacb84..25e5703b6774 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -210,9 +210,9 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int source_base, unsigned int source_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
+		      unsigned int dest_base, unsigned int dest_pitch,
 		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
@@ -235,9 +235,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
  * @bColor: Background color (corresponding to a 0 in the monochrome data
  * @rop2: ROP value
  */
-int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
-		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
-		       u32 height, u32 fColor, u32 bColor, u32 rop2);
+int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
+		       u32 src_delta, u32 start_bit, u32 dest_base, u32 dest_pitch,
+		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 fg_color, u32 bg_color, u32 rop2);
 
 #endif
-- 
2.43.0

