Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7121A447
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 01:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781486952; cv=none; b=CAm8vXosUumQbUaJgjO2VoXzVmsSgqA0R2DTwxEw6w9QGFe1S4ApTNDfCSQCfFSyF1ZUvLr7jv08oiDuhrZ4zjFVg+FO2GPo8ugAPm8XSDiHC2zFL0F6uGpnpyxkQ8vIub9z1SXsfcwfx3oBX0nYa2fNvvOSWwl5jNXWwBIvbHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781486952; c=relaxed/simple;
	bh=VoiN+qLBR9B3HeLbsY+CTDz4NWYDpxjoXZy0bpB7eNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMwNCQpQ0zT68VJlVCeQK7vSZTa7jxNQ4b7+mB6DcO4Z21mqlcSofY/hQoehbu+OPhge0Cc5FnE4Q82UuTDAV1YYXM8wUYYV9t+QmB7E7VeTnAX6mVUn5uucZvrMMzmxy5UiQWoasIjpR1AY7gLA0bYt2pM4NYyTUkEBqOnniIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4traOPY; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4traOPY"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66049669d78so2625168d50.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 18:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781486950; x=1782091750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTjeij5sLwgES0f9hCPJ9GbQnA+7+YUnwk7xWCwfQo0=;
        b=X4traOPYkMD4olGie7zp6R+ZJY2hyNcq97+e2xpfKPM9CLfgy6D+o/Tu2AjFT488HK
         2N99rGonkgwIE9YhLpop/TKLD4nLk3vF7K6D15KfJ5Kgcpd5gapjaPqh2l195a/6EwGh
         HjKBxDsQszUgGO46HzsT1C2IhqTRQ4dCDy20h/LFh3SzV7Ja+zFFGl17TURFXWMoYjZY
         hEKbnnUjTAYZ30craqBbJ+LR3xYgml0YaLGbeoxU+P9lIB/BEUg3ZjXfyDfdzqFATgID
         dvJhL9RaUti7KP4S6GY2QE72wn//R3LV/QnDigavXroZ5WSzyriXXjwVoAgm+LEuXpsz
         0pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781486950; x=1782091750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTjeij5sLwgES0f9hCPJ9GbQnA+7+YUnwk7xWCwfQo0=;
        b=l0t0VhNP13nYy5i/qwyE2kB4Lwkggp6i4f6fZJjTYOwbKEcAn4qE6wGk0/z0/ZRY7F
         LgdQhUh+ULF9jdl7/XfQwU4SDkyoLXnSMdxebPLJcnWWBzUbLEPuohWZ2a/g8Etz2pbE
         A6TWIN0+fXb24MDmJLzI52M75Gt8DzMLaVN1LA7B6mS4G5Z05UkVJMr7ahqx2IvGQWpf
         glGl3VBuozicySqBxr0x9uy+e1NMwuVI9raKbzgfuNMyHtg5S6sV7e2B1+4DaxsBKZVk
         b+7bKUV5swplQkAy1t9E47BbiFOybzwN9nqCRHm5JTvHLMEWuNbUoJTkVGOJKlDocrpG
         iAKw==
X-Forwarded-Encrypted: i=1; AFNElJ83qpMBRj8onboRSIb8o8xWcMTqy0jb7rJs9qCgiesr6/aX/69qD3/a8s4mcUd59JuZIMgrd+gQDtrOAX0n@lists.linux.dev
X-Gm-Message-State: AOJu0YwvPnla8WtF25wJCdEarDEfR/9x8+QslAY5QXOr5b86l8t2fAoK
	lOJZIVjVsqn16WP7VgAr3U/LKrvkf8opHc4FFTzliGOayeO2tNvZoisc
X-Gm-Gg: Acq92OHfVCEdzZfP7j/+BkR2HLh5YtapWhcnLtJbM5LZEFet/ECxr79MIjRVlEOAMDA
	Rkh+6yk4xD+d0SaIYRxL03yr24uCxmt/uFz/ML3zmKW/lioZr5SqjYqHVfkt0fnYt/tWL5hVFdQ
	rRlWoKPe2eUnubDFaFp5wt6KN1Mkllgyq27l2p7MaplCvS/ILcTkHZkfUf+9ifGM4e1umAqcMMk
	2nSu6YmuvoNiSXZ6hShAtaXq4FAhPKAiA+LLmquJqn1pXu7yKYAm9F3+gC5quP+T4wEVaB66BN0
	KXCldTeRWMry3wGW+sJSu19SITaadFxhIyj12s8LPs53+Km5+UKFPYXsEbPVlDp5w5xiG7gWHPC
	p2h8PEJBAGW87CR3M4+/n69liM+KzWfRgkS35XZD68v5kxbbUbPoFMm+6IjIXTdndpYcp0gvqwu
	KYD1iaclQ6EVQMHlZOqL0/kw==
X-Received: by 2002:a05:690e:4805:b0:660:7b4d:1ac9 with SMTP id 956f58d0204a3-662782e2880mr7271458d50.38.1781486950556;
        Sun, 14 Jun 2026 18:29:10 -0700 (PDT)
Received: from localhost ([69.237.12.115])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274ae1ce4sm4227521d50.0.2026.06.14.18.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 18:29:08 -0700 (PDT)
From: Noah Adkins <noahcadkins@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Noah Adkins <noahcadkins@gmail.com>
Subject: [PATCH] staging: sm750fb: convert camelCase parameters to snake_case
Date: Sun, 14 Jun 2026 21:28:38 -0400
Message-ID: <20260615012837.90113-2-noahcadkins@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the camelCase parameters in the 2D acceleration helper
prototypes to snake_case to conform to the kernel coding style
and to make them consistent with the parameter names in the
corresponding implementations.

Issue found by checkpatch.

No functional change.

Signed-off-by: Noah Adkins <noahcadkins@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h | 37 ++++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index d15a40cacb84..0efb7cc00050 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -196,12 +196,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 
 /**
  * sm750_hm_copyarea
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @source_base: Address of source: offset in frame buffer
+ * @source_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
+ * @dest_base: Address of destination: offset in frame buffer
+ * @dest_pitch: Pitch value of destination surface in BYTE
  * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
@@ -210,34 +210,35 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int source_base, unsigned int source_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
+		      unsigned int d_base, unsigned int d_pitch,
 		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
 
 /**
  * sm750_hw_imageblit
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
+ * @src_buf: pointer to start of source buffer in system memory
+ * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
  *>-----      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
+ * @start_bit: Mono data can start at any bit in a byte, this value should be
  *>-----      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
+ * @dest_base: Address of destination: offset in frame buffer
+ * @dest_pitch: Pitch value of destination surface in BYTE
+ * @byte_per_pixel: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
  * @height: height of rectangle in pixel value
- * @fColor: Foreground color (corresponding to a 1 in the monochrome data
- * @bColor: Background color (corresponding to a 0 in the monochrome data
+ * @fg_color: Foreground color (corresponding to a 1 in the monochrome data
+ * @bg_color: Background color (corresponding to a 0 in the monochrome data
  * @rop2: ROP value
  */
-int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
-		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
-		       u32 height, u32 fColor, u32 bColor, u32 rop2);
+int sm750_hw_imageblit(struct lynx_accel *accel,
+		       const char *src_buf, u32 src_delta, u32 start_bit,
+		       u32 dest_base, u32 dest_pitch, u32 byte_per_pixel,
+		       u32 dx, u32 dy, u32 width, u32 height,
+		       u32 fg_color, u32 bg_color, u32 rop2);
 
 #endif
-- 
2.54.0

